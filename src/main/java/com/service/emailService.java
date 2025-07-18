package com.service;

import com.entity.user.Contact;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
public class emailService {

    @Autowired
    private JavaMailSender mailSender;

    public void sendMail(String toEmail, Contact form) {
        SimpleMailMessage mailMessage = new SimpleMailMessage();
        mailMessage.setTo(toEmail);
        mailMessage.setSubject("Liên hệ từ website: " + form.getSubject());
        mailMessage.setText(
                "Họ và Tên: " + form.getName() + "\n" +
                "Email: " + form.getEmail() + "\n" +
                "Số điện thoại: "  + form.getPhone() + "\n" +
                "Nội dung: \n" + form.getMessage()
        );
        mailSender.send(mailMessage);
    }
}
