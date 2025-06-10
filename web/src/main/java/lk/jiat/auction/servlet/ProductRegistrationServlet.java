package lk.jiat.auction.servlet;

import jakarta.ejb.EJB;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.jiat.auction.core.model.Product;
import lk.jiat.auction.ejb.remote.ProductService;


import java.io.IOException;
import java.math.BigDecimal;

@WebServlet("/register-product")
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024, // 1MB
        maxFileSize = 1024 * 1024 * 5,   // 5MB
        maxRequestSize = 1024 * 1024 * 10 // 10MB
)
public class ProductRegistrationServlet extends HttpServlet {

    @EJB
    private ProductService productService;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Forward to registration form
        request.getRequestDispatcher("product-registration.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Get form parameters
            String name = request.getParameter("name");
            BigDecimal price = new BigDecimal(request.getParameter("price"));
            String description = request.getParameter("description");
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            String category = request.getParameter("category");

            // Handle file upload
//            Part filePart = request.getPart("image");
//            String fileName = filePart.getSubmittedFileName();
//            String imagePath = "/uploads/" + fileName;
            // You'll need to implement file storage

            // Create product
            Product product = new Product();
            product.setName(name);
            product.setPrice(price.doubleValue());
            product.setDescription(description);
            product.setQuantity(quantity);
//            product.setCategory(category);
//            product.setImagePath(imagePath);

            // Save product
//            productService.registerProduct(product);
            productService.addProduct(product);
            // Redirect to success page
            response.sendRedirect(request.getContextPath() + "/registration-success.jsp");
        } catch (Exception e) {
            request.setAttribute("errorMessage", "Error registering product: " + e.getMessage());
            request.getRequestDispatcher("product-registration.jsp").forward(request, response);
        }
    }
}
