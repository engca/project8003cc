package controller;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.bcel.Const;
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
	@ResponseBody
	public String loginCheck(String id, String pw, int loginCategory) throws Exception {
		MessageDigest md = MessageDigest.getInstance("MD5");
		md.update(pw.getBytes());
		byte[] result = md.digest();
		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < result.length; i++) {
			sb.append(Integer.toHexString(0xFF & result[i]));
		}
		if (service.login(id, sb.toString()) != null) {
			return "success";
		} else {
			return "fail";
		}
	}

	@RequestMapping(value = "setAccessToken.do", method = RequestMethod.POST)
	public void setAccessToken(HttpSession session, String token) {
		session.setAttribute("token", token);
		System.out.println(session.getAttribute("token"));
	}

	@RequestMapping(value = "login.do", method = RequestMethod.POST)
	public String login(HttpSession session, String id, String pw, int loginCategory,
			@RequestParam(defaultValue = "noname") String name) {
		
		System.out.println("로그인>>>>>>>>" + id + " " + pw + " " + loginCategory + " " + name);
		
		session.setAttribute("loginCategory", loginCategory);

		if (loginCategory == 1) {
			HashMap<String, Object> user = service.getUser(service.getUserIndexById(id));
			session.setAttribute(Constant.User.USERINDEX, user.get(Constant.User.USERINDEX));
			session.setAttribute(Constant.User.NICKNAME, user.get(Constant.User.NICKNAME));
			session.setAttribute(Constant.User.USERID, user.get(Constant.User.USERID));
			System.out.println("login>>>>>>>" + user.get(Constant.User.USERINDEX) + " "
					+ user.get(Constant.User.NICKNAME) + " " + user.get(Constant.User.USERID));
		} else {
			return webCheck(id, session, name);
		}
		return "redirect:listBoard.do"; 
	}

	@RequestMapping("logout.do")
	public String logout(HttpSession session) {
		session.removeAttribute("token");
		session.removeAttribute(Constant.User.USERID);
		session.removeAttribute(Constant.User.NICKNAME);
		session.removeAttribute(Constant.User.USERINDEX);
		return "redirect:listBoard.do";
	}

	@RequestMapping("searchBoard.do")
	public ModelAndView searchBoard(HttpSession session, @RequestParam(required=false, defaultValue="3") int boardFlag,
			@RequestParam(defaultValue = "0") int searchFlag, @RequestParam(required=false, defaultValue="1") int page,
			@RequestParam(required = false) String searchKey, @RequestParam(required = false) String[] area) {
		
		if ( session.getAttribute("boardFlag")==null && session.getAttribute("page")==null ){
			//처음 listBoard에 들어왓을때
			session.setAttribute(Constant.Board.PAGE, 1);
			session.setAttribute(Constant.Board.BOARDFLAG, 1);
			page = 1;
			boardFlag = 1;
		}	
		else if( boardFlag == 3 && page == 1)
		{
			//세번째경우 
			//만약에 쟤네 파라미터 안들어오면 얘네 0들어와야함
			page = (int)session.getAttribute("page");
			boardFlag = (int)session.getAttribute("boardFlag");
		}
		else {
			// 두번째 이상으로 들어왓을때
			// 내가 최근에 들어온 boardFlag랑 page 세션에 갱신
			session.setAttribute(Constant.Board.PAGE, page);
			session.setAttribute(Constant.Board.BOARDFLAG, boardFlag);
		}
		
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

	public String webCheck(String id, HttpSession session, String name) {
		int loginCategory = (int) session.getAttribute("loginCategory");
		if (service.idCheck(id) == 0) { 
			System.out.println("1. 아이디 사용 가능  " + id);
			return "redirect:webJoin.do?num=0&id=" + id;
		} else if (service.idCheck(id) == 1 && service.loginCategoryCheck(id) == 1) {
			System.out.println("2. 아이디가 중복이면서 loginCategory가 1인 경우");
			return "redirect:webJoin.do?num=1&id=" + id;
		} else if (service.idCheck(id) == 1 && loginCategory != service.loginCategoryCheck(id)) {
			System.out.println("2. 아이디가 중복이면서 가입경로가 다른 경우");
			return "redirect:webJoin.do?num=1&id=" + id;
		} else {
			HashMap<String, Object> user = service.getUser(service.getUserIndexById(id));
			session.setAttribute(Constant.User.USERINDEX, user.get(Constant.User.USERINDEX));
			session.setAttribute(Constant.User.NICKNAME, user.get(Constant.User.NICKNAME));
			session.setAttribute(Constant.User.USERID, user.get(Constant.User.USERID));
			session.setAttribute("loginCategory", user.get("loginCategory"));
			return "redirect:listBoard.do";
		}
	}
}
