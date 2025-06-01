package lk.jiat.auction.ejb.bean.bids;

import jakarta.ejb.EJB;
import jakarta.ejb.Remote;
import jakarta.ejb.Stateless;
import jakarta.inject.Inject;
import lk.jiat.auction.core.dto.BidDTO;
import lk.jiat.auction.core.model.auction.Auction;
import lk.jiat.auction.core.model.auth.User;
import lk.jiat.auction.core.model.bids.BidStatus;
import lk.jiat.auction.core.model.bids.Bids;
import lk.jiat.auction.ejb.remote.UserService;
import lk.jiat.auction.ejb.remote.auctions.AuctionServices;
import lk.jiat.auction.ejb.remote.bids.BidsServices;
import lk.jiat.auction.ejb.repository.BidsRepo;
import lk.jiat.auction.ejb.repository.UsersRepo;

import java.math.BigDecimal;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Stateless
public class BidsServiceSessionBean implements BidsServices {

    @Inject
    private BidsRepo bidsRepo;
    @EJB
    private UserService userService;

    @EJB
    private AuctionServices auctionServices;


    @Override
    public boolean createBids(BidDTO bidDTO) {

        System.out.println("Bids Service correct trigger : "+bidDTO.getBidderEmail());

        User user= userService.getUser(bidDTO.getBidderEmail());
        System.out.println(user.getEmail()+" "+user.getRole()+" "+bidDTO.getAmount()+" User Details Found...........");
        Auction auction= auctionServices.getAuction(bidDTO.getAuctionId());

        Auction upadatedAuction= auctionServices.updateAuction(auction.getId(),bidDTO.getAmount(),user.getEmail());

        boolean isSave=false;

        System.out.println("Bids Service trigger 1");
        if(upadatedAuction!=null){
            Long bidId = Math.abs(UUID.randomUUID().getMostSignificantBits());
            Bids bids=new Bids();
            bids.setBidId(bidId);
            bids.setMaxBid(bidDTO.getAmount());
            bids.setAmount(bidDTO.getAmount());
            bids.setBidder(user);
            bids.setStatus(BidStatus.PENDING);
            bids.setAuction(upadatedAuction);

            System.out.println("Bids Service trigger 2");

           isSave= bidsRepo.save(bids);
        }
        System.out.println("Bids Service trigger 3 : "+isSave);

        return isSave;

    }

    @Override
    public List<Bids> getAllBids() {
        return bidsRepo.findAll();
    }

    @Override
    public Bids getBids(long id) {
        return null;
    }

    @Override
    public boolean updateBids(Bids bids) {
        return false;
    }

    @Override
    public boolean deleteBids(long id) {
        return false;
    }

    @Override
    public List<Bids> getBidsByUserId(String email) {
        return bidsRepo.findByBidderEmail(email);
    }
}
