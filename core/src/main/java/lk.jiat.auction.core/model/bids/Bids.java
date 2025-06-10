package lk.jiat.auction.core.model.bids;

import lk.jiat.auction.core.model.auction.Auction;
import lk.jiat.auction.core.model.auth.User;

import java.io.Serializable;
import java.math.BigDecimal;

public class Bids implements Serializable {
    private Long bidId;
    private BigDecimal amount;
    private BigDecimal maxBid;
    private BidStatus status;
    private User bidder;
    private Auction auction;

    public Bids() {
    }

    public Bids(Long bidId, BigDecimal amount, BigDecimal maxBid, User bidder,Auction auction,BidStatus status) {
        this.bidId = bidId;
        this.amount = amount;
        this.maxBid = maxBid;
        this.status = status;
        this.bidder = bidder;
        this.auction = auction;
    }

    public Auction getAuction() {
        return auction;
    }

    public void setAuction(Auction auction) {
        this.auction = auction;
    }

    public BidStatus getStatus() {
        return status;
    }

    public void setStatus(BidStatus status) {
        this.status = status;
    }

    public Long getBidId() {
        return bidId;
    }

    public void setBidId(Long bidId) {
        this.bidId = bidId;
    }

    public BigDecimal getAmount() {
        return amount;
    }

    public void setAmount(BigDecimal amount) {
        this.amount = amount;
    }

    public BigDecimal getMaxBid() {
        return maxBid;
    }

    public void setMaxBid(BigDecimal maxBid) {
        this.maxBid = maxBid;
    }

    public User getBidder() {
        return bidder;
    }

    public void setBidder(User bidder) {
        this.bidder = bidder;
    }
}
