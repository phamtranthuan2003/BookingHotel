package com.service;

import com.entity.user.Customer;
import com.repository.CustomerRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import java.util.Random;
import java.util.concurrent.TimeUnit;

@Service
@RequiredArgsConstructor
public class ForgotPasswordService {

    private final CustomerRepository customerRepository;
    private final JavaMailSender mailSender;
    private final RedisTemplate<String, String> redisTemplate;

    private static final long OTP_TTL = 10;

    public void sendOtpToEmail(String email) {
        Customer customer = customerRepository.findByEmail(email)
                .orElseThrow(() -> new RuntimeException("Email không tồn tại"));

        String otp = String.format("%06d", new Random().nextInt(1000000));
        redisTemplate.opsForValue().set(email, otp, OTP_TTL, TimeUnit.MINUTES);
        sendEmail(email, otp);
    }

    /**
     * Gửi email chứa mã OTP
     */
    private void sendEmail(String to, String otp) {
        SimpleMailMessage message = new SimpleMailMessage();
        message.setTo(to);
        message.setSubject("Mã OTP đặt lại mật khẩu");
        message.setText("Mã OTP của bạn là: " + otp + "\nMã có hiệu lực trong 10 phút.");
        mailSender.send(message);
    }

    public boolean verifyOtp(String email, String otp) {
        String storedOtp = redisTemplate.opsForValue().get(email);

        if (storedOtp == null) {
            throw new RuntimeException("Mã OTP không tồn tại hoặc đã hết hạn.");
        }

        if (!storedOtp.equals(otp)) {
            throw new RuntimeException("Mã OTP không chính xác.");
        }

        redisTemplate.delete(email);
        return true;
    }

    public void resetPassword(String email, String newPassword) {
        Customer customer = customerRepository.findByEmail(email)
                .orElseThrow(() -> new RuntimeException("Không tìm thấy người dùng."));

        customer.setPassword(newPassword);
        customerRepository.save(customer);

        redisTemplate.delete(email);
    }
}
