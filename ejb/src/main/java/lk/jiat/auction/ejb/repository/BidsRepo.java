package lk.jiat.auction.ejb.repository;

import jakarta.annotation.PostConstruct;
import jakarta.ejb.Singleton;
import lk.jiat.auction.core.model.auction.Auction;
import lk.jiat.auction.core.model.auction.AuctionStatus;
import lk.jiat.auction.core.model.auth.User;
import lk.jiat.auction.core.model.bids.BidStatus;
import lk.jiat.auction.core.model.bids.Bids;

import java.math.BigDecimal;
import java.util.*;
import java.util.concurrent.ConcurrentHashMap;
import java.util.stream.Collectors;

@Singleton
public class BidsRepo {

    private final Map<Long, Bids> BIDS_MAP = new ConcurrentHashMap<>();

    @PostConstruct
    public void init() {
        // Sample bidder users
        User bidder1 = new User(
                "1", "bidder1", "abc123", "bidder@email.com",
                "0765656745", "Colombo", "BIDDER", true
        );

        User bidder2 = new User(
                "2", "bidder2", "abc123", "bidder2@email.com",
                "0771234567", "Kandy", "BIDDER", true
        );

        User bidder3 = new User(
                "3", "bidder3", "abc123", "bidder3@email.com",
                "0789876543", "Galle", "BIDDER", true
        );
        Auction auction1 = new Auction(
                3L,
                "Patek Philippe 1965",
                "Vintage Patek Philippe in mint condition",
                new BigDecimal("22000.00"),
                new BigDecimal("24500.00"),
                "auction_images/auction_6690962565718361241_1748545859568.webp",
                new Date(System.currentTimeMillis() - 432000000), // Started 5 days ago
                new Date(System.currentTimeMillis() + 86400000), // Ends in 1 day
                AuctionStatus.ACTIVE,
                null
        );
        Auction auction2 = new Auction(
                2L,
                "Hermès Birkin 25",
                "Authentic Hermès Birkin bag, Togo leather, Gold hardware",
                new BigDecimal("8500.00"),
                new BigDecimal("9200.00"),
                "auction_images/auction_6690962565718361241_1748545859568.webp",
                new Date(System.currentTimeMillis() - 172800000), // Started 2 days ago
                new Date(System.currentTimeMillis() + 259200000), // Ends in 3 days
                AuctionStatus.ACTIVE,
                null
        );

        // Sample bids data
        BIDS_MAP.put(1L, new Bids(
                1L,
                new BigDecimal("1300.00"),
                new BigDecimal("1500.00"),
                bidder1,
                auction1,
                BidStatus.PENDING
        ));

        BIDS_MAP.put(2L, new Bids(
                2L,
                new BigDecimal("2500.00"),
                new BigDecimal("3000.00"),
                bidder2,
                auction1,
                BidStatus.WINNING
        ));

        BIDS_MAP.put(3L, new Bids(
                3L,
                new BigDecimal("1800.00"),
                new BigDecimal("2000.00"),
                bidder3,
                auction1,
                BidStatus.OUTBID
        ));

        BIDS_MAP.put(4L, new Bids(
                4L,
                new BigDecimal("3200.00"),
                new BigDecimal("3500.00"),
                bidder1,
                auction2,
                BidStatus.PENDING
        ));

        BIDS_MAP.put(5L, new Bids(
                5L,
                new BigDecimal("4200.00"),
                new BigDecimal("4500.00"),
                bidder2,
                auction1,
                BidStatus.WINNING
        ));
    }

    // Add repository methods here
    public Optional<Bids> findById(Long id) {
        return Optional.ofNullable(BIDS_MAP.get(id));
    }

    public boolean save(Bids bid) {
        BIDS_MAP.put(bid.getBidId(), bid);

        System.out.println(".......................................................................................");

//        System.out.println(bid.getAuction().getTitle());
        //System.out.println(bid.getBidder().getEmail());
       // System.out.println(bid.getAmount());

       // System.out.println(".......................................................................................");

        return true;
    }

    public List<Bids> findAll() {
        return new ArrayList<>(BIDS_MAP.values());
    }
    public Bids findByBidId(Long id) {
        return BIDS_MAP.get(id);
    }

    public List<Bids> findByBidStatus(BidStatus bidStatus) {
        return BIDS_MAP.values().stream()
                .filter(bid -> bid.getStatus() == bidStatus)
                .collect(Collectors.toList());
    }

    public List<Bids> findByBidderEmail(String email) {
        return BIDS_MAP.values().stream()
                .filter(bid -> bid.getBidder().getEmail().equalsIgnoreCase(email))
                .collect(Collectors.toList());
    }
    public boolean updateBidsStatusByUserEmail(String email, BidStatus status) {
        // Find all bids by the user email
        List<Bids> userBids = BIDS_MAP.values().stream()
                .filter(bid -> bid.getBidder().getEmail().equalsIgnoreCase(email))
                .collect(Collectors.toList());

        // If no bids found for this user, return false
        if (userBids.isEmpty()) {
            System.out.println("User Is Empty");
            return false;
        }

        // Update status for each bid
        userBids.forEach(bid -> bid.setStatus(status));

        // Update the bids in the map
        userBids.forEach(bid -> BIDS_MAP.put(bid.getBidId(), bid));

        return true;
    }
}
