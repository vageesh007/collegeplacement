package com.vageesh.springboot.collegeplacement.service;

import com.vageesh.springboot.collegeplacement.model.Job;
import com.vageesh.springboot.collegeplacement.repository.JobRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class JobService {
    @Autowired
    private JobRepository jobRepository;
    
    public Job createJob(Job job) {
        return jobRepository.save(job);
    }
    
    public List<Job> getAllJobs() {
        return jobRepository.findAll();
    }
    
    public Job getJobById(Long id) {
        return jobRepository.findById(id).orElse(null);
    }
}
