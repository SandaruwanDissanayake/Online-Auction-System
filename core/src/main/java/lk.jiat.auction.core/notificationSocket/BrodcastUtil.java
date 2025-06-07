package lk.jiat.auction.core.notificationSocket;

import java.math.BigDecimal;

public class BrodcastUtil {
     private static WebSoketBrodcaster webSoketBrodcaster1;

    public static void setWebSoketBrodcaster(WebSoketBrodcaster webSoketBrodcaster) {
       webSoketBrodcaster1 = webSoketBrodcaster;
    }

    public static void sendBrodcastCurrentBid(BigDecimal currentBid,Long auctionId) {
        if(webSoketBrodcaster1 != null) {
            webSoketBrodcaster1.sendBidResults(currentBid,auctionId);
        }
    }
    public static void sendauctionEndTime(Long auctionId,String endTime) {
        if(webSoketBrodcaster1 != null) {
            webSoketBrodcaster1.sendAuctionEndTime(auctionId,endTime);
        }
    }

}
