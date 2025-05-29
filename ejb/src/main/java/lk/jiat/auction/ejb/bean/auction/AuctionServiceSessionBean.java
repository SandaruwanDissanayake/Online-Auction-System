package lk.jiat.auction.ejb.bean.auction;

import jakarta.annotation.Resource;
import jakarta.ejb.Stateless;
import jakarta.inject.Inject;
import jakarta.jms.*;
import jakarta.jms.Queue;
import lk.jiat.auction.core.model.auction.Auction;
import lk.jiat.auction.core.model.auction.AuctionStatus;
import lk.jiat.auction.ejb.remote.auctions.AuctionServices;

import java.math.BigDecimal;
import java.util.*;


@Stateless
public class AuctionServiceSessionBean implements AuctionServices {

    @Resource(lookup = "jms/AuctionConnectionFactory")
    private ConnectionFactory connectionFactory;

    @Resource(lookup = "jms/AuctionQueue")
    private Queue auctionQueue;

    private static final Map<Long, Auction> AUCTION_MAP = new HashMap<Long, Auction>();
    static {
        // Auction 1 - Luxury Watch
        AUCTION_MAP.put(1L, new Auction(
                1L,
                "Rolex Daytona 2023",
                "Brand new Rolex Daytona with original packaging",
                new BigDecimal("12500.00"),
                new BigDecimal("14200.00"),
                "auction_images/auction_6690962565718361241_1748545859568.webp",
                new Date(System.currentTimeMillis() - 86400000), // Started 1 day ago
                new Date(System.currentTimeMillis() + 86400000), // Ends in 1 day
                AuctionStatus.ACTIVE
        ));

        // Auction 2 - Designer Bag
        AUCTION_MAP.put(2L, new Auction(
                2L,
                "Hermès Birkin 25",
                "Authentic Hermès Birkin bag, Togo leather, Gold hardware",
                new BigDecimal("8500.00"),
                new BigDecimal("9200.00"),
                "auction_images/auction_6690962565718361241_1748545859568.webp",
                new Date(System.currentTimeMillis() - 172800000), // Started 2 days ago
                new Date(System.currentTimeMillis() + 259200000), // Ends in 3 days
                AuctionStatus.ACTIVE
        ));

        // Auction 3 - Vintage Watch
        AUCTION_MAP.put(3L, new Auction(
                3L,
                "Patek Philippe 1965",
                "Vintage Patek Philippe in mint condition",
                new BigDecimal("22000.00"),
                new BigDecimal("24500.00"),
                "auction_images/auction_6690962565718361241_1748545859568.webp",
                new Date(System.currentTimeMillis() - 432000000), // Started 5 days ago
                new Date(System.currentTimeMillis() + 86400000), // Ends in 1 day
                AuctionStatus.ACTIVE
        ));
    }


    @Override
    public void addAuction(Auction auction) {
        try (Connection connection = connectionFactory.createConnection();
             Session session = connection.createSession(false, Session.CLIENT_ACKNOWLEDGE)) {

            MessageProducer producer = session.createProducer(auctionQueue);
            ObjectMessage message = session.createObjectMessage();
            message.setObject(auction);

            Long auctionId = auction.getId();
            AUCTION_MAP.put(auctionId, auction);

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
    public Auction getAuction(int auctionId) {
        return null;
    }

    @Override
    public List<Auction> getAuctions() {
        return new ArrayList<Auction>(AUCTION_MAP.values());
    }
}
