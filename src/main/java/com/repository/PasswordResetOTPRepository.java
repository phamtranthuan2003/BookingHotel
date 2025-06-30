package com.repository;

import com.entity.user.PasswordResetOTP;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface PasswordResetOTPRepository extends JpaRepository<PasswordResetOTP, Long> {
    Optional<PasswordResetOTP> findByEmail(String email);
    void deleteByEmail(String email);
}
