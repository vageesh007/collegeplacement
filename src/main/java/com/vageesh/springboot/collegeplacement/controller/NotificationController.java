package com.vageesh.springboot.collegeplacement.controller;

import com.vageesh.springboot.collegeplacement.model.Notification;
import com.vageesh.springboot.collegeplacement.service.NotificationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class NotificationController {

    @Autowired
    private NotificationService notificationService;
    
    // Public endpoint: displays all notifications in full
    @GetMapping("/notifications")
    public String viewAllNotifications(Model model) {
        model.addAttribute("notifications", notificationService.getAllNotifications());
        return "notifications"; 
    }
    
    // Admin endpoint: display the create notification form
    @GetMapping("/admin/notifications/create")
    public String createNotificationPage() {
        return "createNotification";
    }
    
    // Admin endpoint: create a new notification and redirect to the public notifications page
    @PostMapping("/admin/notifications/create")
    public String createNotification(@RequestParam String title,
                                     @RequestParam String message,
                                     Model model) {
        Notification notification = new Notification(title, message);
        notificationService.createNotification(notification);

        
        // After creating the notification successfully
        return "redirect:/notifications";  
    }
}
