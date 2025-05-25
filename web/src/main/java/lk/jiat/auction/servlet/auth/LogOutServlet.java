package lk.jiat.auction.servlet.auth;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(urlPatterns = "/logout")
public class LogOutServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false); // Get existing session, don't create new

        if (session != null) {
            // Remove all session attributes
            session.removeAttribute("email");
            session.removeAttribute("username"); // Also remove username if exists
            session.invalidate(); // This makes the session unusable

            // Optional: Set header to prevent caching of protected pages
            resp.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
            resp.setHeader("Pragma", "no-cache");
            resp.setHeader("Expires", "0");
        }

        // Redirect to login page or home page
        resp.sendRedirect(req.getContextPath() + "/auth/login.jsp");
    }
}
