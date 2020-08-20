package com.pknu.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AuthInterceptor extends HandlerInterceptorAdapter {

	// prehandle : 컨트롤러보다 먼저 수행되는 메소드
	@Override
	public boolean preHandle(HttpServletRequest request, 
			HttpServletResponse response, Object handler)
			throws Exception {
		
		System.out.println("prehandle:" + request.getRequestURI());
		switch( request.getRequestURI() ) { // 현재 파일정보
		case  "/AssignForm":
		case  "/LoginForm":
		case  "/getId":
		case  "/getPwd":
		case  "/":	
		case  "/loginProcess":	
		case  "/users/assignForm":	
		case  "/GetIdForm":	
		case  "/users/getIdForm":	
		case  "/GetPwdForm":	
		case  "/users/getPwdForm":	
		case  "/css/commons.css":	
		case  "/css/mainPage.css":	
		case  "/idChk":	
		case  "/assign":	
		case  "/img/main.jpg":	
			return true; // 제외
		}
		
		// session 객체를 가지고 온다
		HttpSession session = request.getSession();
		// 로그인처리를 담당하는 사용자 정보를 담고 있는 객체를 가져옴
		Object object  = session.getAttribute("login");
				System.out.println(object);
		if( object == null) {
			response.sendRedirect("/LoginForm?pop=nologin");
			
			return false; // 더이상 컨트롤러 용청으로 가지 않도록 false 리턴
		}
		
		// prehandle 의 return은 컴트롤러 요청 uri 로 가도 되는지 허가하는 의미  
		return true;
	}
	
	// posthandle : 컨트롤러가 수행되고 화면이 보여지기 직전에 수행되는 메소드
	/*
	 * @Override public void postHandle(HttpServletRequest request,
	 * HttpServletResponse response, Object handler, ModelAndView modelAndView)
	 * throws Exception { // TODO Auto-generated method stub
	 * super.postHandle(request, response, handler, modelAndView); }
	 */


}
