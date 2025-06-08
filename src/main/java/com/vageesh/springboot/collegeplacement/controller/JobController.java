package com.vageesh.springboot.collegeplacement.controller;

import com.vageesh.springboot.collegeplacement.model.Job;
import com.vageesh.springboot.collegeplacement.model.JobApplication;
import com.vageesh.springboot.collegeplacement.model.User;
import com.vageesh.springboot.collegeplacement.service.JobApplicationService;
import com.vageesh.springboot.collegeplacement.service.JobService;
import com.vageesh.springboot.collegeplacement.service.UserService;
import jakarta.servlet.http.HttpSession;
import java.util.Comparator;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/jobs")
public class JobController {
    
    @Autowired
    private JobService jobService;
    
    // Inject UserService to retrieve student details for filtering
    @Autowired
    private UserService userService;
    
    @GetMapping
    public String listJobs(Model model, HttpSession session) {
        String userRole = (String) session.getAttribute("userRole");
        if ("STUDENT".equalsIgnoreCase(userRole)) {
             Long userId = (Long) session.getAttribute("userId");
             User student = userService.findById(userId);
             List<Job> filteredJobs = jobService.getAllJobs().stream()
                   .filter(job -> job.getEligibleCourse() != null && 
                                  job.getEligibleCourse().equalsIgnoreCase(student.getCourse()))
                   .collect(Collectors.toList());
             filteredJobs.sort(Comparator.comparing(Job::getPostedAt).reversed());
             model.addAttribute("jobs", filteredJobs);
        } else {
             List<Job> jobs = jobService.getAllJobs();
             jobs.sort(Comparator.comparing(Job::getPostedAt).reversed());
             model.addAttribute("jobs", jobs);
        }
        return "jobs";
    }
    
    @GetMapping("/post")
    public String postJobPage() {
        return "postJob";
    }
    @PostMapping("/post")
    public String postJob(
        @RequestParam String title,
        @RequestParam String description,
        @RequestParam String location,
        @RequestParam String salary,
        @RequestParam String eligibleCourse,
        @RequestParam Integer eligibleSemester,
        @RequestParam String companyName,
        @RequestParam("companyPhoto") MultipartFile companyPhoto,
        Model model) {

        // Use an absolute path based on the current working directory
        String uploadDir = System.getProperty("user.dir") + "/uploads/";
        String fileName = "";
        try {
            if (!companyPhoto.isEmpty()) {
                // Create a unique file name using current time
                fileName = System.currentTimeMillis() + "_" + companyPhoto.getOriginalFilename();
                java.nio.file.Path uploadPath = java.nio.file.Paths.get(uploadDir);
                if (!java.nio.file.Files.exists(uploadPath)) {
                    java.nio.file.Files.createDirectories(uploadPath);
                }
                java.nio.file.Path filePath = uploadPath.resolve(fileName);
                companyPhoto.transferTo(filePath.toFile());
            } else {
                // Optionally, you could set a default image filename if no file is provided
                fileName = "default.png";
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.err.println("Error uploading file: " + e.getMessage());
            model.addAttribute("error", "Could not upload company photo: " + e.getMessage());
            return "error";
        }
        
        Job job = new Job(title, description, location, salary, eligibleCourse, eligibleSemester, companyName, fileName);
        jobService.createJob(job);
        return "redirect:/jobs";
    }

    @Autowired
    private JobApplicationService applicationService;

    
    @GetMapping("/details")
    public String jobDetails(@RequestParam Long id, HttpSession session, Model model) {
        Job job = jobService.getJobById(id);
        if (job == null) {
            model.addAttribute("error", "Job not found.");
            return "error"; // a JSP to show error messages
        }
        model.addAttribute("job", job);
        
        // Only for students, check if they have already applied
        String userRole = (String) session.getAttribute("userRole");
        if ("STUDENT".equalsIgnoreCase(userRole)) {
            Long studentId = (Long) session.getAttribute("userId");
            // Check whether an application already exists
            Optional<JobApplication> existingApp = applicationService.findByStudentIdAndJobId(studentId, id);
            if (existingApp.isPresent()) {
                model.addAttribute("applied", true);
            } else {
                model.addAttribute("applied", false);
            }
        }
        
        return "jobDetails"; // Resolves to /WEB-INF/jsp/jobDetails.jsp
    }
    
 // Display edit form
    @GetMapping("/post/edit")
    public String editJobPage(@RequestParam Long id, Model model) {
        Job job = jobService.getJobById(id);
        model.addAttribute("job", job);
        return "editJob"; // /WEB-INF/jsp/editJob.jsp
    }

    // Handle submission
    @PostMapping("/post/edit")
    public String updateJob(@ModelAttribute Job form, RedirectAttributes ra) {
        jobService.createJob(form);
        ra.addFlashAttribute("toastSuccess", "Job updated successfully!");
        return "redirect:/jobs";
    }


}
