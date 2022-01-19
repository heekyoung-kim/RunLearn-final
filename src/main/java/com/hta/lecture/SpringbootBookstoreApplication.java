package com.hta.lecture;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan(basePackages="com.sample.bookstore.mapper")
public class SpringbootBookstoreApplication {

	public static void main(String[] args) {
		SpringApplication.run(SpringbootBookstoreApplication.class, args);
	}

}
