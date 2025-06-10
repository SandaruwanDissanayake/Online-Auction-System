package lk.jiat.auction.servlet.auctionsControllers;

import jakarta.annotation.Resource;

import jakarta.ejb.EJB;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import lk.jiat.auction.core.model.auction.Auction;
import lk.jiat.auction.ejb.remote.auctions.AuctionServices;
import org.apache.activemq.ActiveMQConnectionFactory;


import jakarta.jms.*;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.math.BigDecimal;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

@WebServlet(urlPatterns = "/CreateAuctionServlet")
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 1,    // 1 MB
        maxFileSize = 1024 * 1024 * 10,         // 10 MB
        maxRequestSize = 1024 * 1024 * 100      // 100 MB
)
public class CreateAuctionServlet extends HttpServlet {

    @EJB
    private AuctionServices auctionServices;

    private static final String UPLOAD_DIR = "auction_images";

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


        try {
            Auction auction = new Auction();
            Long auctionID = Math.abs(UUID.randomUUID().getMostSignificantBits());
            auction.setId(auctionID);
            auction.setTitle(req.getParameter("title"));
            auction.setDescription(req.getParameter("description"));
            auction.setStartingPrice(new BigDecimal(req.getParameter("startingPrice")));

            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
            auction.setEndTime(dateFormat.parse(req.getParameter("endTime")));

            Part filePart = req.getPart("itemImage");
            if (filePart != null && filePart.getSize() > 0) {
                String imagePath = handleImageUpload(filePart, auctionID);
                auction.setImagePath(imagePath);
            }
            auction.setLastBidderEmail(null);


            System.out.println(auction.getTitle());
            auctionServices.addAuction(auction);
            System.out.println("Servlet call");

            // Set success message
            req.getSession().setAttribute("message", "Auction created successfully!");
        } catch (Exception e) {
            req.getSession().setAttribute("error", "Error creating auction: " + e.getMessage());
        }
        resp.sendRedirect("auctioneer/dashboard.jsp");

    }

    private String handleImageUpload(Part filePart, Long auctionId) throws IOException {
        // 1. Get application root path
        String appPath = getServletContext().getRealPath("");
        String uploadPath = appPath + File.separator + UPLOAD_DIR;

        // 2. Create upload directory if it doesn't exist
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs();
        }

        // 3. Generate unique filename
        String fileName = "auction_" + auctionId + "_" + System.currentTimeMillis() +
                getFileExtension(filePart.getSubmittedFileName());

        // 4. Save file
        try (InputStream fileContent = filePart.getInputStream()) {
            File file = new File(uploadPath + File.separator + fileName);
            Files.copy(fileContent, file.toPath(), StandardCopyOption.REPLACE_EXISTING);
        }

        // 5. Return relative path for database storage
        return UPLOAD_DIR + "/" + fileName;
    }

    private String getFileExtension(String fileName) {
        if (fileName == null) return "";
        int lastDot = fileName.lastIndexOf(".");
        if (lastDot > 0) {
            return fileName.substring(lastDot);
        }
        return "";
    }
}
