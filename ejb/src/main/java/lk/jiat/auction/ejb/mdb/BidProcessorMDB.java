package lk.jiat.auction.ejb.mdb;

import jakarta.ejb.ActivationConfigProperty;
import jakarta.ejb.EJB;
import jakarta.ejb.MessageDriven;
import jakarta.jms.Message;
import jakarta.jms.MessageListener;
import jakarta.jms.ObjectMessage;
import lk.jiat.auction.core.dto.BidDTO;
import lk.jiat.auction.core.model.bids.Bids;
import lk.jiat.auction.ejb.bean.bids.BidsServiceSessionBean;
import lk.jiat.auction.ejb.remote.bids.BidsServices;

import java.util.List;


@MessageDriven(activationConfig = {
        @ActivationConfigProperty(propertyName = "destinationLookup",
                propertyValue = "jms/AddBidQueue"),
})
public class BidProcessorMDB implements MessageListener {

    @EJB
    private BidsServices bidsServices;

    @Override
    public void onMessage(Message message) {
        try {
            if (message instanceof ObjectMessage) {
                Object obj = ((ObjectMessage)message).getObject();
                if (obj instanceof BidDTO) {
                    BidDTO bidDTO = (BidDTO) obj;
                    System.out.println("Bid processed: " + bidDTO.getBidderEmail());
                    System.out.println(bidDTO.getAmount());
                    System.out.println(bidDTO.isProxyBid());
                    System.out.println(bidDTO.getAuctionId());
                    // Process the bid
                    //bidService.processBid(bidDTO);
                    boolean isCreateBid= bidsServices.createBids(bidDTO);
                    if(isCreateBid){
                        System.out.println("Bids created");
                    }else {
                        System.out.println("Bids not created");

                        List<Bids> bids= bidsServices.getAllBids();
                        for (Bids bid : bids) {
                            System.out.println(bid.getBidId() + " " + bid.getStatus() + " " + bid.getBidder().getEmail() + "..................... Bids Data");
                        }
                    }

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
