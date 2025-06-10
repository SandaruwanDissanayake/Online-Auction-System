package lk.jiat.auction.servlet.guiHelper;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/load-content")
public class ContentLoaderServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String content = request.getParameter("content");

        if ("add-auction".equals(content)) {
            request.getRequestDispatcher("/WEB-INF/add-auction-content.jsp").forward(request, response);
        } else {
            request.getRequestDispatcher("/WEB-INF/dashboard-content.jsp").forward(request, response);
        }
    }
}
