package com.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.ui.Model;

import java.util.List;

import com.entity.common.Role;
import com.entity.user.Customer;
import com.repository.CustomerRepository;
import com.repository.RoleRepository;
import com.service.CustomerService;

@Controller
@RequestMapping("/admin")
public class CustomersController {

    @Autowired
    private PasswordEncoder passwordEncoder;
    
    @Autowired
    private CustomerService customerService;

    @Autowired
    private CustomerRepository customerRepository;

    @Autowired
    private RoleRepository roleRepository;

    // Danh sách khách hàng
    @GetMapping("/customers")
    public String listCustomers(Model model) {
        List<Customer> customers = customerService.findAll();
        model.addAttribute("customers", customers);
        return "admin/customer/customersList";
    }

    // Hiển thị form thêm
    @GetMapping("/addCustomer")
    public String showAddCustomerForm(Model model) {
        List<Role> roles = roleRepository.findAll();
        model.addAttribute("roles", roles);
        return "admin/customer/addCustomer";
    }

    // Xử lý thêm mới
    @PostMapping("/addCustomer")
    public String signupSubmit(@RequestParam String name,
                               @RequestParam String email,
                               @RequestParam String password,
                               @RequestParam String rePassword,
                               @RequestParam String phone,
                               @RequestParam String address,
                               @RequestParam Long roleId,
                               Model model) {

        if (customerRepository.findByEmail(email) != null) {
            model.addAttribute("Error", "Email đã được sử dụng");
            model.addAttribute("roles", roleRepository.findAll());
            return "admin/customer/addCustomer";
        }

        if (!password.equals(rePassword)) {
            model.addAttribute("Error", "Mật khẩu không khớp");
            model.addAttribute("roles", roleRepository.findAll());
            return "admin/customer/addCustomer";
        }

        Role role = new Role();
        role.setId(roleId);

        Customer customer = new Customer();
        customer.setName(name);
        customer.setEmail(email);
        customer.setPassword(passwordEncoder.encode(password));
        customer.setPhone(phone);
        customer.setAddress(address);
        customer.setRole(role);

        customerRepository.save(customer);
        return "redirect:/admin/customers";
    }

    // Hiển thị form sửa
    @GetMapping("/editCustomer/{id}")
    public String showEditCustomerForm(@PathVariable Long id, Model model) {
        Customer customer = customerRepository.findById(id).orElse(null);
        if (customer == null) {
            model.addAttribute("Error", "Khách hàng không tồn tại");
            return "redirect:/admin/customers";
        }
        List<Role> roles = roleRepository.findAll();
        model.addAttribute("customer", customer);
        model.addAttribute("roles", roles);
        return "admin/customer/editCustomer";
    }

    // Xử lý cập nhật
    @PostMapping("/editCustomer/{id}")
    public String editCustomerSubmit(@PathVariable Long id,
                                     @RequestParam String name,
                                     @RequestParam String email,
                                     @RequestParam String phone,
                                     @RequestParam String address,
                                     @RequestParam Long roleId,
                                     @RequestParam(required = false) String password,
                                     Model model) {

        Customer customer = customerRepository.findById(id).orElse(null);
        if (customer == null) {
            model.addAttribute("Error", "Khách hàng không tồn tại");
            return "redirect:/admin/customers";
        }

        Customer existing = customerRepository.findByEmail(email).orElse(null);
        if (existing != null && !existing.getId().equals(customer.getId())) {
            model.addAttribute("Error", "Email đã được sử dụng");
            model.addAttribute("customer", customer);
            model.addAttribute("roles", roleRepository.findAll());
            return "admin/customer/editCustomer";
        }

        Role role = new Role();
        role.setId(roleId);

        customer.setName(name);
        customer.setEmail(email);
        customer.setPhone(phone);
        customer.setAddress(address);
        customer.setRole(role);
        if (password != null && !password.trim().isEmpty()) {
            customer.setPassword(passwordEncoder.encode(password));
        }
        customerRepository.save(customer);
        return "redirect:/admin/customers";
    }

    // Xóa khách hàng
    @GetMapping("/deleteCustomer/{id}")
    public String deleteCustomer(@PathVariable Long id, Model model) {
        Customer customer = customerRepository.findById(id).orElse(null);
        if (customer == null) {
            model.addAttribute("Error", "Khách hàng không tồn tại");
            return "redirect:/admin/customers";
        }
        customerRepository.delete(customer);
        return "redirect:/admin/customers";
    }
}
