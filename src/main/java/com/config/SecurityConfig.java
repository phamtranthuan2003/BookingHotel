package com.config;

import com.security.jwt.JwtAuthenticationFilter;
import com.service.CustomUserDetailsService;

import org.springframework.beans.factory.annotation.Autowired;
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
            .csrf(csrf -> csrf.disable()) // ❌ Không dùng CSRF vì không có session

            .sessionManagement(session -> session.sessionCreationPolicy(SessionCreationPolicy.STATELESS)) // ❌ Không dùng session

            .authorizeHttpRequests(auth -> auth
                // ✅ Các endpoint công khai
                .requestMatchers(
                    "/api/user/login", "/api/user/signup", "/api/user/forgotPassword",
                    "/api/user/enterOTP", "/api/user/verifyOtp", "/api/user/resetPassword"
                ).permitAll()

                // ✅ Bảo vệ trang JSP UI Admin (QUAN TRỌNG!)
                .requestMatchers("/admin/**").hasRole("ADMIN")

                // ✅ Bảo vệ API Admin
                .requestMatchers("/api/admin/**").hasRole("ADMIN")

                // ✅ Bảo vệ các API người dùng (cần đăng nhập)
                .requestMatchers("/api/**").authenticated()

                // ✅ Các request còn lại (trang chủ, contact, CSS, JS, ...)
                .anyRequest().permitAll()
            )

            // ❌ Không dùng formLogin

            // ✅ Cấu hình logout nếu cần dùng
            .logout(logout -> logout
                .logoutUrl("/api/user/logout")
                .logoutSuccessHandler((req, res, auth) -> res.setStatus(200))
            )

            // ✅ Thêm filter xử lý JWT
            .addFilterBefore(jwtFilter, UsernamePasswordAuthenticationFilter.class);

        return http.build();
    }

    // ✅ AuthenticationManager cho việc xác thực JWT login
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
