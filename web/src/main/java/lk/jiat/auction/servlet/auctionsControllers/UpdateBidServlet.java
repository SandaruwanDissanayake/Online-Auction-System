package lk.jiat.auction.servlet.auctionsControllers;

import jakarta.annotation.Resource;
import jakarta.jms.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lk.jiat.auction.core.dto.BidDTO;
import lk.jiat.auction.core.dto.UpdateBidDTO;

import java.io.IOException;
import java.math.BigDecimal;

@WebServlet("/updateBidServlet")
public class UpdateBidServlet extends HttpServlet {

    @Resource(lookup = "jms/UpdateBidConnectionFactory")
    private ConnectionFactory connectionFactory;

    @Resource(lookup = "jms/UpdateBidQueue")
    private Queue updateBidQueue;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try {
            Long auctionId = Long.parseLong(request.getParameter("auctionId"));
            Long bidId=Long.parseLong(request.getParameter("bidId"));
            BigDecimal amount = new BigDecimal(request.getParameter("bidAmount"));
            boolean isProxyBid = request.getParameter("proxyBid") != null;
            BigDecimal maxBid = isProxyBid ? new BigDecimal(request.getParameter("maxBid")) : amount;

            HttpSession session = request.getSession(false);
            String bidderEmail= session.getAttribute("email").toString();

            UpdateBidDTO updateBidDTO=new UpdateBidDTO();
            updateBidDTO.setBidId(bidId);
            updateBidDTO.setAuctionId(auctionId);
            updateBidDTO.setAmount(amount);
            updateBidDTO.setProxyBid(isProxyBid);
            updateBidDTO.setBidderEmail(bidderEmail);


            try(Connection connection = connectionFactory.createConnection();
                Session jmsSession = connection.createSession(false, Session.AUTO_ACKNOWLEDGE)) {
                MessageProducer producer = jmsSession.createProducer(updateBidQueue);
                ObjectMessage message = jmsSession.createObjectMessage(); // Create empty message
                message.setObject(updateBidDTO);
                producer.send(message);
                System.out.println("Sent bid for auction id "+ auctionId);
            }


            System.out.println(updateBidDTO.getBidId());
            System.out.println(updateBidDTO.getAuctionId());
            System.out.println(updateBidDTO.getAmount());
            System.out.println(updateBidDTO.isProxyBid());
            System.out.println(updateBidDTO.getBidderEmail());

            response.sendRedirect(request.getContextPath()+"/loadBidderDashboard");

            //BidResult result = bidService.placeBid(auctionId, bidderId, amount, maxBid);

//            if (result.isSuccess()) {
//                response.sendRedirect(request.getContextPath() + "/auction-detail?id=" + auctionId + "&bidSuccess=true");
//            } else {
//                request.setAttribute("error", result.getMessage());
//                request.getRequestDispatcher("/place-bid?id=" + auctionId).forward(request, response);
//            }

        } catch (Exception e) {
            request.setAttribute("error", "Error placing bid: " + e.getMessage());
            request.getRequestDispatcher("/place-bid.jsp").forward(request, response);
        }
    }
}
