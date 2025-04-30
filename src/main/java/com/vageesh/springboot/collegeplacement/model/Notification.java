package com.vageesh.springboot.collegeplacement.model;

import jakarta.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "notifications")
public class Notification {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    private String title;
    
    @Column(length = 1000)
    private String message;
    
    private LocalDateTime createdAt;
    
    public Notification() {
        this.createdAt = LocalDateTime.now();
    }
    
    public Notification(String title, String message) {
        this.title = title;
        this.message = message;
        this.createdAt = LocalDateTime.now();
    }
    
    // Getters and setters
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }
    
    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }
    
    public String getMessage() { return message; }
    public void setMessage(String message) { this.message = message; }
    
    public LocalDateTime getCreatedAt() { return createdAt; }
    public void setCreatedAt(LocalDateTime createdAt) { this.createdAt = createdAt; }
    
    public String getCreatedDate() {
        return createdAt.toLocalDate().toString();  // date format by default!!!
    }

	@Override
	public String toString() {
		return "Notification [id=" + id + ", title=" + title + ", message=" + message + ", createdAt=" + createdAt
				+ "]";
	}
    
}
