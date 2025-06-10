package lk.jiat.auction.ejb.remote;

import jakarta.ejb.Remote;

@Remote
public interface AuthService {
    void login(String username, String password);
    void logout();
}
