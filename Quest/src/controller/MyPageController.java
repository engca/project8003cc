package controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import commons.Constant.User;
import service.IQuestService;

@Controller
public class MyPageController {
	@Autowired
	IQuestService service;

	// @RequestMapping("applyPopup.do")
	// public ModelAndView applyPopup(HashMap<String, Object> params) {
	// HashMap<String, Object> tmp =
	// ModelAndView mav = new ModelAndView();
	// mav.addObject();
	// mav.setViewName("/bootstrapResources/mypage/applyPopup.jsp");
	//
	// return mav;
	// }

	@RequestMapping("applyPopupProc.do")
	public String applyPopupProc() {
		return "/bootstrapResources/mypage/applyPopup.jsp";
	}

	@RequestMapping("bookmark.do")
	public String bookmark() {
		return "/bootstrapResources/mypage/bookmark.jsp";
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
	public String mylist() {
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
	public String starpoint() {
		return "/bootstrapResources/mypage/starpoint.jsp";
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