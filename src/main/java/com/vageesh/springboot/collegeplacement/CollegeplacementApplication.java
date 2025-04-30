package com.vageesh.springboot.collegeplacement;

import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.security.crypto.password.PasswordEncoder;
import com.vageesh.springboot.collegeplacement.model.User;
import com.vageesh.springboot.collegeplacement.repository.UserRepository;

@SpringBootApplication
public class CollegeplacementApplication {

	public static void main(String[] args) {
		SpringApplication.run(CollegeplacementApplication.class, args);
	}
	 @Bean
	    public CommandLineRunner dataLoader(UserRepository userRepository, PasswordEncoder passwordEncoder) {
	        return args -> {
	            if (!userRepository.findByEmail("student1@example.com").isPresent()) {
	                User student = new User("Student One", "student1@example.com", "student1pass", User.Role.STUDENT);
	                student.setPassword(passwordEncoder.encode(student.getPassword()));
	                userRepository.save(student);
	            }
	            if (!userRepository.findByEmail("admin1@example.com").isPresent()) {
	                User admin = new User("Admin One", "admin1@example.com", "admin1pass", User.Role.ADMIN);
	                admin.setPassword(passwordEncoder.encode(admin.getPassword()));
	                userRepository.save(admin);
	            }
	            System.out.println("Sample accounts created (if not already present).");
	        };
	    }

}
