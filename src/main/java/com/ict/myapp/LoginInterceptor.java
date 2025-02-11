package com.ict.myapp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.lang.Nullable;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter {
	
	@Override
	public boolean preHandle(HttpServletRequest request,HttpServletResponse response, Object handler) throws Exception {
		HttpSession session = request.getSession();
		
		String logStatus = (String)session.getAttribute("logStatus");
		
		if(logStatus==null || !logStatus.equals("Y")) {
			response.sendRedirect(request.getContextPath()+"/member/login");
		}
		
		return true;
	}
	
	public void postHandle(HttpServletRequest request,HttpServletResponse response, Object handler,
			@Nullable Exception e) throws Exception {

	}
	
}
