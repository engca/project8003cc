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
	public ModelAndView BoardAllList(@RequestParam(defaultValue = "1") int boardFlag, @RequestParam(defaultValue="1")int page ){		
		HashMap<String, Object> data = service.getBoardList(boardFlag, page); 
		ModelAndView mav = new ModelAndView();
		if(boardFlag==0){
			data.put("header1", "잘해요");     
		}
		else if(boardFlag==1){
			data.put("header1", "해주세요");
		}
//		System.out.println(data);
		mav.addAllObjects(data);
		mav.setViewName("search.main.listBoard");
		return mav;		
	}
	@RequestMapping("webJoinNick.do")
	public String webJoinNick(String id){
		return "search.main.webJoinNick";
	}
	
	@RequestMapping("webJoin.do")
	public ModelAndView webJoin(String id, int num){
		ModelAndView mav = new ModelAndView();
		mav.addObject("id", id);
		mav.addObject("num", num);
		mav.setViewName("search.main.webJoin");
		return mav;
	}
	
	@RequestMapping(value = "webLogin.do", method = RequestMethod.POST)
	public ModelAndView webLogin(String id, String pw, String name, int loginCategory){
		HashMap<String, Object> params = new HashMap<>();
		params.put("userId", id);
		params.put("password", pw);
		params.put("nickname", name);
		params.put("loginCategory", loginCategory);
		service.join(params);
		
		ModelAndView mav = new ModelAndView();
//		mav.addObject("id", id);
//		mav.addObject("pw", pw);
//		mav.addObject("name", name);
//		mav.addObject("loginCategory", loginCategory);
		mav.setViewName("login.do");
		System.out.println("weblogin : " + mav);
		return mav;
	}
	
	
	@RequestMapping("join.do")
	public String join(){
		return "search.main.join";
	}
	
	@RequestMapping(method=RequestMethod.POST, value="userjoin.do")
	public ModelAndView join(String id, String pw, String name,  int loginCategory) throws Exception{
		// 비밀번호 해쉬로 변경 저장.
		MessageDigest md = MessageDigest.getInstance("MD5");
		md.update(pw.getBytes());
		byte[] result = md.digest();
		StringBuffer sb = new StringBuffer();
		for (int i=0 ; i < result.length ; i++)
		{
			sb.append(Integer.toHexString(0xFF&result[i]));
		}		
		
		HashMap<String, Object> param = new HashMap<>();
		param.put("userId", id );
		param.put("password", sb.toString());
		param.put("nickname", name);
		param.put("loginCategory", loginCategory);
		service.join(param);
		
		ModelAndView mav = new ModelAndView();
//		mav.addObject("id", userId);
//		mav.addObject("pw", password);
//		mav.addObject("name", nickname);
//		mav.addObject("loginCategory", loginCategory);
		mav.setViewName("login.do");
		return mav;		
	}	
	
	@RequestMapping("idCheck.do")
	public void idCheck(String userId, HttpServletRequest req, HttpServletResponse resp) throws IOException 	{ 
		// TODO Auto-generated method stub
		int result = service.idCheck(userId);			
		PrintWriter pw = resp.getWriter();
		pw.print(result);
		pw.close();
		pw.flush();	
	}
	
	@RequestMapping("nicknameCheck.do")
	public void nicknameCheck(String nickname, HttpServletRequest req, HttpServletResponse resp) throws IOException 	{ 
		// TODO Auto-generated method stub
		int result = service.nicknameCheck(nickname);			
		PrintWriter pw = resp.getWriter();
		pw.print(result);
		pw.close();
		pw.flush();	
	}
		
	@RequestMapping(method=RequestMethod.GET, value="viewBoard.do")
	public ModelAndView viewboard(int boardNo, @RequestParam(defaultValue="0") int userIndex){
//		int userIndex = (int)session.getAttribute(Constant.User.USERINDEX);
//		int userIndex = (int)session.getAttribute("userIndex");
		HashMap<String, Object> board = service.readBoard(boardNo, userIndex);	
		List<HashMap<String, Object>> comment = service.listComment(boardNo);
		ModelAndView mv = new ModelAndView();
		mv.addAllObjects(board);
		mv.addObject("listComment", comment);
		System.out.println("viewBoard"+board+"listComment"+comment);
		mv.setViewName("search.main.viewBoard");
		return mv;  
	}
	
	@RequestMapping(method = RequestMethod.POST, value ="insertComment.do")
	public String insertComment(@RequestParam HashMap<String, Object> comment, HttpSession session){
		service.writeComment(comment);
		return "redirect:/viewBoard.do?boardNo="+comment.get(Constant.Commnet.BOARDNO)+"&userIndex="+comment.get(Constant.Commnet.USERINDEX);
	}
	
	@RequestMapping("deleteComment.do")
	public String deleteComment(@RequestParam HashMap<String, Object> comment, HttpSession session){
		service.deleteComment(comment);
		return "redirect:/viewBoard.do?boardNo="+comment.get(Constant.Commnet.BOARDNO)+"&userIndex="+comment.get(Constant.Commnet.USERINDEX);
	}
	
	@RequestMapping("deleteBoardPopup.do")
	public String deleteBoardPopup(Model model, int boardNo){
		model.addAttribute("boardNo", boardNo);		
		return "deleteBoardPopup.popup";
	}
	
	@RequestMapping("deleteBoard.do")
	public String deleteBoard(int boardNo){
		service.deleteBoard(boardNo);
		return "redirect:/listBoard.do";
	}
	
	@RequestMapping("writeBoard.do")
	public String writeBoard(){
		return "search.main.writeBoard";
	}
	
	@RequestMapping(method = RequestMethod.POST, value = "writeBoardProc.do")
	public String writeBoardProc(@RequestParam HashMap<String, Object> board, HttpSession session){
		int userIndex = (int)session.getAttribute(Constant.User.USERINDEX);
		board.put("userIndex", userIndex);
		service.writeBoard(board);
		return "redirect:/listBoard.do";
	}
	
	@RequestMapping("getSido.do")
	public 
	@ResponseBody HashMap<String, Object> getSido(){
		HashMap<String, Object> sido = new HashMap<>();
		sido.put("sido", service.getSidoAll());
		return sido;  
	}

	@RequestMapping("getGugun.do")
	public
	@ResponseBody HashMap<String, Object> getGugun(String sido){
		HashMap<String, Object> gungu = new HashMap<>();
		gungu.put("gungu", service.getGungu(sido));
		return gungu;
	}
	
	
	@RequestMapping("updateBoard.do")
	public ModelAndView updateBoard(@RequestParam(defaultValue="0") int boardNo) {
		ModelAndView mav = new ModelAndView();
		HashMap<String, Object> board = service.getBoard(boardNo);
		HashMap<String, Object> addr = service.getAddress((int)board.get(Constant.Board.ADDRNO));
		mav.addAllObjects(board);
		mav.addAllObjects(addr);
		mav.setViewName("search.main.updateBoard");
		return mav;
	}
	
	@RequestMapping(method = RequestMethod.POST, value ="updateBoardProc.do")
	public String updateBoardProc(@RequestParam HashMap<String, Object> board,
			HttpServletRequest session){
//		int userIndex = (int)session.getAttribute(Constant.User.USERINDEX);
//		board.put("userIndex", userIndex); 세션도아직안댐
		System.out.println("updateBoard"+board);
		service.updateBoard(board);
		return "redirect:/viewBoard.do?boardNo="+board.get(Constant.Board.BOARDNO);
	}
	

	@RequestMapping("police.do")
	@ResponseBody
	public int police(int boardNo, int userIndex){
		int result = service.selectpolice(boardNo, userIndex);
		return result;
	}

	// 요거 희정 테스트확인용
	@RequestMapping("heetest.do")  
	public String heetest() {
		return "search.main.heetest";
	}

	
}
