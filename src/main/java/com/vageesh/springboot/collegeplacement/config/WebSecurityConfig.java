package com.vageesh.springboot.collegeplacement.config;

import com.vageesh.springboot.collegeplacement.security.CustomAuthenticationFailureHandler;
import com.vageesh.springboot.collegeplacement.security.CustomAuthenticationSuccessHandler;
import jakarta.servlet.DispatcherType;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.configuration.AuthenticationConfiguration;
import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
@EnableMethodSecurity
public class WebSecurityConfig {

    private final CustomAuthenticationSuccessHandler successHandler;
    private final CustomAuthenticationFailureHandler failureHandler;

    public WebSecurityConfig(CustomAuthenticationSuccessHandler successHandler,
                             CustomAuthenticationFailureHandler failureHandler) {
        this.successHandler = successHandler;
        this.failureHandler = failureHandler;
    }
    
    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
         http
         .csrf(csrf -> csrf.disable())
         .authorizeHttpRequests(auth -> auth
             .dispatcherTypeMatchers(DispatcherType.FORWARD).permitAll()
             .requestMatchers("/login", "/register", "/WEB-INF/jsp/**", "/css/**").permitAll()
             .anyRequest().authenticated()
         )
         .formLogin(form -> form
             .loginPage("/login")
             .successHandler(successHandler)
             .failureHandler(failureHandler)
             .permitAll()
         )
         .logout(logout -> logout
             .logoutUrl("/logout")
             .logoutSuccessUrl("/login?logout")
             .permitAll()
         );
         return http.build();
    }
    
    @Bean
    public PasswordEncoder passwordEncoder() {
         return new BCryptPasswordEncoder();
    }
    
    @Bean
    public AuthenticationManager authenticationManager(AuthenticationConfiguration authConfig) throws Exception {
         return authConfig.getAuthenticationManager();
    }
}
