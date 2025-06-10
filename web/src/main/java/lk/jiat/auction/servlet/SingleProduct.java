package lk.jiat.auction.servlet;

import jakarta.ejb.EJB;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.jiat.auction.core.model.Product;
import lk.jiat.auction.ejb.remote.ProductService;


import java.io.IOException;

@WebServlet("/single-product")
public class SingleProduct extends HttpServlet {

    @EJB
    private ProductService productService;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String id = request.getParameter("id");
        if (id == null || id.isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing product ID");
            return;
        }

        try {
            Product product = productService.getProductById(Integer.parseInt(id));
            request.setAttribute("product", product);
            request.getRequestDispatcher("single-product.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid product ID");
        }
    }
}
