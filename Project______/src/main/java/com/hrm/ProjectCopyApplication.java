package com.hrm;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.web.filter.HiddenHttpMethodFilter;

@SpringBootApplication
//@ComponentScan(basePackages = {"com.example", "com.test"})
public class ProjectCopyApplication {

	public static void main(String[] args) {
		SpringApplication.run(ProjectCopyApplication.class, args);
	}
	@Bean
	   public HiddenHttpMethodFilter hiddenHttpMethodFilter(){
	      return new HiddenHttpMethodFilter();
	   }

}
