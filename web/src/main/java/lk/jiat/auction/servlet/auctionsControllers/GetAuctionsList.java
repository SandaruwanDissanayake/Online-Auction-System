package lk.jiat.auction.servlet.auctionsControllers;

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

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Auction> auctions = auctionServices.getAuctions();
        for (Auction auction : auctions) {
            System.out.println(auction.getId());
        }
        HttpSession session = req.getSession(false);
        String email= session.getAttribute("email").toString();
        List<Bids> bids=bidsServices.getBidsByUserId(email);
        for (Bids bid : bids) {
            System.out.println(bid.getAuction().getTitle()+" "+bid.getBidId()+" "+bid.getStatus()+" "+bid.getBidder().getEmail()+"..................... Bids Data");
        }
        req.setAttribute("auctions", auctions);
        req.getRequestDispatcher("bidder/dashboard.jsp").forward(req, resp);
    }
}
