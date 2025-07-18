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
            .csrf(csrf -> csrf.disable()) // ✅ Tắt CSRF vì không dùng session

            .sessionManagement(session -> session.sessionCreationPolicy(SessionCreationPolicy.STATELESS)) // ✅ Không tạo session

            .authorizeHttpRequests(auth -> auth
                .requestMatchers(
                    "/api/user/login", "/api/user/signup", "/api/user/forgotPassword",
                    "/api/user/enterOTP", "/api/user/verifyOtp", "/api/user/resetPassword"
                ).permitAll()

                .requestMatchers("/api/admin/**").hasRole("ADMIN") // Bảo vệ API admin
                .requestMatchers("/api/**").authenticated()        // Các API khác yêu cầu JWT
                .anyRequest().permitAll()                          // Cho phép truy cập trang tĩnh, trang chủ, v.v.
            )

            // ❌ KHÔNG cấu hình .formLogin()

            .logout(logout -> logout
                .logoutUrl("/api/user/logout") // nếu bạn có endpoint logout API
                .logoutSuccessHandler((req, res, auth) -> res.setStatus(200))
            )

            // ✅ Thêm filter JWT
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
