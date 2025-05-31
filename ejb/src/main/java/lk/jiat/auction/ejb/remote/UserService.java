package lk.jiat.auction.ejb.remote;

import jakarta.ejb.Remote;
import lk.jiat.auction.core.model.auth.User;

import java.util.List;
import java.util.Optional;

@Remote
public interface UserService {
    void addUser(User user);
    void removeUser(User user);
    void updateUser(User user);
    User getUser(String email);
    List<User> getUsers();
    void login(String email, String password);
    void logout();
    boolean isAuctioneer(String username);

}
