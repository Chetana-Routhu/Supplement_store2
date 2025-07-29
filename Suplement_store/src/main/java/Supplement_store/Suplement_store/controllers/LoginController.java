package Supplement_store.Suplement_store.controllers;

import Supplement_store.Suplement_store.entities.Product;
import Supplement_store.Suplement_store.entities.User;
import Supplement_store.Suplement_store.repositories.ProductRepository;
import Supplement_store.Suplement_store.repositories.UserRepository;

import jakarta.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class LoginController {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private ProductRepository productRepository;

    @GetMapping("/login")
    public String showLoginForm() {
        return "login";
    }

    @PostMapping("/login")
    public String loginUser(@RequestParam String username,
                            @RequestParam String password,
                            HttpSession session,
                            Model model) {

        User user = userRepository.findByUsernameAndPassword(username, password);

        if (user != null) {
            session.setAttribute("username", user.getUsername());
            session.setAttribute("role", user.getRole().name());

            List<Product> products = productRepository.findAll();
            model.addAttribute("products", products);

            return "dashboard";
        } else {
            model.addAttribute("error", "Invalid username or password!");
            return "login";
        }
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/login";
    }

    @GetMapping("/dashboard")
    public String showDashboard(HttpSession session, Model model) {
        if (session.getAttribute("username") == null) {
            return "redirect:/login";
        }
        List<Product> products = productRepository.findAll();
        model.addAttribute("products", products);

        return "dashboard";
    }

    @PostMapping("/add-product")
    public String addProduct(@RequestParam String name,
                             @RequestParam String description,
                             @RequestParam double price,
                             @RequestParam(required = false) String imageUrl,
                             HttpSession session) {

        String role = (String) session.getAttribute("role");

        if (role == null || !role.equals("ADMIN")) {
            return "access"; 
        }

        Product product = new Product();
        product.setName(name);
        product.setDescription(description);
        product.setPrice(price);
        product.setImageUrl(imageUrl);

        productRepository.save(product);

        return "redirect:/dashboard";
    }

    @PostMapping("/delete-product")
    public String deleteProduct(@RequestParam Long id, HttpSession session) {

        String role = (String) session.getAttribute("role");

        if (role == null || !role.equals("ADMIN")) {
            return "access";
        }

        productRepository.deleteById(id);

        return "redirect:/dashboard";
    }
}
