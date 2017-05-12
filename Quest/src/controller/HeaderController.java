package controller;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import commons.Constant;
import service.IQuestService;

@Controller
public class HeaderController {
	@Autowired
	IQuestService service;

	@RequestMapping("loginForm.do")
	public String loginForm() {
		return "loginForm.popup";
	}

	@RequestMapping(value = "loginCheck.do", method = RequestMethod.POST)
	@ResponseBody public String loginCheck(String id, String pw, int loginCategory) {
		System.out.println(id+pw+loginCategory);
		if(service.login(id, pw) != null) {
			return "success";
		} else {
			return "fail";
		}
	}
	
	@RequestMapping(value = "login.do", method = RequestMethod.POST)
	public String login(HttpSession session, String id, String pw, int loginCategory, @RequestParam(defaultValue="noname") String name) throws Exception {
		System.out.println("로그인>>>>>>>>" + id + " " + pw + " " + loginCategory + " " + name);
		session.setAttribute("loginCategory", loginCategory);
		MessageDigest md = MessageDigest.getInstance("MD5");
		md.update(pw.getBytes());
		byte[] result = md.digest();
		StringBuffer sb = new StringBuffer();
		for (int i=0 ; i < result.length ; i++)
		{
			sb.append(Integer.toHexString(0xFF&result[i]));
		}
		if (loginCategory == 1) {
			if (service.login(id, sb.toString()) != null) {
				HashMap<String, Object> user = service.getUser(service.getUserIndexById(id));
				session.setAttribute(Constant.User.USERINDEX, user.get(Constant.User.USERINDEX));
				session.setAttribute(Constant.User.NICKNAME, user.get(Constant.User.NICKNAME));
				session.setAttribute(Constant.User.USERID, user.get(Constant.User.USERID));
				System.out.println("login>>>>>>>" + user.get(Constant.User.USERINDEX) + " "
						+ user.get(Constant.User.NICKNAME) + " " + user.get(Constant.User.USERID));
			} else {
				System.out.println("널이라구욧");
			}
		} else if (loginCategory == 2) {
			System.out.println("facebook");
			session.setAttribute(Constant.User.NICKNAME, name);
			session.setAttribute(Constant.User.USERID, id);
		} else if (loginCategory == 3) {
			System.out.println("kakao");
			session.setAttribute(Constant.User.NICKNAME, name);
			session.setAttribute(Constant.User.USERID, id);
		} else if (loginCategory == 4) {
			System.out.println("naver");
			session.setAttribute(Constant.User.NICKNAME, name);
			session.setAttribute(Constant.User.USERID, id);
		} else if (loginCategory == 5) {
			System.out.println("google");
			session.setAttribute(Constant.User.NICKNAME, name);
			session.setAttribute(Constant.User.USERID, id);
		}
		return "redirect:listBoard.do";
	}

	@RequestMapping("logout.do")
	public String logout(HttpSession session) {
		session.removeAttribute(Constant.User.USERID);
		session.removeAttribute(Constant.User.NICKNAME);
		session.removeAttribute(Constant.User.USERINDEX);
		return "redirect:listBoard.do";
	}

	@RequestMapping("searchBoard.do")
	public ModelAndView searchBoard(@RequestParam(defaultValue = "0") int boardFlag,
			@RequestParam(defaultValue = "0") int searchFlag, @RequestParam(defaultValue = "1") int page,
			@RequestParam(required = false) String searchKey, @RequestParam(required = false) String[] area) {
		System.out.println("controller");
		HashMap<String, Object> data = service.searchBoardList(boardFlag, searchFlag, page, searchKey, area);
		ModelAndView mav = new ModelAndView();

		if (boardFlag == 0) {
			data.put("header1", "잘해요");
		} else if (boardFlag == 1) {
			data.put("header1", "해주세요");
		}
		mav.addAllObjects(data);
		mav.setViewName("search.header.searchBoard");
		return mav;
	}

	@RequestMapping("joinForm.do")
	public String joinForm() {
		return "redirect:join.do";
	}

	@RequestMapping("search.do")
	public String search() {
		return "bootstrapResources/header/search.jsp";
	}

	@RequestMapping("header.do")
	public String header() {
		// session.setAttribute("id", id);
		return "bootstrapResources/header/header.jsp";
	}

	@RequestMapping("mypageMenu.do")
	public String mypageMenu() {
		// session.setAttribute("id", id);
		return "bootstrapResources/header/mypageMenu.jsp";
	}
}
