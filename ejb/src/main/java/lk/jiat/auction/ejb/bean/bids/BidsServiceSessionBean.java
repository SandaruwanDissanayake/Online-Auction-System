package lk.jiat.auction.ejb.bean.bids;

import jakarta.ejb.EJB;
import jakarta.ejb.Remote;
import jakarta.ejb.Stateless;
import jakarta.inject.Inject;
import lk.jiat.auction.core.dto.BidDTO;
import lk.jiat.auction.core.dto.UpdateBidDTO;
import lk.jiat.auction.core.model.auction.Auction;
import lk.jiat.auction.core.model.auction.AuctionStatus;
import lk.jiat.auction.core.model.auth.User;
import lk.jiat.auction.core.model.bids.BidStatus;
import lk.jiat.auction.core.model.bids.Bids;
import lk.jiat.auction.ejb.remote.UserService;
import lk.jiat.auction.ejb.remote.auctions.AuctionServices;
import lk.jiat.auction.ejb.remote.bids.BidsServices;
import lk.jiat.auction.ejb.repository.BidsRepo;
import lk.jiat.auction.ejb.repository.UsersRepo;

import java.math.BigDecimal;
import java.util.ArrayList;
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
        boolean isUpdateBidStatus=false;
        if(auction.getLastBidderEmail()!=null){
           isUpdateBidStatus= updateBidsStatusByUserEmail(auction.getLastBidderEmail(),BidStatus.OUTBID);
        }else {
            
            isUpdateBidStatus=true;
        }
        if(isUpdateBidStatus){
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
        }

        return true;


    }

    @Override
    public List<Bids> getAllBids() {
        return bidsRepo.findAll();
    }

    @Override
    public Bids getBids(long id) {
        return bidsRepo.findByBidId(id);
    }

    @Override
    public boolean updateBids(UpdateBidDTO updateBidDTO) {

        if (updateBidDTO == null || updateBidDTO.getAuctionId() == null || updateBidDTO.getAmount() == null) {
            return false;
        }

        Auction updatedAuction = auctionServices.updateAuction(
                updateBidDTO.getAuctionId(),
                updateBidDTO.getAmount(),
                updateBidDTO.getBidderEmail()
        );

        if (updatedAuction == null) {
            return false;
        }
        return bidsRepo.updateBidStatusAuctionAndAmount(
                updateBidDTO.getBidId(),
                updatedAuction,
                updateBidDTO.getAmount()
        );
    }

    @Override
    public boolean deleteBids(long id) {
        return false;
    }



    @Override
    public List<Bids> getBidsByUserId(String email) {
        // Fetch bids with auctions in a single query (assuming JPA relationship)
        List<Bids> bids = bidsRepo.findByBidderEmail(email);
        // Update maxBid directly from the already-loaded auction

        List<Bids> bids1 = new ArrayList<Bids>();

        for (Bids bid : bids) {
           Auction auction= auctionServices.getAuction(bid.getAuction().getId());

           if (auction != null ) {
                bid.setMaxBid(auction.getCurrentBid());
               if (auction.getStatus() != AuctionStatus.CLOSED){
                   bids1.add(bid);
               }
            }
        }
        return bids1;
    }

    @Override
    public boolean updateBidsStatusByUserEmail(String email, BidStatus status) {
        bidsRepo.updateBidsStatusByUserEmail(email,status);
        return true;
    }
}
