
package com.vageesh.springboot.collegeplacement.controller;

import com.vageesh.springboot.collegeplacement.model.Job;
import com.vageesh.springboot.collegeplacement.model.Notification;
import com.vageesh.springboot.collegeplacement.model.User;
import com.vageesh.springboot.collegeplacement.service.JobService;
import com.vageesh.springboot.collegeplacement.service.NotificationService;
import com.vageesh.springboot.collegeplacement.service.UserService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

@Controller
public class DashboardController {

    @Autowired
    private JobService jobService;
    
    @Autowired
    private UserService userService;
    
    @Autowired
    private NotificationService notificationService;

    @GetMapping("/dashboard")
    public String dashboard(HttpSession session, Model model) {
        Long userId = (Long) session.getAttribute("userId");
        String userRole = (String) session.getAttribute("userRole");
        String userName = (String) session.getAttribute("userName");
        model.addAttribute("userName", userName);
        model.addAttribute("userRole", userRole);
        
        // Load all notifications (sorted in descending order in the service)
        model.addAttribute("notifications", notificationService.getAllNotifications());
        
        if ("STUDENT".equalsIgnoreCase(userRole)) {
            User user = userService.findById(userId);
            model.addAttribute("user", user);
            List<Job> jobs = jobService.getAllJobs().stream()
                    .filter(job -> job.getEligibleCourse() != null &&
                            job.getEligibleCourse().equalsIgnoreCase(user.getCourse()))
                    .sorted(Comparator.comparing(Job::getPostedAt).reversed())
                    .collect(Collectors.toList());
            List<Job> recentJobs = jobs.stream().limit(4).collect(Collectors.toList());
            model.addAttribute("recentJobs", recentJobs);
        } else {
            User user = userService.findById(userId);
            model.addAttribute("user", user);
        }
        
        return "dashboard";
    }
}



