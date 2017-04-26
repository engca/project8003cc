package controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import commons.Constant;
import service.IQuestService;
  
@Controller
public class HeaderController {
	@Autowired
	IQuestService service;
	@RequestMapping(value="login.do", method=RequestMethod.POST )
	public String login(HttpSession session, String id, String pw){
		System.out.println(id + " " + pw);
		if(service.login(id, pw)!=null)
		{	
			HashMap<String, Object> user = service.getUser(service.getUserIndexById(id));
			session.setAttribute(Constant.User.USERINDEX,user.get(Constant.User.USERINDEX));
			session.setAttribute(Constant.User.NICKNAME, user.get(Constant.User.NICKNAME));
			session.setAttribute(Constant.User.USERID, user.get(Constant.User.USERID));
			System.out.println(user.get(Constant.User.USERINDEX) + " "+ user.get(Constant.User.NICKNAME) +" "+ user.get(Constant.User.USERID));
		}else
		{
			System.out.println("널이라구욧");
		}
		return "redirect:listBoard.do";
	}
	@RequestMapping("logout.do")
	public String logout(HttpSession session){
			session.removeAttribute(Constant.User.USERID);
			session.removeAttribute(Constant.User.NICKNAME);
			session.removeAttribute(Constant.User.USERINDEX);
		return "redirect:listBoard.do";
	}
	@RequestMapping("searchBoard.do")
	public ModelAndView searchBoard(
			@RequestParam(defaultValue = "0") int boardflag,
			@RequestParam(defaultValue = "0") int searchFlag,
			@RequestParam(defaultValue="1") int page ,
			@RequestParam(required = false) String searchKey,
			@RequestParam(required = false) String[] area){		
		HashMap<String, Object> data = service.searchBoardList(boardflag, searchFlag, page, searchKey , area); 
		ModelAndView mav = new ModelAndView();
		if(boardflag==0){
			data.put("header1", "잘해요");   
		}
		else if(boardflag==1){
			data.put("header1", "해주세요");
		}
		mav.addAllObjects(data);
		mav.setViewName("search.header.searchBoard");
		return mav;		
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
