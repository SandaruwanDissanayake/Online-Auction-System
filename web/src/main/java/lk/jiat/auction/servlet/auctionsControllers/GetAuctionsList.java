package lk.jiat.auction.servlet.auctionsControllers;

import com.fasterxml.jackson.databind.ObjectMapper;
import jakarta.ejb.EJB;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lk.jiat.auction.core.model.auction.Auction;
import lk.jiat.auction.core.model.bids.Bids;
import lk.jiat.auction.ejb.remote.auctions.AuctionServices;
import lk.jiat.auction.ejb.remote.bids.BidsServices;

import java.io.IOException;
import java.util.List;

@WebServlet("/loadBidderDashboard")
public class GetAuctionsList extends HttpServlet {

    @EJB
    private AuctionServices auctionServices;
    @EJB
    private BidsServices bidsServices;
    private static final String DEFAULT_IMAGE = "https://images.unsplash.com/photo-1523275335684-37898b6baf30?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1999&q=80";
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        String email= session.getAttribute("email").toString();
        List<Auction> auctions = auctionServices.getAuctionsByWithoutEmail(email);
        for (Auction auction : auctions) {
            if (auction.getImagePath() == null || auction.getImagePath().isEmpty()) {
                auction.setImagePath(DEFAULT_IMAGE);
            }
        }

        List<Bids> bids=bidsServices.getBidsByUserId(email);

        // Line ~37 in GetAuctionsList.java

        for (Bids bid : bids) {
            Auction bidAuction = bid.getAuction();
            if (bidAuction != null && (bidAuction.getImagePath() == null || bidAuction.getImagePath().isEmpty())) {
                bidAuction.setImagePath(DEFAULT_IMAGE);
            }
        }

        req.setAttribute("bids", bids);
        req.setAttribute("auctions", auctions);
        req.getRequestDispatcher("bidder/dashboard.jsp").forward(req, resp);
    }
}
