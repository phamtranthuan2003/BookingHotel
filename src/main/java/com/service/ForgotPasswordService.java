package com.service;

import com.entity.user.Customer;
import com.entity.user.PasswordResetOTP;
import com.repository.CustomerRepository;
import com.repository.PasswordResetOTPRepository;

import lombok.RequiredArgsConstructor;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.Optional;
import java.util.Random;

@Service
@RequiredArgsConstructor
public class ForgotPasswordService {

    private final CustomerRepository customerRepository;
    private final PasswordResetOTPRepository otpRepository;
    private final JavaMailSender mailSender;

    @Transactional
    public void sendOtpToEmail(String email) {
        Customer customer = customerRepository.findByEmail(email)
                .orElseThrow(() -> new RuntimeException("Email không tồn tại"));

        // Xóa tất cả mã OTP cũ theo email
        otpRepository.deleteByEmail(email);

        // Tạo mã OTP mới
        String otp = String.format("%06d", new Random().nextInt(1000000));

        PasswordResetOTP resetOtp = PasswordResetOTP.builder()
                .email(email)
                .otp(otp)
                .expirationTime(LocalDateTime.now().plusMinutes(10))
                .build();

        otpRepository.save(resetOtp);
        sendEmail(email, otp);
    }

    private void sendEmail(String to, String otp) {
        SimpleMailMessage message = new SimpleMailMessage();
        message.setTo(to);
        message.setSubject("Mã OTP đặt lại mật khẩu");
        message.setText("Mã OTP của bạn là: " + otp + "\nMã có hiệu lực trong 10 phút.");
        mailSender.send(message);
    }

    @Transactional
    public boolean verifyOtp(String email, String otp) {
        Optional<PasswordResetOTP> optionalOtp = otpRepository.findByEmail(email);

        if (optionalOtp.isEmpty()) {
            throw new RuntimeException("Không tìm thấy mã OTP cho email này.");
        }

        PasswordResetOTP resetOtp = optionalOtp.get();

        if (!resetOtp.getOtp().equals(otp)) {
            throw new RuntimeException("Mã OTP không chính xác.");
        }

        if (resetOtp.getExpirationTime().isBefore(LocalDateTime.now())) {
            throw new RuntimeException("Mã OTP đã hết hạn.");
        }

        // Xác thực thành công thì xóa OTP
        otpRepository.delete(resetOtp);

        return true;
    }

    @Transactional
    public void resetPassword(String email, String newPassword) {
        Optional<Customer> optionalCustomer = customerRepository.findByEmail(email);
        if (optionalCustomer.isEmpty()) {
            throw new RuntimeException("Không tìm thấy người dùng.");
        }

        Customer customer = optionalCustomer.get();
        customer.setPassword(newPassword);
        customerRepository.save(customer);

        // Xóa OTP nếu còn sót
        otpRepository.findByEmail(email).ifPresent(otpRepository::delete);
    }
}
