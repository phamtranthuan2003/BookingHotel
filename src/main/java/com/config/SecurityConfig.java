package com.config;

import com.security.jwt.JwtAuthenticationFilter;
import com.service.CustomUserDetailsService;

import org.springframework.context.annotation.*;
import org.springframework.security.authentication.*;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

@Configuration
public class SecurityConfig {

    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http, JwtAuthenticationFilter jwtFilter) throws Exception {
        http
            .csrf(csrf -> csrf.disable())

            .sessionManagement(session -> session.sessionCreationPolicy(SessionCreationPolicy.STATELESS))

            .authorizeHttpRequests(auth -> auth
                .requestMatchers(
                    "/api/user/login", "/api/user/signup", "/api/user/forgotPassword",
                    "/api/user/enterOTP", "/api/user/verifyOtp", "/api/user/resetPassword"
                ).permitAll()

                .requestMatchers("/admin/**").hasAuthority("ROLE_ADMIN")

                .requestMatchers("/api/admin/**").hasAuthority("ROLE_ADMIN")

                .requestMatchers("/api/**").authenticated()

                .anyRequest().permitAll()
            )

            .logout(logout -> logout
                .logoutUrl("/api/user/logout")
                .logoutSuccessHandler((req, res, auth) -> res.setStatus(200))
            )

            .addFilterBefore(jwtFilter, UsernamePasswordAuthenticationFilter.class);

        return http.build();
    }

    @Bean
    public AuthenticationManager authManager(HttpSecurity http, CustomUserDetailsService uds) throws Exception {
        return http.getSharedObject(AuthenticationManagerBuilder.class)
                .userDetailsService(uds)
                .passwordEncoder(passwordEncoder())
                .and()
                .build();
    }

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }
}
