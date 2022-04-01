package com.project.pms.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

public class LoginInterceptor implements HandlerInterceptor {

	private final String LOGIN_URL = "/emp/login.do";

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
		if (session == null || session.getAttribute("emp") == null) { 
			
			response.sendRedirect(request.getContextPath() + LOGIN_URL);
			
			return false;
		}
		
		
		return true;
	}
	

}
