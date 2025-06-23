package com.controller.user;

import com.entity.user.Customer;
import com.entity.common.Role;
import com.repository.CustomerRepository;
import com.repository.RoleRepository;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/user")
public class CustomerController {

    @Autowired
    private CustomerRepository customerRepository;

    @Autowired
    private RoleRepository roleRepository;
    
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

        if (customerRepository.findByEmail(email) != null) {
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

        Customer customer = customerRepository.findByEmail(email);
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
}
