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
import java.math.BigDecimal;
import java.util.Date;
import java.util.concurrent.TimeUnit;

@WebServlet("/loadBidScreen")
public class LoadPlaceBidPage extends HttpServlet {
    @EJB
    AuctionServices auctionServices;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Long auctionId = Long.valueOf(req.getParameter("id"));
        Auction auction = auctionServices.getAuction(auctionId);

        if(auction != null){
            // Set a default bid increment if not already set
            if(auction.getBidIncrement() == null) {
                auction.setBidIncrement(new BigDecimal("500.00")); // Default increment
            }

            // Calculate time remaining
            String timeRemaining = calculateTimeRemaining(auction.getEndTime());
            req.setAttribute("timeRemaining", timeRemaining);

            req.setAttribute("auction", auction);
            req.getRequestDispatcher("bidder/place-bid.jsp").forward(req, resp);
        } else {
            req.setAttribute("error", "Auction not found");
            req.getRequestDispatcher("bidder/place-bid.jsp").forward(req, resp);
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
