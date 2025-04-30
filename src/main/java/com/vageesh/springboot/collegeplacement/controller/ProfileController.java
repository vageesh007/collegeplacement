package com.vageesh.springboot.collegeplacement.controller;

import com.vageesh.springboot.collegeplacement.model.User;
import com.vageesh.springboot.collegeplacement.service.UserService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/profile")
public class ProfileController {
    
    @Autowired
    private UserService userService;
    
    @GetMapping
    public String profile(HttpSession session, Model model) {
        Long userId = (Long) session.getAttribute("userId");
        if (userId == null) {
            return "redirect:/login";
        }
        User user = userService.findById(userId);
        model.addAttribute("user", user);
        
        // Decide which JSP to show based on role
        String userRole = (String) session.getAttribute("userRole");
        if ("ADMIN".equalsIgnoreCase(userRole)) {
            return "adminProfile"; // Admin profile JSP
        }
        return "profile"; // Student profile JSP
    }
    
    @PostMapping
    public String updateProfile(@RequestParam Long userId,
                                @RequestParam String name,
                                @RequestParam String email,
                                @RequestParam(required = false) String course,
                                @RequestParam(required = false) Integer semester,
                                Model model,
                                HttpSession session) {
        User user = userService.findById(userId);
        user.setName(name);
        user.setEmail(email);
        
        String userRole = (String) session.getAttribute("userRole");
        if ("STUDENT".equalsIgnoreCase(userRole)) {
            // Only update course/semester for students
            user.setCourse(course);
            user.setSemester(semester);
        }
        
        userService.registerUser(user); // Save updates
        
        // Update session attribute for userName so the dashboard shows the updated name
        session.setAttribute("userName", user.getName());
        
        model.addAttribute("user", user);
        model.addAttribute("message", "Profile updated successfully!");
        
        if ("ADMIN".equalsIgnoreCase(userRole)) {
            return "adminProfile"; // Admin profile JSP
        }
        return "profile"; // Student profile JSP
    }

}
