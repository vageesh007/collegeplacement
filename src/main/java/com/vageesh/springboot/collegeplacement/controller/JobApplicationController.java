package com.vageesh.springboot.collegeplacement.controller;

import com.vageesh.springboot.collegeplacement.model.JobApplication;
import com.vageesh.springboot.collegeplacement.model.Job;
import com.vageesh.springboot.collegeplacement.model.User;
import com.vageesh.springboot.collegeplacement.service.JobApplicationService;
import com.vageesh.springboot.collegeplacement.service.JobService;
import com.vageesh.springboot.collegeplacement.service.UserService;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/applications")
public class JobApplicationController {
    @Autowired
    private JobApplicationService applicationService;
    @Autowired
    private UserService userService;
    @Autowired
    private JobService jobService;
    
    // Student applies for a job via form submission.
    // In a real application, student ID would be determined by session.
    @PostMapping("/apply")
    public String applyForJob(@RequestParam Long jobId,
                              @RequestParam String resume,
                              @RequestParam Long studentId,
                              Model model) {
        Optional<JobApplication> existingApp = applicationService.findByStudentIdAndJobId(studentId, jobId);
        if (existingApp.isPresent()) {
            model.addAttribute("error", "You have already applied for this job.");
            return "error";  // Ensure you have an error.jsp to display the error
        }
        
        User student = userService.findById(studentId);
        Job job = jobService.getJobById(jobId);
        
        // Check eligibility
        if (!student.getCourse().equalsIgnoreCase(job.getEligibleCourse()) ||
            !student.getSemester().equals(job.getEligibleSemester())) {
            model.addAttribute("error", "You are not eligible to apply for this job. Required: "
                    + job.getEligibleCourse() + " - Semester " + job.getEligibleSemester());
            return "error";
        }
        
        JobApplication app = new JobApplication(student, job, resume);
        applicationService.apply(app);
        // After a successful application, redirect to the dashboard.
        return "redirect:/dashboard";
    }

}
