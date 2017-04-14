package controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.log4j.Logger;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LogIntercepter extends HandlerInterceptorAdapter{
	//preHandle,postHandle에서 log4j를 이용해서
	//요청에 대한 정보와 응답에 대한 정보를 로그로 기록하세요 
	
	protected Log log = LogFactory.getLog(LogIntercepter.class);
	 
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub

            log.info("======================================          START         ======================================");
            log.info(" Request URI \t:  " + request.getRequestURI());
          return super.preHandle(request, response, handler);
	}
	
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
             log.info("======================================           END          ======================================\n");
	}
}
