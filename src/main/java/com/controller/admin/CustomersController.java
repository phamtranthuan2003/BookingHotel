package com.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import com.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import java.util.List;
import com.entity.user.Customer;
@Controller
@RequestMapping("/admin")
public class CustomersController {

    @Autowired
    private CustomerService customerService;
    @GetMapping("/customers")
    public String customers(Model model) {
        List<Customer> customers = customerService.findAll();
        model.addAttribute("customers", customers);
        return "admin/customers";
    }
}
