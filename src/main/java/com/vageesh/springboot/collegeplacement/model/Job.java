package com.vageesh.springboot.collegeplacement.model;

import jakarta.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "jobs")
public class Job {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    private String title;
    private String description;
    private String location;
    private String salary;
    private LocalDateTime postedAt;
    
    // Eligibility criteria
    private String eligibleCourse;
    private Integer eligibleSemester;
    
    // New fields for company information
    private String companyName;
    private String companyPhoto; // stores filename or relative path

    public Job() {
        this.postedAt = LocalDateTime.now();
    }

    public Job(String title, String description, String location, String salary,
               String eligibleCourse, Integer eligibleSemester,
               String companyName, String companyPhoto) {
        this.title = title;
        this.description = description;
        this.location = location;
        this.salary = salary;
        this.eligibleCourse = eligibleCourse;
        this.eligibleSemester = eligibleSemester;
        this.companyName = companyName;
        this.companyPhoto = companyPhoto;
        this.postedAt = LocalDateTime.now();
    }

    // Getters and setters for all fields, including new ones
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }

    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }

    public String getLocation() { return location; }
    public void setLocation(String location) { this.location = location; }

    public String getSalary() { return salary; }
    public void setSalary(String salary) { this.salary = salary; }

    public LocalDateTime getPostedAt() { return postedAt; }
    public void setPostedAt(LocalDateTime postedAt) { this.postedAt = postedAt; }

    public String getEligibleCourse() { return eligibleCourse; }
    public void setEligibleCourse(String eligibleCourse) { this.eligibleCourse = eligibleCourse; }

    public Integer getEligibleSemester() { return eligibleSemester; }
    public void setEligibleSemester(Integer eligibleSemester) { this.eligibleSemester = eligibleSemester; }

    public String getCompanyName() { return companyName; }
    public void setCompanyName(String companyName) { this.companyName = companyName; }

    public String getCompanyPhoto() { return companyPhoto; }
    public void setCompanyPhoto(String companyPhoto) { this.companyPhoto = companyPhoto; }
}
