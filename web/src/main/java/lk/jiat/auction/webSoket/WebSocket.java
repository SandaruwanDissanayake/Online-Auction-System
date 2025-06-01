package lk.jiat.auction.webSoket;

import jakarta.websocket.*;
import jakarta.websocket.server.ServerEndpoint;
import jakarta.xml.ws.WebEndpoint;
import lk.jiat.auction.core.notificationSocket.BrodcastUtil;
import lk.jiat.auction.core.notificationSocket.WebSoketBrodcaster;

import java.math.BigDecimal;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;

@ServerEndpoint("/updateCurrentBid")
public class WebSocket implements WebSoketBrodcaster {

    private static final Set<Session> sessions = ConcurrentHashMap.newKeySet();

    static {
        BrodcastUtil.setWebSoketBrodcaster(new WebSocket());
    }

    @Override
    public void sendBidResults(BigDecimal currentBid) {
        String json = String.format("{\"currentBid\":%.2f}",currentBid);
        for (Session session : sessions) {
            session.getAsyncRemote().sendText(json);
        }
    }

    @OnOpen
    public void onOpen(Session session) {
        sessions.add(session);
        System.out.println("onOpen");
    }
    @OnClose
    public void onClose(Session session) {
        sessions.remove(session);
        System.out.println("onClose");
    }


}
