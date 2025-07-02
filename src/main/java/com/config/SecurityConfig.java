package com.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
public class SecurityConfig {
    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
        http
            .csrf(csrf -> csrf.disable())
            .authorizeHttpRequests(auth -> auth
                .requestMatchers(
                    "/user/login",
                    "/user/signup",
                    "/user/forgotPassword",
                    "/user/enterOTP",
                    "/user/verifyOtp",
                    "/user/resetPassword",
                    "/css/**", "/js/**", "/images/**"
                ).permitAll()
                .anyRequest().permitAll() // hoặc authenticated() nếu sau này có phân quyền
            )
            .logout(logout -> logout
                .logoutUrl("/user/logout") // đúng route của bạn
                .logoutSuccessUrl("/user/login?logout=true")
                .invalidateHttpSession(true)
                .deleteCookies("JSESSIONID")
            );

        return http.build();
    }
}

