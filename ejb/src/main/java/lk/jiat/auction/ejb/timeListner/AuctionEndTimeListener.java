package lk.jiat.auction.ejb.timeListner;

import jakarta.ejb.EJB;
import jakarta.ejb.Schedule;
import jakarta.ejb.Singleton;
import jakarta.ejb.Startup;
import lk.jiat.auction.core.model.auction.Auction;
import lk.jiat.auction.core.model.auction.AuctionStatus;
import lk.jiat.auction.core.notificationSocket.BrodcastUtil;
import lk.jiat.auction.ejb.remote.auctions.AuctionServices;

import java.util.Date;
import java.util.List;
import java.util.logging.Logger;

@Singleton
@Startup
public class AuctionEndTimeListener {
    private static final Logger LOG = Logger.getLogger(AuctionEndTimeListener.class.getName());
    private static final boolean DEBUG_MODE = true;
    private long lastExecutionTime = 0;
    @EJB
    private AuctionServices auctionServices;
    @Schedule(second = "*/1", minute = "*", hour = "*", persistent = false)
    public void checkAndCloseEndedAuctions() {
        if(DEBUG_MODE) {
            long startTime = System.currentTimeMillis();
            if(lastExecutionTime > 0) {
                LOG.fine("Time since last execution: " + (startTime - lastExecutionTime) + "ms");
            }
            lastExecutionTime = startTime;
        }

        Date now = new Date();
        List<Auction> activeAuctions = auctionServices.getAuctions(); // Should implement this method

//        if(DEBUG_MODE) {
//            LOG.info("Checking " + activeAuctions.size() + " active auctions at " + now);
//        }

        for (Auction auction : activeAuctions) {
            try {
                if (now.after(auction.getEndTime())) {
                    // Update auction status
                  // auction.setStatus(AuctionStatus.CLOSED);
                    auctionServices.updateStatus(auction.getId(),AuctionStatus.CLOSED);

                    //LOG.info("Closed auction ID: " + auction.getId() +
                            //" | End time was: " + auction.getEndTime());

                    // Add post-closing logic
                    // notifyWinner(auction);
                    // processPayment(auction);
                } else if(DEBUG_MODE) {
                    long remainingMs = auction.getEndTime().getTime() - now.getTime();
                    //LOG.fine("Auction ID: " + auction.getId() +
                            //" still active. Ends in: " + formatRemainingTime(remainingMs));
                    //System.out.println("Auction ID: " + auction.getId()+ "still active . Ends in : " + formatRemainingTime(remainingMs));
                    BrodcastUtil.sendauctionEndTime(auction.getId(),formatRemainingTime(remainingMs));
                }
            } catch (Exception e) {
                LOG.severe("Error processing auction ID: " + auction.getId() +
                        " - " + e.getMessage());
            }
        }
    }

    // Helper method for debugging
    private String formatRemainingTime(long milliseconds) {
        long seconds = milliseconds / 1000;
        long minutes = seconds / 60;
        long hours = minutes / 60;
        long days = hours / 24;

        return String.format("%dd %dh %dm %ds",
                days, hours % 24, minutes % 60, seconds % 60);
    }
}