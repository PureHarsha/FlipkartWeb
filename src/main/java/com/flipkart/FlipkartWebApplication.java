package com.flipkart;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@ComponentScan
@SpringBootApplication
public class FlipkartWebApplication {

	public static void main(String[] args) {
		SpringApplication.run(FlipkartWebApplication.class, args);
	}

}
