package com.vageesh.springboot.collegeplacement.model;

import jakarta.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "applications")
public class JobApplication {
    
    public enum Status {
        PENDING, SHORTLISTED, REJECTED, SELECTED
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    @ManyToOne
    @JoinColumn(name = "student_id", nullable = false)
    private User student;
    
    @ManyToOne
    @JoinColumn(name = "job_id", nullable = false)
    private Job job;
    
    private String resume;
    
    @Enumerated(EnumType.STRING)
    private Status status;
    
    private LocalDateTime appliedAt;

    public JobApplication() {
        this.status = Status.PENDING;
        this.appliedAt = LocalDateTime.now();
    }

    public JobApplication(User student, Job job, String resume) {
        this.student = student;
        this.job = job;
        this.resume = resume;
        this.status = Status.PENDING;
        this.appliedAt = LocalDateTime.now();
    }

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public User getStudent() {
		return student;
	}

	public void setStudent(User student) {
		this.student = student;
	}

	public Job getJob() {
		return job;
	}

	public void setJob(Job job) {
		this.job = job;
	}

	public String getResume() {
		return resume;
	}

	public void setResume(String resume) {
		this.resume = resume;
	}

	public Status getStatus() {
		return status;
	}

	public void setStatus(Status status) {
		this.status = status;
	}

	public LocalDateTime getAppliedAt() {
		return appliedAt;
	}

	public void setAppliedAt(LocalDateTime appliedAt) {
		this.appliedAt = appliedAt;
	}

	@Override
	public String toString() {
		return "JobApplication [id=" + id + ", student=" + student + ", job=" + job + ", resume=" + resume + ", status="
				+ status + ", appliedAt=" + appliedAt + "]";
	}

    // Getters and setters...
    
}
