package com.controller.user;

import com.entity.user.Customer;
import com.entity.common.Role;
import com.repository.CustomerRepository;
import com.service.ForgotPasswordService;

import jakarta.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Optional;

@Controller
@RequestMapping("/user")
public class CustomerController {

    @Autowired
    private CustomerRepository customerRepository;

    @Autowired
    private ForgotPasswordService forgotPasswordService;

    @GetMapping("/signup")
    public String signup() {
        return "user/signup";
    }

    @PostMapping("/signup")
    public String signupSubmit(@RequestParam String name,
            @RequestParam String email,
            @RequestParam String password,
            @RequestParam String rePassword,
            @RequestParam String phone,
            @RequestParam String address,
            Model model) {

        if (customerRepository.findByEmail(email).isPresent()) {
            model.addAttribute("Error", "Email đã được sử dụng");
            return "user/signup";
        }

        if (!password.equals(rePassword)) {
            model.addAttribute("Error", "Mật khẩu không khớp");
            return "user/signup";
        }

        Customer customer = new Customer();
        customer.setName(name);
        customer.setEmail(email);
        customer.setPassword(password);
        customer.setPhone(phone);
        customer.setAddress(address);

        Role userRole = new Role();
        userRole.setId(2L);
        customer.setRole(userRole);

        customerRepository.save(customer);
        return "redirect:/user/login";
    }

    @GetMapping("/login")
    public String login() {
        return "user/login";
    }

    @PostMapping("/login")
    public String login(@RequestParam String email,
            @RequestParam String password,
            HttpSession session,
            Model model) {

        Customer customer = customerRepository.findByEmail(email).orElse(null);
        if (customer == null || !customer.getPassword().equals(password)) {
            model.addAttribute("Error", "Sai email hoặc mật khẩu");
            return "user/login";
        }

        session.setAttribute("user", customer);

        if (customer.getRole().getName().equalsIgnoreCase("ADMIN")) {
            return "redirect:/admin/homes";
        } else {
            return "redirect:/user/home";
        }
    }

    @GetMapping("/forgotPassword")
    public String showForgotPasswordForm() {
        return "user/forgotPassword";
    }

    @PostMapping("/enterOTP")
    public String forgotPassword(@RequestParam("email") String email, Model model) {
        try {
            forgotPasswordService.sendOtpToEmail(email);
            model.addAttribute("message", "Mã OTP đã được gửi đến email.");
            model.addAttribute("email", email);
            return "user/enterOtp";
        } catch (RuntimeException e) {
            model.addAttribute("error", e.getMessage());
            return "user/forgotPassword";
        }
    }
    @PostMapping("/verifyOtp")
    public String verifyOtp(@RequestParam("email") String email,
            @RequestParam("otp") String otp,
            Model model) {
        try {
            boolean valid = forgotPasswordService.verifyOtp(email, otp);
            if (valid) {
                model.addAttribute("email", email);
                return "user/resetPassword";
            } else {
                model.addAttribute("error", "Mã OTP không đúng");
                model.addAttribute("email", email);
                return "user/enterOtp";
            }
        } catch (Exception e) {
            model.addAttribute("error", e.getMessage());
            model.addAttribute("email", email);
            return "user/enterOtp";
        }
    }
    @PostMapping("/resetPassword")
    public String resetPassword(@RequestParam("email") String email,
            @RequestParam("newPassword") String newPassword,
            @RequestParam("confirmPassword") String confirmPassword,
            Model model) {
        if (!newPassword.equals(confirmPassword)) {
            model.addAttribute("error", "Mật khẩu không khớp");
            model.addAttribute("email", email);
            return "user/resetPassword";
        }

        try {
            forgotPasswordService.resetPassword(email, newPassword);
            model.addAttribute("message", "Đặt lại mật khẩu thành công, vui lòng đăng nhập.");
            return "redirect:/user/login";
        } catch (Exception e) {
            model.addAttribute("error", e.getMessage());
            model.addAttribute("email", email);
            return "user/resetPassword";
        }
    }
}
