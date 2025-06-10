package lk.jiat.auction.servlet.auth;

import jakarta.ejb.EJB;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lk.jiat.auction.ejb.remote.UserService;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(urlPatterns = "/login")
public class LoginServlet extends HttpServlet {
    @EJB
    private UserService userServiceBean;


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        try {
            String username = req.getParameter("username");
            String password = req.getParameter("password");

            userServiceBean.login(username, password);

            HttpSession session = req.getSession();
            session.setAttribute("email", username);
            session.setAttribute("role",
                    userServiceBean.isAuctioneer(username) ? "AUCTIONEER" : "BIDDER");

            String redirect = userServiceBean.isAuctioneer(username)
                    ? "auctioneer/dashboard.jsp"
                    : "loadBidderDashboard";
            resp.sendRedirect(redirect);

        } catch (Exception e) {
            req.setAttribute("error", "Invalid credentials");
            req.getRequestDispatcher("auth/login.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("auth/login.jsp").forward(req, resp);
    }
}
