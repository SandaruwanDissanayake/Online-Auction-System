package lk.jiat.auction.ejb.mdb;

import jakarta.ejb.ActivationConfigProperty;
import jakarta.ejb.EJB;
import jakarta.ejb.MessageDriven;
import jakarta.jms.Message;
import jakarta.jms.MessageListener;
import jakarta.jms.ObjectMessage;
import lk.jiat.auction.core.dto.BidDTO;
import lk.jiat.auction.core.dto.UpdateBidDTO;
import lk.jiat.auction.core.model.auction.Auction;
import lk.jiat.auction.core.model.bids.Bids;
import lk.jiat.auction.core.notificationSocket.BrodcastUtil;
import lk.jiat.auction.ejb.remote.auctions.AuctionServices;
import lk.jiat.auction.ejb.remote.bids.BidsServices;

import java.math.BigDecimal;
import java.util.List;

@MessageDriven(activationConfig = {
        @ActivationConfigProperty(propertyName = "destinationLookup",
                propertyValue = "jms/UpdateBidQueue"),
})
public class UpdateBidProcessMDB implements MessageListener {

    @EJB
    private BidsServices bidsServices;

    @EJB
    private AuctionServices auctionServices;


    @Override
    public void onMessage(Message message) {
        try {
            if (message instanceof ObjectMessage) {
                Object obj = ((ObjectMessage)message).getObject();
                if (obj instanceof UpdateBidDTO updateBidDTO) {

                    System.out.println("Update MDB  Trigger......................"+updateBidDTO.getBidId()+" "+updateBidDTO.getAuctionId()+" "+updateBidDTO.getAmount());

                    boolean isUpdate= bidsServices.updateBids(updateBidDTO);
                    if(isUpdate){
                        Auction auction=auctionServices.getAuction(updateBidDTO.getAuctionId());
                        BigDecimal currentbid=auction.getCurrentBid();


                        BrodcastUtil.sendBrodcastCurrentBid(currentbid,updateBidDTO.getAuctionId());

                        System.out.println("UpdateBidProcessMDB: bids updated................");
                    }


                    // Process the bid
                    //bidService.processBid(bidDTO);
//                    boolean isCreateBid= bidsServices.createBids(bidDTO);
//                    if(isCreateBid){
//                        Auction auction=auctionServices.getAuction(bidDTO.getAuctionId());
//                        BigDecimal currentBid= auction.getCurrentBid();
//                        System.out.println("Bids created");
//
//                        BrodcastUtil.sendBrodcastCurrentBid(currentBid,auction.getId());
//
//
//
//                        List<Bids> bids= bidsServices.getAllBids();
//                        for (Bids bid : bids) {
//                            System.out.println(bid.getBidId() + " " + bid.getStatus() + " " + bid.getBidder().getEmail() + "..................... Bids Data");
//                        }
//                    }else {
//                        System.out.println("Bids not created");
//
//
//                    }

                } else {
                    System.err.println("Received wrong message type: " + obj.getClass());
                }
            }
        } catch(Exception e) {
            System.err.println("Error processing bid: " + e.getMessage());
            // Consider dead-letter queue for failed messages
        }
    }
}
