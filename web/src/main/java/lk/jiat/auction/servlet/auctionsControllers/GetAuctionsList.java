package lk.jiat.auction.servlet.auctionsControllers;

import jakarta.ejb.EJB;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.jiat.auction.core.model.auction.Auction;
import lk.jiat.auction.ejb.remote.auctions.AuctionServices;

import java.io.IOException;
import java.util.List;

@WebServlet("/loadBidderDashboard")
public class GetAuctionsList extends HttpServlet {

    @EJB
    private AuctionServices auctionServices;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Auction> auctions = auctionServices.getAuctions();
        for (Auction auction : auctions) {
            System.out.println(auction.getDescription());
        }
        req.setAttribute("auctions", auctions);
        req.getRequestDispatcher("bidder/dashboard.jsp").forward(req, resp);
    }
}
