package com.vageesh.springboot.collegeplacement.security;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;
import java.io.IOException;

@Component
public class CustomAuthenticationSuccessHandler implements AuthenticationSuccessHandler {

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
                                        Authentication authentication) throws IOException, ServletException {
        CustomUserDetails userDetails = (CustomUserDetails) authentication.getPrincipal();
        // Retrieve the role parameter from the login form
        String selectedRole = request.getParameter("role");
        String actualRole = userDetails.getUser().getRole().name();
        
        // Log the roles for debugging purposes
        System.out.println("Selected Role: " + selectedRole);
        System.out.println("Actual Role: " + actualRole);
        
        if (selectedRole == null || !selectedRole.equalsIgnoreCase(actualRole)) {
            HttpSession session = request.getSession();
            session.setAttribute("loginError", "Role mismatch: You are a " + actualRole + ". Please use the correct login.");
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }
        
        HttpSession session = request.getSession();
        session.setAttribute("userId", userDetails.getUser().getId());
        session.setAttribute("userName", userDetails.getUser().getName());
        session.setAttribute("userRole", actualRole);
        response.sendRedirect(request.getContextPath() + "/dashboard");
    }
}
