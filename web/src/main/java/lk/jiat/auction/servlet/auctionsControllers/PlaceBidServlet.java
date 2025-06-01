package lk.jiat.auction.servlet.auctionsControllers;

import jakarta.annotation.Resource;
import jakarta.ejb.EJB;
import jakarta.jms.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lk.jiat.auction.core.dto.BidDTO;

import java.io.IOException;
import java.math.BigDecimal;

@WebServlet("/PlaceBidServlet")
@MultipartConfig
public class PlaceBidServlet extends HttpServlet {
    //@EJB
    //private BidService bidService;

    @Resource(lookup = "jms/AddBidConnectionFactory")
    private ConnectionFactory connectionFactory;

    @Resource(lookup = "jms/AddBidQueue")
    private Queue auctionQueue;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            Long auctionId = Long.parseLong(request.getParameter("auctionId"));
            BigDecimal amount = new BigDecimal(request.getParameter("bidAmount"));
            boolean isProxyBid = request.getParameter("proxyBid") != null;
            BigDecimal maxBid = isProxyBid ? new BigDecimal(request.getParameter("maxBid")) : amount;

            HttpSession session = request.getSession(false);
            String bidderEmail= session.getAttribute("email").toString();


            BidDTO bidDTO = new BidDTO();
            bidDTO.setAuctionId(auctionId);
            bidDTO.setAmount(amount);
            bidDTO.setProxyBid(isProxyBid);
            bidDTO.setBidderEmail(bidderEmail);


            try(Connection connection = connectionFactory.createConnection();
                Session jmsSession = connection.createSession(false, Session.AUTO_ACKNOWLEDGE)) {
                MessageProducer producer = jmsSession.createProducer(auctionQueue);
                ObjectMessage message = jmsSession.createObjectMessage(); // Create empty message
                message.setObject(bidDTO); // Then set the object
                producer.send(message);
                System.out.println("Sent bid for auction id "+ auctionId);
            }

            System.out.println(auctionId);
            System.out.println(maxBid);
            System.out.println(bidderEmail);
            response.sendRedirect(request.getContextPath()+"/loadBidderDashboard");

            //BidResult result = bidService.placeBid(auctionId, bidderId, amount, maxBid);

//            if (result.isSuccess()) {
//                response.sendRedirect(request.getContextPath() + "/auction-detail?id=" + auctionId + "&bidSuccess=true");
//            } else {
//                request.setAttribute("error", result.getMessage());
//                request.getRequestDispatcher("/place-bid?id=" + auctionId).forward(request, response);
//            }

        } catch (Exception e) {
            request.setAttribute("error", "Error placing bid: " + e.getMessage());
            request.getRequestDispatcher("/place-bid.jsp").forward(request, response);
        }
    }
}
