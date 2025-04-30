package com.vageesh.springboot.collegeplacement.repository;

import com.vageesh.springboot.collegeplacement.model.JobApplication;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;
import java.util.Optional;

public interface JobApplicationRepository extends JpaRepository<JobApplication, Long> {
	 Optional<JobApplication> findByStudentIdAndJobId(Long studentId, Long jobId);
    List<JobApplication> findByStudentId(Long studentId);
    List<JobApplication> findByJobId(Long jobId);
}
