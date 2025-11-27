package com.example;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@SpringBootApplication
@RestController
public class App {

    public static void main(String[] args) {
        SpringApplication.run(App.class, args);
    }

    @GetMapping("/")
    public String hola() {
        return "Hola desde Spring Boot desplegado en Azure con Docker y GitHub Actions!";
    }

    @GetMapping("/suma")
    public int sumaEndpoint(@RequestParam int a, @RequestParam int b) {
        return sumar(a, b);
    }

    // 👇 Este método es el que reclama AppTest
    public static int sumar(int a, int b) {
        return a + b;
    }
}
