package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import service.IQuestService;

@Controller
public class MyPageController {
	@Autowired
	IQuestService service;
	
	
	@RequestMapping("applyPopup.do")
	public String applyPopup(){
		return "/bootstrapResources/mypage/applyPopup.jsp";
	}	
	
	@RequestMapping("bookmark.do")
	public String bookmark(){
		return "/bootstrapResources/mypage/bookmark.jsp";
	}
	
	@RequestMapping("bookmarkPopup.do")
	public String bookmarkPopup(){
		return "/bootstrapResources/mypage/bookmarkPopup.jsp";
	}
	
	@RequestMapping("complete.do")
	public String complete(){
		return "/bootstrapResources/mypage/complete.jsp";
	}	
	@RequestMapping("mylist.do")
	public String mylist(){
		return "/bootstrapResources/mypage/mylist.jsp";
	}
	@RequestMapping("profile.do")
	public String profile(){
		return "/bootstrapResources/mypage/profile.jsp";
	}
	@RequestMapping("starpoint.do")
	public String starpoint(){
		return "/bootstrapResources/mypage/starpoint.jsp";
	}
}
