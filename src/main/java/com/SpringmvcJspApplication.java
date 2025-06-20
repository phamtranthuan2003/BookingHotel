package com;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.context.annotation.ComponentScan;


@SpringBootApplication
@EntityScan(basePackages = {"com.entity"})
@ComponentScan(basePackages = "com")
public class SpringmvcJspApplication {
    public static void main(String[] args) {
        SpringApplication.run(SpringmvcJspApplication.class, args);
    }
}
