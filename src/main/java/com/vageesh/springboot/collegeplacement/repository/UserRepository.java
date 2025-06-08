package com.vageesh.springboot.collegeplacement.repository;

import com.vageesh.springboot.collegeplacement.model.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface UserRepository extends JpaRepository<User, Long> {
    Optional<User> findByEmail(String email);
    List<User> findByRole(User.Role role);

    // Fetch by role + course
    List<User> findByRoleAndCourse(User.Role role, String course);

    // Fetch by role + semester
    List<User> findByRoleAndSemester(User.Role role, Integer semester);

    // Fetch by role + course + semester
    List<User> findByRoleAndCourseAndSemester(User.Role role, String course, Integer semester);
}
