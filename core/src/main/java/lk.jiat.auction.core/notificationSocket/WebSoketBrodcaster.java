package lk.jiat.auction.core.notificationSocket;

import java.math.BigDecimal;

public interface WebSoketBrodcaster {
    void sendBidResults(BigDecimal currentBid,Long auctionId);
    void sendAuctionEndTime(Long auctionId,String auctionEndTime);

}

