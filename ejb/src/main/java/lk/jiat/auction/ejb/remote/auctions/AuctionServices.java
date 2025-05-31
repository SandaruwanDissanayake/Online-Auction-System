package lk.jiat.auction.ejb.remote.auctions;


import jakarta.ejb.Remote;
import lk.jiat.auction.core.model.auction.Auction;

import java.util.List;

@Remote
public interface AuctionServices {
    void addAuction(Auction auction);
    void removeAuction(Auction auction);
    Auction getAuction(Long auctionId);
    List<Auction> getAuctions();
}
