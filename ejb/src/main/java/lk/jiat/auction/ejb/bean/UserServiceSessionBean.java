package lk.jiat.auction.ejb.bean;

import jakarta.ejb.Stateless;
import lk.jiat.auction.core.model.auth.User;
import lk.jiat.auction.ejb.remote.UserService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Stateless
public class UserServiceSessionBean implements UserService {

    private static final Map<String, User> USER_MAP = new HashMap<String, User>();
    static {
        USER_MAP.put("auctioneer@email.com",new User(
                "1",
                "auctioneer",
                "abc123",
                "auctioneer@email.com",
                "0765656745",
                "narammala",
                "AUCTIONEER",
                true

        ));
        USER_MAP.put("bidder@email.com",new User(
                "1",
                "bidder",
                "abc123",
                "bidder@email.com",
                "0765656745",
                "narammala",
                "BIDDER",
                true

        ));
    }
    private User currentUser;

    @Override
    public void addUser(User user) {
        USER_MAP.put(user.getEmail(), user);
    }

    @Override
    public void removeUser(User user) {

    }

    @Override
    public void updateUser(User user) {

    }

    @Override
    public User getUser(String email) {
        return null;
    }

    @Override
    public List<User> getUsers() {
        return List.of();
    }

    @Override
    public void login(String email, String password) {
        User user = USER_MAP.get(email);

        if (user == null) {
            throw new RuntimeException("Invalid username or password");
        }

        // 2. Verify password
        if (!password.equals(user.getPassword())) {
            throw new RuntimeException("Invalid username or password");
        }

        // 3. Verify account status
        if (!user.isActive()) {
            throw new RuntimeException("Account is inactive");
        }

        // 4. Set current user
        this.currentUser = user;

    }
    public boolean isAuctioneer(String email) {
        User user = USER_MAP.get(email);
        if(user.getRole().equals("AUCTIONEER")){
            return true;
        }else {
            return false;
        }
    }

    @Override
    public void logout() {

    }
}
