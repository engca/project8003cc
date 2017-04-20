package controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import commons.Constant.User;
import service.IQuestService;

@Controller
public class MyPageController {
	@Autowired
	IQuestService service;

	 @RequestMapping("applyPopup.do")
	 public ModelAndView applyPopup(HashMap<String, Object> params) {
		 // 연락방법, 보상종류
	 HashMap<String, Object> tmp = service.getBoard((int)params.get("boardNo"));
	 tmp.put("contact", service.getContact((int)tmp.get("contactNo")));
	 ModelAndView mav = new ModelAndView();
	 mav.addAllObjects(tmp);
	 
	 mav.setViewName("/bootstrapResources/mypage/applyPopup.jsp");
	
	 return mav;
	 }

	@RequestMapping("applyPopupProc.do")
	public String applyPopupProc() {
		return "/bootstrapResources/mypage/applyPopup.jsp";
	}

	@RequestMapping("bookmark.do")
	public String bookmark() {
		return "/bootstrapResources/mypage/bookmark.jsp";
	}
	
	@RequestMapping("bookmarkProc.do")
	public ModelAndView bookmarkProc(HttpSession session) {
		int index = (int)session.getAttribute("userIndex");
		HashMap<String, Object> tmp = new HashMap<>();
		tmp.put("userIndex", (int) session.getAttribute("userInder"));
				
		ModelAndView mav = new ModelAndView();
		mav.addObject("bookmarkList",service.listBookmark(tmp)); //boardNo List
//		for(HashMap<String, Object> boardNo : service.listBookmark(tmp)){
//			service.getBoard(boardNo);
//		}
			
		
//		mav.addAllObjects(service.getBoard(boardNo));
		mav.setViewName("/bootstrapResources/mypage/bookmark.jsp");
		return mav;
	}

	@RequestMapping("bookmarkPopup.do")
	public String bookmarkPopup() {
		return "/bootstrapResources/mypage/bookmarkPopup.jsp";
	}

	@RequestMapping("complete.do")
	public String complete() {
		return "/bootstrapResources/mypage/complete.jsp";
	}

	@RequestMapping("mylist.do")
	public String mylist(@RequestParam(defaultValue="9") int boardFlag,Model model) {
		model.addAttribute("boardFlag", boardFlag);
		
		return "/bootstrapResources/mypage/mylist.jsp";
	}
	

	@RequestMapping("profile.do")
	public ModelAndView profile(HttpSession session) {
		int index = (int) session.getAttribute("userIndex");
		HashMap<String, Object> user = service.getUser(index);
		ModelAndView mav = new ModelAndView();
		mav.addAllObjects(user);
		mav.setViewName("/bootstrapResources/mypage/profile.jsp");
		return mav;
	}

	@RequestMapping("starpoint.do")
	public String starpoint(int boardNo, Model model) {
		model.addAttribute("boardNo", boardNo);
		return "/bootstrapResources/mypage/starpoint.jsp";
	} 
	
	@RequestMapping("starpointProc.do")
	public String starpointProc(HttpSession session, int boardNo, int starpoint) {
		int userIndex = (int)session.getAttribute("userIndex");
		int mode=0;
		HashMap<String, Object> params = new HashMap<>();
		params.put("boardNo", boardNo);
		params.put("userIndex", userIndex);
		if(service.isMyBoard(params))
			mode = 0;
		else 
			mode = 1;
		service.writeScore(boardNo, starpoint, mode);
		return "redirect:complete.do";
	}

	@RequestMapping("profileProc.do")
	public String profileProc(HashMap<String, Object> params) {
		HashMap<String, Object> origin_User = service.getUser((int) params.get("userIndex"));

		if (params.get("pass") != null) {
			origin_User.put("pass", params.get("pass"));
		}

		if (params.get("nickname") != null) {
			origin_User.put("nickname", params.get("nickname"));
		}

		service.updateUser(origin_User);

		return "redirect:profile.do";

	}
}