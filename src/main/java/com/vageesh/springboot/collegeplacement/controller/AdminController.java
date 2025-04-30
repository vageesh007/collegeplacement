package com.vageesh.springboot.collegeplacement.controller;

import com.vageesh.springboot.collegeplacement.model.JobApplication;
import com.vageesh.springboot.collegeplacement.model.User;
import com.vageesh.springboot.collegeplacement.service.JobApplicationService;
import com.vageesh.springboot.collegeplacement.service.UserService;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.io.PrintWriter;
import java.util.List;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private JobApplicationService applicationService;
    
    // Inject PasswordEncoder and UserService
    @Autowired
    private PasswordEncoder passwordEncoder;
    
    @Autowired
    private UserService userService;
    @GetMapping("/applications")
    public String viewApplications(
            @RequestParam(required = false) String course,
            @RequestParam(required = false) Integer semester,
            @RequestParam(required = false) String jobTitle,
            Model model) {
        List<JobApplication> applications = applicationService.getAllApplications();

        if (course != null && !course.trim().isEmpty()) {
            String courseFilter = course.trim();
            applications = applications.stream()
                    .filter(app -> app.getStudent().getCourse() != null &&
                                   app.getStudent().getCourse().equalsIgnoreCase(courseFilter))
                    .collect(Collectors.toList());
        }
        if (semester != null) {
            applications = applications.stream()
                    .filter(app -> app.getStudent().getSemester() != null &&
                                   app.getStudent().getSemester().equals(semester))
                    .collect(Collectors.toList());
        }
        if (jobTitle != null && !jobTitle.trim().isEmpty()) {
            String jobTitleFilter = jobTitle.trim().toLowerCase();
            applications = applications.stream()
                    .filter(app -> app.getJob().getTitle() != null &&
                                   app.getJob().getTitle().toLowerCase().contains(jobTitleFilter))
                    .collect(Collectors.toList());
        }

        
        model.addAttribute("applications", applications);
        return "adminApplications";
    }

    
    @PostMapping("/application/delete")
    public String deleteApplication(@RequestParam Long id, Model model) {
        applicationService.deleteApplication(id);
        return "redirect:/admin/applications";
    }
    
    @GetMapping("/download")
    public void downloadCSV(@RequestParam(required = false) String course,
                            @RequestParam(required = false) Integer semester,
                            @RequestParam(required = false) String jobTitle,
                            HttpServletResponse response) throws Exception {
        List<JobApplication> applications = applicationService.getAllApplications();
        
        // Filter by course if provided
        if (course != null && !course.trim().isEmpty()) {
            String courseFilter = course.trim();
            applications = applications.stream()
                    .filter(app -> app.getStudent().getCourse() != null &&
                            app.getStudent().getCourse().equalsIgnoreCase(courseFilter))
                    .collect(Collectors.toList());
        }
        
        // Filter by semester if provided
        if (semester != null) {
            applications = applications.stream()
                    .filter(app -> app.getStudent().getSemester() != null &&
                            app.getStudent().getSemester().equals(semester))
                    .collect(Collectors.toList());
        }
        
        // Filter by job title if provided using partial match (contains)
        if (jobTitle != null && !jobTitle.trim().isEmpty()) {
            String jobTitleFilter = jobTitle.trim().toLowerCase();
            applications = applications.stream()
                    .filter(app -> app.getJob().getTitle() != null &&
                            app.getJob().getTitle().toLowerCase().contains(jobTitleFilter))
                    .collect(Collectors.toList());
        }
        
        response.setContentType("text/csv");
        response.setHeader("Content-Disposition", "attachment; filename=\"applications.csv\"");
        PrintWriter writer = response.getWriter();
        writer.println("ID,Student Name,Email,Job Title,Course,Semester,Resume,Status,Applied At");
        
        if (applications.isEmpty()) {
            writer.println("No records found for the selected filter.");
        } else {
            for (JobApplication app : applications) {
                writer.println(app.getId() + "," +
                               app.getStudent().getName() + "," +
                               app.getStudent().getEmail() + "," +
                               app.getJob().getTitle() + "," +
                               app.getStudent().getCourse() + "," +
                               app.getStudent().getSemester() + "," +
                               app.getResume() + "," +
                               app.getStatus() + "," +
                               app.getAppliedAt());
            }
        }
        writer.flush();
        writer.close();
    }

    
    @GetMapping("/createAdmin")
    public String createAdminPage() {
        return "createAdmin"; // Resolves to /WEB-INF/jsp/createAdmin.jsp
    }
    
    @PostMapping("/createAdmin")
    public String createAdmin(@RequestParam String email,
                              @RequestParam String password,
                              Model model) {
        // Create new admin. Using email as name for simplicity.
        User newAdmin = new User(email, email, passwordEncoder.encode(password), User.Role.ADMIN);
        userService.registerUser(newAdmin);
        model.addAttribute("message", "New admin created successfully!");
        return "redirect:/admin/applications";  // Or redirect to a dedicated admin page
    }
}
