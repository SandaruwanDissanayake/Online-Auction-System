package lk.jiat.auction.ejb.repository;

import jakarta.annotation.PostConstruct;
import jakarta.ejb.Singleton;
import lk.jiat.auction.core.model.auction.Auction;
import lk.jiat.auction.core.model.auction.AuctionStatus;

import java.math.BigDecimal;
import java.util.*;
import java.util.concurrent.ConcurrentHashMap;

@Singleton
public class AuctionsRepo {
    private final Map<Long, Auction> AUCTION_MAP = new ConcurrentHashMap<>();

    @PostConstruct
    public void init() {
        AUCTION_MAP.put(1L, new Auction(
                1L,
                "Rolex Daytona 2023",
                "Brand new Rolex Daytona with original packaging",
                new BigDecimal("12500.00"),
                new BigDecimal("14200.00"),
                "auction_images/auction_6690962565718361241_1748545859568.webp",
                new Date(System.currentTimeMillis() - 86400000), // Started 1 day ago
                new Date(System.currentTimeMillis() + 86400000), // Ends in 1 day
                AuctionStatus.ACTIVE,
                null
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
                AuctionStatus.ACTIVE,
                null
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
                AuctionStatus.ACTIVE,
                null
        ));
    }

    public void save(Auction auction) {
        AUCTION_MAP.put(auction.getId(), auction);
    }

    public Optional<Auction> findById(Long id) {
        return Optional.ofNullable(AUCTION_MAP.get(id));
    }

    public void delete(Long id) {
        AUCTION_MAP.remove(id);
    }

    public List<Auction> findAll() {
        return new ArrayList<>(AUCTION_MAP.values());
    }
}
