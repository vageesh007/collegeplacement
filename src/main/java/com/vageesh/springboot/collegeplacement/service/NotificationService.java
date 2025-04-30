package com.vageesh.springboot.collegeplacement.service;

import com.vageesh.springboot.collegeplacement.model.Notification;
import com.vageesh.springboot.collegeplacement.repository.NotificationRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class NotificationService {
    
    @Autowired
    private NotificationRepository notificationRepository;
    
    public Notification createNotification(Notification notification) {
        return notificationRepository.save(notification);
    }
    
    public List<Notification> getAllNotifications() {
        // Sort notifications by createdAt descending (latest first)
        return notificationRepository.findAll().stream()
                .sorted((n1, n2) -> n2.getCreatedAt().compareTo(n1.getCreatedAt()))
                .collect(Collectors.toList());
    }
    
    // Optionally, add update and delete methods if you plan to manage notifications
    public Notification updateNotification(Notification notification) {
        return notificationRepository.save(notification);
    }
    
    public void deleteNotification(Long id) {
        notificationRepository.deleteById(id);
    }
}
