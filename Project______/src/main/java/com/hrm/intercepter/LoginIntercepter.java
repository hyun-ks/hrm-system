package com.hrm.intercepter;

import java.util.Arrays;
import java.util.List;

import org.springframework.web.servlet.HandlerInterceptor;

import com.hrm.emp.Employee;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class LoginIntercepter implements HandlerInterceptor {
	
	public List<String> loginEssential = Arrays.asList("/**");
	public List<String> loginInessential
    = Arrays.asList("/login/login", "/login/loginProcess");


	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		Employee e = (Employee) request.getSession().getAttribute("user");
		if (e != null && (e.getUserid() != 0)){
			return true;
		} else {
			response.sendRedirect("/login/login");
			return false;
		}
	}

}