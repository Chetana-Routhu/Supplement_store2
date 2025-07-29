package Supplement_store.Suplement_store.controllers;

import Supplement_store.Suplement_store.services.RegisterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class RegisterController {

    @Autowired
    private RegisterService registerService;

    @GetMapping("/register")
    public String showRegisterForm() {
        return "register";
    }

    @PostMapping("/register")
    public String register(@RequestParam String username,
                           @RequestParam String password,
                           @RequestParam String confirmPassword,
                           @RequestParam String role,
                           Model model) {

        String error = registerService.registerUser(username, password, confirmPassword, role);
        if (error != null) {
            model.addAttribute("error", error);
            return "register";
        }
        return "redirect:/login";
    }
}