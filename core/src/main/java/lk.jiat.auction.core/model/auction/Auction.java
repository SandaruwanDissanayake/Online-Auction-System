package lk.jiat.auction.core.model.auction;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;


public class Auction implements Serializable {
    private Long id;
    private String title;
    private String description;
    private BigDecimal startingPrice;
    private BigDecimal currentBid = BigDecimal.ZERO.setScale(2);
    private String imagePath;
    private Date startTime;
    private Date endTime;
    private AuctionStatus status =AuctionStatus.ACTIVE;
    private BigDecimal bidIncrement;
    private String lastBidderEmail;
    public Auction() {
    }

    public Auction(Long id, String title, String description, BigDecimal startingPrice, BigDecimal currentBid, String imagePath,  Date startTime, Date endTime, AuctionStatus status,String lastBidderEmail) {
        this.id = id;
        this.title = title;
        this.description = description;
        this.startingPrice = startingPrice;
        this.currentBid = currentBid;
        this.startTime = startTime;
        this.imagePath=imagePath;
        this.endTime = endTime;
        this.status = status;
        this.lastBidderEmail = lastBidderEmail;
    }

    public String getLastBidderEmail() {
        return lastBidderEmail;
    }

    public void setLastBidderEmail(String lastBidderEmail) {
        this.lastBidderEmail = lastBidderEmail;
    }

    public BigDecimal getBidIncrement() {
        return bidIncrement;
    }

    public void setBidIncrement(BigDecimal bidIncrement) {
        this.bidIncrement = bidIncrement;
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

    public BigDecimal getStartingPrice() {
        return startingPrice;
    }

    public void setStartingPrice(BigDecimal startingPrice) {
        this.startingPrice = startingPrice;
    }

    public BigDecimal getCurrentBid() {
        return currentBid;
    }

    public void setCurrentBid(BigDecimal currentBid) {
        this.currentBid = currentBid;
    }

    public Date getStartTime() {
        return startTime;
    }

    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

    public AuctionStatus getStatus() {
        return status;
    }

    public void setStatus(AuctionStatus status) {
        this.status = status;
    }
}

