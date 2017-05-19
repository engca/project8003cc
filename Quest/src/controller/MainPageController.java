package controller;

import java.io.IOException;

import java.io.PrintWriter;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.cache.decorators.LoggingCache;
import org.apache.ibatis.javassist.expr.Instanceof;
import org.apache.tomcat.util.bcel.Const;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import commons.Constant;
import service.IQuestService;

@Controller
public class MainPageController {
	@Autowired
	IQuestService service;

	@RequestMapping("listBoard.do")
	public ModelAndView BoardAllList(HttpSession session,
			@RequestParam(required = false, defaultValue = "3") int boardFlag,
			@RequestParam(required = false, defaultValue = "1") int page) {

		if (session.getAttribute("boardFlag") == null && session.getAttribute("page") == null) {
			// 처음 listBoard에 들어왓을때
			session.setAttribute(Constant.Board.PAGE, 1);
			session.setAttribute(Constant.Board.BOARDFLAG, 1);
			page = 1;
			boardFlag = 1;
		} else if (boardFlag == 3 && page == 1) {
			// 세번째경우
			// 만약에 쟤네 파라미터 안들어오면 얘네 0들어와야함
			page = (int) session.getAttribute("page");
			boardFlag = (int) session.getAttribute("boardFlag");
		} else {
			// 두번째 이상으로 들어왓을때
			// 내가 최근에 들어온 boardFlag랑 page 세션에 갱신
			session.setAttribute(Constant.Board.PAGE, page);
			session.setAttribute(Constant.Board.BOARDFLAG, boardFlag);
		}

		HashMap<String, Object> data = service.getBoardList(boardFlag, page);
		ModelAndView mav = new ModelAndView();
		if (boardFlag == 0) {
			data.put("header1", "잘해요");
		} else if (boardFlag == 1) {
			data.put("header1", "해주세요");
		}
		mav.addAllObjects(data);
		mav.setViewName("search.main.listBoard");
		return mav;
	}

	@RequestMapping("webJoinNick.do")
	public String webJoinNick(String id) {
		return "search.main.webJoinNick";
	}

	@RequestMapping("webJoin.do")
	public ModelAndView webJoin(String id, int num) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("id", id);
		mav.addObject("num", num);
		mav.setViewName("search.main.webJoin");
		return mav;
	}

	@RequestMapping(value = "webLogin.do", method = RequestMethod.POST)
	public ModelAndView webLogin(String id, String pw, String name, int loginCategory) {
		HashMap<String, Object> params = new HashMap<>();
		params.put("userId", id);
		params.put("password", pw);
		params.put("nickname", name);
		params.put("loginCategory", loginCategory);
		service.join(params);

		ModelAndView mav = new ModelAndView();
		mav.setViewName("login.do");
		return mav;
	}

	@RequestMapping("join.do")
	public String join() {
		return "search.main.join";
	}

	@RequestMapping(method = RequestMethod.POST, value = "userjoin.do")
	public ModelAndView join(String id, String pw, String name, int loginCategory, int findPwQ, String findPwA)
			throws Exception {
		// 비밀번호 해쉬로 변경 저장.
		MessageDigest md = MessageDigest.getInstance("MD5");
		md.update(pw.getBytes());
		byte[] result = md.digest();
		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < result.length; i++) {
			sb.append(Integer.toHexString(0xFF & result[i]));
		}

		HashMap<String, Object> param = new HashMap<>();
		param.put("userId", id);
		param.put("password", sb.toString());
		param.put("nickname", name);
		param.put("loginCategory", loginCategory);
		param.put("findPwQ", findPwQ);
		param.put("findPwA", findPwA);
		service.join(param);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("login.do");
		return mav;
	}

	@RequestMapping("findPw.do")
	public String findPw() {
		return "findPw.popup";
	}

	@RequestMapping("findPwProc.do")
	public ModelAndView findPwProc(int category, String id, String answer, String password, HttpServletRequest req,
			HttpServletResponse resp) throws IOException {
		ModelAndView mav = new ModelAndView();
		if (category == 1) {
			int question = service.findPwQ(id);
			mav.addObject("question", question);
			mav.addObject("id", id);
			mav.setViewName("findPwProc.popup");
			return mav;
		} else if (category == 2) {
			int result = service.findPwA(id, answer);
			PrintWriter pw = resp.getWriter();
			pw.print(result);
			pw.close();
			pw.flush();
		}
		return null;
	}

	@RequestMapping("changePw.do")
	public ModelAndView changePw(String id) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("id", id);
		mav.setViewName("changePw.popup");
		return mav;
	}

	@RequestMapping(value = "changePwProc.do", method = RequestMethod.POST)
	public void changePwProc(String id, String password, HttpServletRequest req, HttpServletResponse resp)
			throws IOException {

		// 비밀번호 해쉬로 변경 저장.
		MessageDigest md;
		try {
			md = MessageDigest.getInstance("MD5");
			md.update(password.getBytes());
			byte[] result = md.digest();
			StringBuffer sb = new StringBuffer();
			for (int i = 0; i < result.length; i++) {
				sb.append(Integer.toHexString(0xFF & result[i]));
			}
			int result2 = service.updatePw(id, sb.toString());
			PrintWriter pw = resp.getWriter();
			pw.print(result2);
			pw.close();
			pw.flush();
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	@RequestMapping("idCheck.do")
	public void idCheck(String userId, HttpServletRequest req, HttpServletResponse resp) throws IOException {
		// TODO Auto-generated method stub
		int result = service.idCheck(userId);
		PrintWriter pw = resp.getWriter();
		pw.print(result);
		pw.close();
		pw.flush();
	}

	@RequestMapping("nicknameCheck.do")
	public void nicknameCheck(String nickname, HttpServletRequest req, HttpServletResponse resp) throws IOException {
		// TODO Auto-generated method stub
		nickname = nickname.replaceAll(" ", "");
		int result = service.nicknameCheck(nickname);
		PrintWriter pw = resp.getWriter();
		pw.print(result);
		pw.close();
		pw.flush();
	}

	@RequestMapping(method = RequestMethod.GET, value = "viewBoard.do")
	public ModelAndView viewboard(int boardNo, @RequestParam(defaultValue = "0") int userIndex) {
		HashMap<String, Object> board = service.readBoard(boardNo, userIndex);
		List<HashMap<String, Object>> comment = service.listComment(boardNo);
		ModelAndView mv = new ModelAndView();
		mv.addAllObjects(board);
		mv.addObject("listComment", comment);
		System.out.println("viewBoard" + board + "listComment" + comment);
		mv.setViewName("search.main.viewBoard");
		return mv;
	}

	@RequestMapping(method = RequestMethod.POST, value = "insertComment.do")
	public String insertComment(@RequestParam HashMap<String, Object> comment, HttpSession session) {

		String content = (String)comment.get("content");
		content = content.replaceAll("\r\n", "<br>");
		comment.put("content", content);
		service.writeComment(comment);		
		return "redirect:/viewBoard.do?boardNo=" + comment.get(Constant.Commnet.BOARDNO) + "&userIndex="
				+ comment.get(Constant.Commnet.USERINDEX);
	}

	@RequestMapping("deleteComment.do")
	public String deleteComment(@RequestParam HashMap<String, Object> comment, HttpSession session) {
		service.deleteComment(comment);
		return "redirect:/viewBoard.do?boardNo=" + comment.get(Constant.Commnet.BOARDNO) + "&userIndex="
				+ comment.get(Constant.Commnet.USERINDEX);
	}

	@RequestMapping("deleteBoardPopup.do")
	public String deleteBoardPopup(Model model, int boardNo) {
		model.addAttribute("boardNo", boardNo);
		return "deleteBoardPopup.popup";
	}

	@RequestMapping("deleteBoard.do")
	public String deleteBoard(int boardNo) {
		service.deleteBoard(boardNo);
		return "redirect:/listBoard.do";
	} 

	@RequestMapping("writeBoard.do")
	public String writeBoard() {
		return "search.main.writeBoard";
	}

	@RequestMapping(method = RequestMethod.POST, value = "writeBoardProc.do")
	public String writeBoardProc(@RequestParam HashMap<String, Object> board, HttpSession session) {
		int flag = Integer.parseInt(board.get("boardFlag").toString());
		String content = (String)board.get("content");
		content = content.replaceAll("\r\n", "<br>");
		board.put("content", content);
		if ( flag == 1) { //해주세요
			int userIndex = (int) session.getAttribute(Constant.User.USERINDEX);
			board.put("userIndex", userIndex);
			service.writeBoard(board);
			return "redirect:/listBoard.do?boardFlag=1";
		} else { //잘해요
			int userIndex = (int) session.getAttribute(Constant.User.USERINDEX);
			board.put("userIndex", userIndex);
			service.writeBoard(board);
			return "redirect:/listBoard.do?boardFlag=0";
		}
	}

	@RequestMapping("getSido.do")
	public @ResponseBody HashMap<String, Object> getSido() {
		HashMap<String, Object> sido = new HashMap<>();
		sido.put("sido", service.getSidoAll());
		return sido;
	}

	@RequestMapping("getGugun.do")
	public @ResponseBody HashMap<String, Object> getGugun(String sido) {
		HashMap<String, Object> gungu = new HashMap<>();
		gungu.put("gungu", service.getGungu(sido));
		return gungu;
	}

	@RequestMapping("updateBoard.do")
	public ModelAndView updateBoard(@RequestParam(defaultValue = "0") int boardNo) {
		ModelAndView mav = new ModelAndView();
		HashMap<String, Object> board = service.getBoard(boardNo);
		HashMap<String, Object> addr = service.getAddress((int) board.get(Constant.Board.ADDRNO));
		mav.addAllObjects(board);
		mav.addAllObjects(addr);
		mav.setViewName("search.main.updateBoard");
		return mav;
	}

	@RequestMapping(method = RequestMethod.POST, value = "updateBoardProc.do")
	public String updateBoardProc(@RequestParam HashMap<String, Object> board, HttpServletRequest session) {
		// int userIndex = (int)session.getAttribute(Constant.User.USERINDEX);
		// board.put("userIndex", userIndex); 세션도아직안댐
		System.out.println("updateBoard" + board);
		service.updateBoard(board);
		return "redirect:/viewBoard.do?boardNo=" + board.get(Constant.Board.BOARDNO);
	}

	@RequestMapping("police.do")
	@ResponseBody
	public int police(int boardNo, int userIndex) {
		int result = service.selectpolice(boardNo, userIndex);
		return result;
	}

	// 요거 희정 테스트확인용
	@RequestMapping("heetest.do")
	public String heetest() {
		return "search.main.heetest";
	}

}
