package lk.jiat.auction.ejb.repository;

import jakarta.annotation.PostConstruct;
import jakarta.ejb.Singleton;
import lk.jiat.auction.core.model.auth.User;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.concurrent.ConcurrentHashMap;

@Singleton
public class UsersRepo {
    private final Map<String, User> USER_MAP = new ConcurrentHashMap<>();

    @PostConstruct
    public void init() {
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

    public void save(User user) {
        USER_MAP.put(user.getEmail(), user);
    }

    public Optional<User> findByEmail(String email) {
        return Optional.ofNullable(USER_MAP.get(email));
    }

    public void delete(String email) {
        USER_MAP.remove(email);
    }

    public List<User> findAll() {
        return new ArrayList<>(USER_MAP.values());
    }
}