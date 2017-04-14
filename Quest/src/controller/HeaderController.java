package controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import service.IQuestService;
 
@Controller
public class HeaderController {
	@Autowired
	IQuestService service;
	@RequestMapping("login.do")
	public String login(HttpSession session, String id, String pw){
		if(service.login(id, pw)!=null)
			session.setAttribute("id", id);
		
		return "redirect:main.do";
	}
	@RequestMapping("logout.do")
	public String logout(HttpSession session){
			session.removeAttribute("id");
		return "redirect:main.do";
	}
	@RequestMapping("joinForm.do")
	public String joinForm(){
		return "redirect:joinForm.jsp";
	}
	
	
	@RequestMapping("header.do")
	public String header(){
//		session.setAttribute("id", id);
		return "header/header.jsp";
		}
}
