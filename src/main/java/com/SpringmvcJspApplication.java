package com;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;

@SpringBootApplication
@EntityScan(basePackages = {"com.entity"})
public class SpringmvcJspApplication {
    public static void main(String[] args) {
        SpringApplication.run(SpringmvcJspApplication.class, args);
    }
}
