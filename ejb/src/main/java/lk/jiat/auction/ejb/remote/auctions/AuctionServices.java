package lk.jiat.auction.ejb.remote.auctions;


import jakarta.ejb.Remote;
import lk.jiat.auction.core.model.auction.Auction;
import lk.jiat.auction.core.model.auction.AuctionStatus;

import java.math.BigDecimal;
import java.util.List;

@Remote
public interface AuctionServices {
    void addAuction(Auction auction);
    void removeAuction(Auction auction);
    Auction getAuction(Long auctionId);
    List<Auction> getAuctions();
    Auction updateAuction(Long auctionId, BigDecimal amount, String email);
    List<Auction>getAuctionsByWithoutEmail(String email);
    void updateStatus(Long auctionId, AuctionStatus status);
}
