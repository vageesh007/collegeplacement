package com.vageesh.springboot.collegeplacement.service;

import com.vageesh.springboot.collegeplacement.model.User;
import com.vageesh.springboot.collegeplacement.repository.UserRepository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService {
    @Autowired
    private UserRepository userRepository;
    
    
    public List<User> findStudents(String course, Integer semester) {
        if (course == null && semester == null) {
            // no filters → all students
            return userRepository.findByRole(User.Role.STUDENT);
        } else if (course != null && semester != null) {
            // both filters
            return userRepository.findByRoleAndCourseAndSemester(User.Role.STUDENT, course, semester);
        } else if (course != null) {
            // only course
            return userRepository.findByRoleAndCourse(User.Role.STUDENT, course);
        } else {
            // only semester
            return userRepository.findByRoleAndSemester(User.Role.STUDENT, semester);
        }
    }
    
    public User registerUser(User user) {
        return userRepository.save(user);
    }
    
    public User findByEmail(String email) {
        return userRepository.findByEmail(email).orElse(null);
    }
    
    public User findById(Long id) {
        return userRepository.findById(id).orElse(null);
    }
  
}
