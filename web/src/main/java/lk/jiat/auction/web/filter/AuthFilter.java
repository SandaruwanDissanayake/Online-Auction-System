package lk.jiat.auction.web.filter;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter("/*")
public class AuthFilter implements Filter {

    private static final String[] ALLOWED_PATHS = {
            "/login",
            "/login.jsp",
            "/assets/",
            "/error/",
            "/javax.faces.resource/",
            "/index.jsp",
            "/welcome.jsp"// If using JSF
    };

    @Override
    public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) res;
        String path = request.getRequestURI().substring(request.getContextPath().length());

        // Skip filter for allowed paths
        if (isAllowed(path)) {
            chain.doFilter(request, response);
            return;
        }

        HttpSession session = request.getSession(false);

        // Redirect to login if not authenticated
        if (session == null || session.getAttribute("email") == null) {
            // Determine the appropriate login page based on the path
            String loginPage = (path.startsWith("/auctioneer") || path.startsWith("/bidder"))
                    ? "/auth/login.jsp"
                    : request.getContextPath() + "/login";

            response.sendRedirect(loginPage);
            return;
        }

        // Role-based access control
        String role = (String) session.getAttribute("role");

        if (path.startsWith("/auctioneer/") && !"AUCTIONEER".equals(role)) {
            //response.sendError(HttpServletResponse.SC_FORBIDDEN);
            response.sendRedirect(request.getContextPath() + "login");
            return;
        }

        if (path.startsWith("/bidder/") && !"BIDDER".equals(role)) {
            response.sendError(HttpServletResponse.SC_FORBIDDEN);
            return;
        }


        chain.doFilter(request, response);
    }

    private boolean isAllowed(String path) {
        // More robust path matching
        if (path.equals("/") || path.equals("/index.jsp")) {
            return true;
        }

        for (String allowedPath : ALLOWED_PATHS) {
            if (path.startsWith(allowedPath)) {
                return true;
            }
        }
        return false;
    }

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {}

    @Override
    public void destroy() {}
}