package lk.jiat.auction.core.dto;

import lk.jiat.auction.core.model.bids.BidStatus;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

public class LoadBidDTO implements Serializable {
    private Long id;
    private String title;
    private String description;
    private BigDecimal currentBid;
    private BidStatus status;
    private BigDecimal bidIncrement;
    private String imagePath;
    private Date endTime;
    private Long auctionId;

    public LoadBidDTO() {
    }

    public LoadBidDTO(Long id, String title, String description, BigDecimal currentBid, BidStatus status, BigDecimal bidIncrement,String imagePath,Date endTime,Long auctionId) {
        this.id = id;
        this.title = title;
        this.description = description;
        this.currentBid = currentBid;
        this.status = status;
        this.bidIncrement = bidIncrement;
        this.imagePath = imagePath;
        this.endTime = endTime;
        this.auctionId = auctionId;

    }

    public Long getAuctionId() {
        return auctionId;
    }

    public void setAuctionId(Long auctionId) {
        this.auctionId = auctionId;
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

    public String getImagePath() {
        return imagePath;
    }

    public void setImagePath(String imagePath) {
        this.imagePath = imagePath;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public BigDecimal getCurrentBid() {
        return currentBid;
    }

    public void setCurrentBid(BigDecimal currentBid) {
        this.currentBid = currentBid;
    }

    public BidStatus getStatus() {
        return status;
    }

    public void setStatus(BidStatus status) {
        this.status = status;
    }

    public BigDecimal getBidIncrement() {
        return bidIncrement;
    }

    public void setBidIncrement(BigDecimal bidIncrement) {
        this.bidIncrement = bidIncrement;
    }
}
