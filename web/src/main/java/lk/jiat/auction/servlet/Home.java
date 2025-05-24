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
import java.io.PrintWriter;
import java.util.List;

@WebServlet("/home")
public class Home extends HttpServlet {

    @EJB
    private ProductService productService;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Product> products = productService.getAllProducts();
        req.setAttribute("products", products);
        req.getRequestDispatcher("product.jsp").forward(req, resp);

    }
}
