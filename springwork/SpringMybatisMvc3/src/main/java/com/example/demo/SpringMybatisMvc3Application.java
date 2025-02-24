package com.example.demo;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan({"data.*","*.controller","com.example.demo"})
@MapperScan({"data.mapper"})
public class SpringMybatisMvc3Application {

	public static void main(String[] args) {
		SpringApplication.run(SpringMybatisMvc3Application.class, args);
	}

}