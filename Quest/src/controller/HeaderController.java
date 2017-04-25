package controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import commons.Constant;
import service.IQuestService;
  
@Controller
public class HeaderController {
	@Autowired
	IQuestService service;
	@RequestMapping("login.do")
	public String login(HttpSession session, String id, String pw){
		if(service.login(id, pw)!=null)
		{
			HashMap<String, Object> user = service.getUser(service.getUserIndexById(id));
			session.setAttribute(Constant.User.USERINDEX,user.get(Constant.User.USERINDEX));
			session.setAttribute(Constant.User.NICKNAME, user.get(Constant.User.NICKNAME));
			session.setAttribute(Constant.User.USERID, user.get(Constant.User.USERID));
		}
		return "listBoard.do";
	}
	@RequestMapping("logout.do")
	public String logout(HttpSession session){
			session.removeAttribute(Constant.User.USERID);
			session.removeAttribute(Constant.User.NICKNAME);
			session.removeAttribute(Constant.User.USERINDEX);
		return "redirect:listBoard.do";
	}
	@RequestMapping("joinForm.do")
	public String joinForm(){
		return "redirect:join.do";
	}
	
	@RequestMapping("search.do")
	public String search(){
		return "bootstrapResources/header/search.jsp";
		}
	@RequestMapping("header.do")
	public String header(){
//		session.setAttribute("id", id);
		return "bootstrapResources/header/header.jsp";
		}
	@RequestMapping("mypageMenu.do")
	public String mypageMenu(){
//		session.setAttribute("id", id);
		return "bootstrapResources/header/mypageMenu.jsp";
		}
}
