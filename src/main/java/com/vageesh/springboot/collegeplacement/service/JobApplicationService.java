package com.vageesh.springboot.collegeplacement.service;

import com.vageesh.springboot.collegeplacement.model.JobApplication;
import com.vageesh.springboot.collegeplacement.repository.JobApplicationRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.Optional;

@Service
public class JobApplicationService {
    @Autowired
    private JobApplicationRepository applicationRepository;
    
    public JobApplication apply(JobApplication application) {
        return applicationRepository.save(application);
    }
    
    public List<JobApplication> getApplicationsByStudent(Long studentId) {
        return applicationRepository.findByStudentId(studentId);
    }
    
    public List<JobApplication> getAllApplications() {
        return applicationRepository.findAll();
    }
    
    public void deleteApplication(Long id) {
        applicationRepository.deleteById(id);
    }
    public Optional<JobApplication> findByStudentIdAndJobId(Long studentId, Long jobId) {
        return applicationRepository.findByStudentIdAndJobId(studentId, jobId);
    }
    
    public JobApplication findById(Long id) {
        return applicationRepository.findById(id).orElse(null);
    }
    
    public JobApplication updateApplication(JobApplication application) {
        return applicationRepository.save(application);
    }
}
