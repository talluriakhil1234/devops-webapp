package com.devops.app;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class DevOpsController {

    @GetMapping("/")
    public String home() {
        return "DevOps CI/CD Project is running successfully!";
    }

    @GetMapping("/health")
    public String health() {
        return "UP";
    }
}