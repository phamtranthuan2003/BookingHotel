package com.service;

import com.entity.user.Customer;
import java.util.List;

public interface CustomerService {
    List<Customer> findAll();
    boolean existsByEmail(String email);
}
