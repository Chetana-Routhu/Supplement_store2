package Supplement_store.Suplement_store.services;

import Supplement_store.Suplement_store.entities.Role;
import Supplement_store.Suplement_store.entities.User;
import Supplement_store.Suplement_store.repositories.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RegisterService {

    @Autowired
    private UserRepository userRepository;

    public String registerUser(String username, String password, String confirmPassword, String role) {
        if (!password.equals(confirmPassword)) {
            return "Passwords do not match!";
        }

        if (userRepository.findByUsername(username) != null) {
            return "Username already exists!";
        }

        User user = new User();
        user.setUsername(username);
        user.setPassword(password);

        try {
            user.setRole(Role.valueOf(role.toUpperCase()));
        } catch (IllegalArgumentException e) {
            return "Invalid role selected.";
        }

        user.setEnabled(true);

        userRepository.save(user);
        return null;
    }
}