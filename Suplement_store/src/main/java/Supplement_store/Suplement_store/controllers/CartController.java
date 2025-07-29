package Supplement_store.Suplement_store.controllers;

import Supplement_store.Suplement_store.entities.CartItem;
import Supplement_store.Suplement_store.entities.Product;
import Supplement_store.Suplement_store.entities.User;
import Supplement_store.Suplement_store.repositories.CartItemRepository;
import Supplement_store.Suplement_store.repositories.ProductRepository;
import Supplement_store.Suplement_store.repositories.UserRepository;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class CartController {

    @Autowired
    private ProductRepository productRepository;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private CartItemRepository cartItemRepository;

    
    @PostMapping(value = "/add-to-cart", consumes = "application/x-www-form-urlencoded")
    @ResponseBody
    public String addToCart(@RequestParam Long productId, HttpSession session) {
        String username = (String) session.getAttribute("username");
        if (username == null) return "NOT_LOGGED_IN";

        User user = userRepository.findByUsername(username);
        Product product = productRepository.findById(productId).orElse(null);

        if (user != null && product != null) {
           
            CartItem existingItem = cartItemRepository.findByUserAndProduct(user, product);

            if (existingItem != null) {
                
                existingItem.setQuantity(existingItem.getQuantity() + 1);
                cartItemRepository.save(existingItem);
            } else {
               
                CartItem newItem = new CartItem();
                newItem.setUser(user);
                newItem.setProduct(product);
                newItem.setQuantity(1);
                cartItemRepository.save(newItem);
            }
            return "ADDED";
        }

        return "ERROR";
    }

   
    @GetMapping("/cartitems")
    public String viewCartItems(HttpSession session, Model model) {
        String username = (String) session.getAttribute("username");
        if (username == null) return "redirect:/login";

        User user = userRepository.findByUsername(username);
        List<CartItem> cartItems = cartItemRepository.findByUser(user);

        
        double total = 0.0;
        for (CartItem item : cartItems) {
            total += item.getProduct().getPrice() * item.getQuantity();
        }

        model.addAttribute("cartItems", cartItems);
        model.addAttribute("cartTotal", total);

        return "cartitems"; 
    }

    
    @PostMapping("/delete-cartitem")
    public String deleteCartItem(@RequestParam Long id) {
        cartItemRepository.deleteById(id);
        return "redirect:/cartitems";
    }
}