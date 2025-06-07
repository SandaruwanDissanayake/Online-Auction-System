package lk.jiat.auction.core.notificationSocket;

public interface WebSocketAuctionEndTime {
    void sendAuctionEndTime(Long auctionId,String timestamp);
}
