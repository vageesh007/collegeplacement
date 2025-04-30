package com.vageesh.springboot.collegeplacement.model;

import jakarta.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "users")
public class User {

    public enum Role {
        STUDENT, ADMIN
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    private String name;
    
    @Column(unique = true)
    private String email;
    
    private String password;
    
    @Enumerated(EnumType.STRING)
    private Role role;
    
    private LocalDateTime createdAt;
    
    // Fields for students
    private String course;
    private Integer semester;

    public User() {
        this.createdAt = LocalDateTime.now();
    }

    // Constructor for students
    public User(String name, String email, String password, Role role, String course, Integer semester) {
        this.name = name;
        this.email = email;
        this.password = password;
        this.role = role;
        this.course = course;
        this.semester = semester;
        this.createdAt = LocalDateTime.now();
    }
    
    // Constructor for admin (no course/semester)
    public User(String name, String email, String password, Role role) {
        this(name, email, password, role, null, null);
    }

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

	public LocalDateTime getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(LocalDateTime createdAt) {
		this.createdAt = createdAt;
	}

	public String getCourse() {
		return course;
	}

	public void setCourse(String course) {
		this.course = course;
	}

	public Integer getSemester() {
		return semester;
	}

	public void setSemester(Integer semester) {
		this.semester = semester;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", name=" + name + ", email=" + email + ", password=" + password + ", role=" + role
				+ ", createdAt=" + createdAt + ", course=" + course + ", semester=" + semester + "]";
	}

    // Getters and setters...
    // (Omitted here for brevity; ensure getters and setters for course and semester are present.)
    
}
