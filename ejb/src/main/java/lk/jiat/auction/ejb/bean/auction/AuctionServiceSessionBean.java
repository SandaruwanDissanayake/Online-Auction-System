package lk.jiat.auction.ejb.bean.auction;

import jakarta.annotation.Resource;
import jakarta.ejb.Stateless;
import jakarta.inject.Inject;
import jakarta.jms.*;
import jakarta.jms.Queue;
import lk.jiat.auction.core.model.auction.Auction;
import lk.jiat.auction.ejb.remote.auctions.AuctionServices;
import lk.jiat.auction.ejb.repository.AuctionsRepo;

import java.math.BigDecimal;
import java.util.*;


@Stateless
public class AuctionServiceSessionBean implements AuctionServices {

    @Resource(lookup = "jms/AuctionConnectionFactory")
    private ConnectionFactory connectionFactory;

    @Resource(lookup = "jms/AuctionQueue")
    private Queue auctionQueue;

    @Inject
    private AuctionsRepo auctionsRepo;


    @Override
    public void addAuction(Auction auction) {
        try (

                Connection connection = connectionFactory.createConnection();
             Session session = connection.createSession(false, Session.CLIENT_ACKNOWLEDGE))
        {

            MessageProducer producer = session.createProducer(auctionQueue);
            ObjectMessage message = session.createObjectMessage();
            message.setObject(auction);

            auctionsRepo.save(auction);

            producer.send(message);
            System.out.println("Auction sent with client acknowledgment");
        } catch (JMSException e) {
            throw new RuntimeException("Failed to send auction message", e);
        }
    }

    @Override
    public void removeAuction(Auction auction) {


    }

    @Override
    public Auction getAuction(Long auctionId) {
        System.out.println("Getting auction with id " + auctionId);
        return auctionsRepo.findById(auctionId)
                .orElseThrow(() -> new NoSuchElementException("Auction not found for id: " + auctionId));
    }

    @Override
    public List<Auction> getAuctions() {

        return new ArrayList<Auction>(auctionsRepo.findAll());
    }

    @Override
    public Auction updateAuction(Long auctionId, BigDecimal amount,String email) {
       return auctionsRepo.updateAuctionCurrentBid(auctionId, amount, email);

    }

    @Override
    public List<Auction> getAuctionsByWithoutEmail(String email) {

        return auctionsRepo.getAuctionsByWithoutEmail(email);
    }
}
