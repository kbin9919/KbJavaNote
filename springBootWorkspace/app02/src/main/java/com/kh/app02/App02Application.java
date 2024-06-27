package com.kh.app02;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;

@SpringBootApplication
@EnableScheduling
public class App02Application {

	public static void main(String[] args) {
		SpringApplication.run(App02Application.class, args);
	}

}
