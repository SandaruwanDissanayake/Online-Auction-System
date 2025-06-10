package lk.jiat.auction.ejb.bean;

import jakarta.ejb.Stateful;
import jakarta.ejb.Stateless;
import jakarta.inject.Inject;
import lk.jiat.auction.core.model.auth.User;
import lk.jiat.auction.ejb.remote.UserService;
import lk.jiat.auction.ejb.repository.UsersRepo;

import java.util.List;
import java.util.Optional;

@Stateful
public class UserServiceSessionBean implements UserService {

    @Inject
    private UsersRepo usersRepo;


    private User currentUser;

    @Override
    public void addUser(User user) {

        usersRepo.save(user);

    }

    @Override
    public void removeUser(User user) {
        usersRepo.delete(user.getEmail());
    }

    @Override
    public void updateUser(User user) {
        usersRepo.save(user);
    }

    @Override
    public User getUser(String email) {

        return usersRepo.findByEmail(email).orElseThrow(() -> new RuntimeException("User not found"));
    }

    @Override
    public List<User> getUsers() {
        return usersRepo.findAll();
    }


    @Override
    public void login(String email, String password) {
        User user = usersRepo.findByEmail(email)
                .orElseThrow(() -> new RuntimeException("Invalid username or password"));

        if (!password.equals(user.getPassword())) {
            throw new RuntimeException("Invalid username or password");
        }

        if (!user.isActive()) {
            throw new RuntimeException("Account is inactive");
        }
    }

    @Override
    public void logout() {

    }

    public boolean isAuctioneer(String email) {
        return usersRepo.findByEmail(email)
                .map(user -> "AUCTIONEER".equals(user.getRole()))
                .orElse(false);
    }
}



