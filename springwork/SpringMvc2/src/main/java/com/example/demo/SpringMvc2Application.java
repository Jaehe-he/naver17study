package com.example.demo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan({"*.test","data.dto"})
public class SpringMvc2Application {

	public static void main(String[] args) {
		SpringApplication.run(SpringMvc2Application.class, args);
	}

}
