package Supplement_store.Suplement_store.controllers;

import Supplement_store.Suplement_store.entities.Role;
import Supplement_store.Suplement_store.entities.User;
import Supplement_store.Suplement_store.repositories.UserRepository;

import jakarta.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class UserController {

    @Autowired
    private UserRepository userRepository;

    
    @GetMapping("/users")
    public String showUsers(HttpSession session, Model model) {
        String role = (String) session.getAttribute("role");
        if (role == null || !role.equals("ADMIN")) {
            return "access";
        }
        List<User> users = userRepository.findAll();
        model.addAttribute("users", users);
        return "users";
    }

    
    @PostMapping("/register-user")
    public String registerUser(@RequestParam String username,
                               @RequestParam String password,
                               @RequestParam String confirmPassword,
                               @RequestParam String role,
                               Model model,
                               HttpSession session) {

       
        String userRole = (String) session.getAttribute("role");
        if (userRole == null || !userRole.equals("ADMIN")) {
            return "access";
        }

       
        if (!password.equals(confirmPassword)) {
            model.addAttribute("error", "Passwords do not match!");
            model.addAttribute("users", userRepository.findAll());
            return "users";
        }

        
        if (userRepository.findByUsername(username) != null) {
            model.addAttribute("error", "Username already exists!");
            model.addAttribute("users", userRepository.findAll());
            return "users";
        }

        
        Role userRoleEnum;
        try {
            userRoleEnum = Role.valueOf(role.toUpperCase());
        } catch (IllegalArgumentException e) {
            model.addAttribute("error", "Invalid role selected.");
            model.addAttribute("users", userRepository.findAll());
            return "users";
        }

       
        User user = new User();
        user.setUsername(username);
        user.setPassword(password);
        user.setRole(userRoleEnum);
        user.setEnabled(true);

        userRepository.save(user);

        model.addAttribute("success", "User registered successfully!");
        model.addAttribute("users", userRepository.findAll());
        return "users";
    }

   
    @PostMapping("/delete-user")
    public String deleteUser(@RequestParam Long id, HttpSession session) {
        String role = (String) session.getAttribute("role");
        if (role == null || !role.equals("ADMIN")) {
            return "access";
        }
        userRepository.deleteById(id);
        return "redirect:/users";
    }

   
}
