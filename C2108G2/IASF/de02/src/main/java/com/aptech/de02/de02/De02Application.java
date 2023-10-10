package com.aptech.de02.de02;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan(basePackages = "com.aptech.de02.de02")
public class De02Application {

	public static void main(String[] args) {
		SpringApplication.run(De02Application.class, args);
	}

}
