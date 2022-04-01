package com.project.pms.utils;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.project.pms.interceptor.LoginInterceptor;

@Configuration
public class WebConfig implements WebMvcConfigurer{

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		
		registry.addInterceptor(new LoginInterceptor())
		.order(1)
		.addPathPatterns("/**")
		.excludePathPatterns("/emp/login.do","/emp/loginProcess.do","/emp/logout.do");
		
	}

}
