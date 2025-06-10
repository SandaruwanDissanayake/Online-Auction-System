package lk.jiat.auction.servlet.auctionsControllers;


import jakarta.ejb.EJB;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.jiat.auction.core.dto.LoadBidDTO;
import lk.jiat.auction.core.model.auction.Auction;
import lk.jiat.auction.core.model.bids.BidStatus;
import lk.jiat.auction.core.model.bids.Bids;
import lk.jiat.auction.ejb.remote.auctions.AuctionServices;
import lk.jiat.auction.ejb.remote.bids.BidsServices;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.Date;
import java.util.concurrent.TimeUnit;

@WebServlet("/loadNewBidScreen")
public class LoadNewBidScreen extends HttpServlet {
    @EJB
    AuctionServices auctionServices;
    @EJB
    BidsServices bidsServices;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Long bidId = Long.valueOf(req.getParameter("bidId"));
        //Auction auction = auctionServices.getAuction(auctionId);

        System.out.println("bidId = " + bidId);

        Bids bids=bidsServices.getBids(bidId);

        System.out.println("bids = " + bids.getAuction().getTitle());
        if(bids != null){
            LoadBidDTO loadBidDTO=new LoadBidDTO();

            System.out.println("bids: "+bids.getBidId());

            Auction auction= auctionServices.getAuction(bids.getAuction().getId());

            loadBidDTO.setId(bids.getBidId());
            loadBidDTO.setCurrentBid(auction.getCurrentBid());
            loadBidDTO.setImagePath(auction.getImagePath());
            loadBidDTO.setTitle(auction.getTitle());
            loadBidDTO.setDescription(auction.getDescription());
            loadBidDTO.setAuctionId(bids.getAuction().getId());
            System.out.println("Bid Id"+bids.getBidId());
            System.out.println("Auction Id: "+bids.getAuction().getId());

            if (auction.getBidIncrement()==null){
                loadBidDTO.setBidIncrement(new BigDecimal("500.00"));
            }else {
                loadBidDTO.setBidIncrement(auction.getBidIncrement());
            }
            loadBidDTO.setStatus(BidStatus.OUTBID);
            loadBidDTO.setEndTime(auction.getEndTime());

            String timeRemaining = calculateTimeRemaining(auction.getEndTime());
            req.setAttribute("timeRemaining", timeRemaining);

            req.setAttribute("auction", loadBidDTO);
            req.getRequestDispatcher("bidder/update-bid.jsp").forward(req, resp);

        }else {
            req.setAttribute("error", "Auction not found");
            req.getRequestDispatcher("bidder/update-bid.jsp").forward(req, resp);
        }

    }

    private String calculateTimeRemaining(Date endTime) {
        long diff = endTime.getTime() - System.currentTimeMillis();

        if (diff <= 0) return "Ended";

        long days = TimeUnit.MILLISECONDS.toDays(diff);
        long hours = TimeUnit.MILLISECONDS.toHours(diff) % 24;
        long minutes = TimeUnit.MILLISECONDS.toMinutes(diff) % 60;

        if (days > 0) {
            return String.format("%dd %dh", days, hours);
        } else if (hours > 0) {
            return String.format("%dh %dm", hours, minutes);
        } else {
            return String.format("%dm", minutes);
        }
    }
}
