package com.kh.app01;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan
public class App01Application {

	public static void main(String[] args)
	{
		SpringApplication.run(App01Application.class, args);
	}


}
