package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

@Component
public class LoginCheckInterceptor extends HandlerInterceptorAdapter{
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		//
		super.postHandle(request, response, handler, modelAndView);
	}
	
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub
//		return super.preHandle(request, response, handler);
		//false를 리턴하면 request를 중단하고 리턴하여 컨트롤러와 남은 인터셉터들은 실행되지 않는다.
				
		if(request.getSession().getAttribute("id")== null){
			response.sendRedirect("main.do");
			return false;
		}
		else
			return true;
			
	}
	
	
}
