package com.vageesh.springboot.collegeplacement.controller;

import com.vageesh.springboot.collegeplacement.model.User;
import com.vageesh.springboot.collegeplacement.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class AuthController {

    @Autowired
    private UserService userService;
    
    @Autowired
    private PasswordEncoder passwordEncoder;
    
    @GetMapping("/login")
    public String loginPage() {
        return "login";
    }
    
    @GetMapping("/register")
    public String registerPage() {
        return "register";
    }
    
    @PostMapping("/register")
    public String register(@RequestParam String name,
                           @RequestParam String email,
                           @RequestParam String password,
                           @RequestParam String course,
                           @RequestParam Integer semester,
                           Model model) {
        // For students
        User user = new User(name, email, passwordEncoder.encode(password), User.Role.STUDENT, course, semester);
        userService.registerUser(user);
        model.addAttribute("message", "Registration successful, please login.");
        return "login";
    }
}
