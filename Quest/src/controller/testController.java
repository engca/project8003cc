package controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import service.IQuestService;

public class testController implements Controller{
	private ApplicationContext context = new GenericXmlApplicationContext("applicationContext.xml");
	private IQuestService service = context.getBean("questService", IQuestService.class);
	@Override
	public ModelAndView handleRequest(HttpServletRequest arg0, HttpServletResponse arg1) throws Exception {
		// TODO Auto-generated method stub
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", service.selectAll());
		mav.setViewName("testJSP.jsp");
		return mav;
	}
	
}
