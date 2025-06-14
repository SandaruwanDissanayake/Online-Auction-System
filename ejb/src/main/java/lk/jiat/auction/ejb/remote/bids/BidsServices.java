package lk.jiat.auction.ejb.remote.bids;

import jakarta.ejb.Remote;
import lk.jiat.auction.core.dto.BidDTO;
import lk.jiat.auction.core.dto.UpdateBidDTO;
import lk.jiat.auction.core.model.bids.BidStatus;
import lk.jiat.auction.core.model.bids.Bids;

import java.util.List;

@Remote
public interface BidsServices {
    boolean createBids(BidDTO bidDTO);
    List<Bids> getAllBids();
    Bids getBids(long id);
    boolean updateBids(UpdateBidDTO updateBidDTO);
    boolean deleteBids(long id);
    List<Bids> getBidsByUserId(String email);
    boolean updateBidsStatusByUserEmail(String email, BidStatus status);
}
