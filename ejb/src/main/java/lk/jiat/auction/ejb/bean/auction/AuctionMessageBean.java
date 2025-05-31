package lk.jiat.auction.ejb.bean.auction;

import jakarta.ejb.ActivationConfigProperty;
import jakarta.ejb.MessageDriven;
import jakarta.jms.JMSException;
import jakarta.jms.Message;
import jakarta.jms.MessageListener;
import jakarta.jms.ObjectMessage;
import lk.jiat.auction.core.model.auction.Auction;

@MessageDriven(activationConfig = {
        @ActivationConfigProperty(propertyName = "destinationLookup",
                propertyValue = "jms/AuctionQueue"),
        @ActivationConfigProperty(propertyName = "destinationType",
                propertyValue = "jakarta.jms.Queue"),
        @ActivationConfigProperty(propertyName = "acknowledgeMode",
                propertyValue = "Auto-acknowledge")
})
public class AuctionMessageBean implements MessageListener {

    @Override
    public void onMessage(Message message) {
//        try {
//            //Auction auction = (Auction) ((ObjectMessage)message).getObject();
//
//            //System.out.println(auction.getTitle()+" "+" Created");
//            // Process auction creation notification
//        } catch (JMSException e) {
//            e.printStackTrace();
//        }
    }
}