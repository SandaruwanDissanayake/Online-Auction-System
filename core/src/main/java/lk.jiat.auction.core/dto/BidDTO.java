package lk.jiat.auction.core.dto;

import java.io.Serializable;
import java.math.BigDecimal;

public class BidDTO implements Serializable {
    private Long auctionId;
    private BigDecimal amount;
    private BigDecimal maxBid;
    private String bidderEmail;
    private boolean isProxyBid;

    public BidDTO() {
    }

    public BidDTO(Long auctionId, BigDecimal amount, BigDecimal maxBid, String bidderEmail, boolean isProxyBid) {
        this.auctionId = auctionId;
        this.amount = amount;
        this.maxBid = maxBid;
        this.bidderEmail = bidderEmail;
        this.isProxyBid = isProxyBid;
    }

    public Long getAuctionId() {
        return auctionId;
    }

    public void setAuctionId(Long auctionId) {
        this.auctionId = auctionId;
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

    public String getBidderEmail() {
        return bidderEmail;
    }

    public void setBidderEmail(String bidderEmail) {
        this.bidderEmail = bidderEmail;
    }

    public boolean isProxyBid() {
        return isProxyBid;
    }

    public void setProxyBid(boolean proxyBid) {
        isProxyBid = proxyBid;
    }
}
