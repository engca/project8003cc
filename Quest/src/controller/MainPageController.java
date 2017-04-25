package controller;

import java.io.IOException;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.bcel.Const;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import commons.Constant;
import service.IQuestService;


@Controller
public class MainPageController {
	@Autowired
	IQuestService service; 
	 
	@RequestMapping("listBoard.do")
	public ModelAndView BoardAllList(@RequestParam(defaultValue = "0") int boardflag, @RequestParam(defaultValue="1")int page ){		
		HashMap<String, Object> data = service.getBoardList(boardflag, page); 
		ModelAndView mav = new ModelAndView();
		if(boardflag==0){
			data.put("header1", "잘해요");   
		}
		else if(boardflag==1){
			data.put("header1", "해주세요");
		}
		mav.addAllObjects(data);
		mav.setViewName("search.main.listBoard");
		return mav;		
	}

	@RequestMapping("join.do")
	public String join(){
		return "search.main.join";
	}
	
	@RequestMapping(method=RequestMethod.POST, value="userjoin.do")
	public String join(String userId, String password, String nickname){
		System.out.println(userId);
		HashMap<String, Object> param = new HashMap<>();
		param.put("userId", userId );
		param.put("password", password);
		param.put("nickname", nickname);
		service.join(param);
		return "search.main.listBoard";
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
	public ModelAndView viewboard(int boardNo){
		ModelAndView mv = new ModelAndView();
		mv.addAllObjects(service.readBoard(boardNo));
		mv.setViewName("search.main.viewBoard");
		return mv; 
	}
	
	@RequestMapping("deleteBoardPopup.do")
	public String deleteBoardPopup(Model model, int boardNo){
		model.addAttribute("boardNo", boardNo);
		return "deleteBoardPopup.popup";
	}
	
	@RequestMapping("deleteBoard.do")
	public String deleteBoard(int boardNo){
		return "search.main.listBoard";
	}
	
	@RequestMapping("writeBoard.do")
	public String writeBoard(){
//		return "search.main.writeBoard";
		return "search.main.writeBoard";
	}
	
	@RequestMapping(method = RequestMethod.POST, value = "writeBoardProc.do")
	public String writeBoardProc(@RequestParam HashMap<String, Object> board, HttpSession session){
//		int userIndex = (int)session.getAttribute(Constant.User.USERINDEX);
//		board.put("userIndex", userIndex);
		service.writeBoard(board);
		return "redirect:/listBoard.do";
	}
	
	@RequestMapping("getSido.ajax")
	public 
	@ResponseBody HashMap<String, Object> getSido(){
		HashMap<String, Object> sido = new HashMap<>();
		sido.put("sido", service.getSidoAll());
//		System.out.println(sido);
		return sido;  
	}

	@RequestMapping("getGugun.ajax")
	public
	@ResponseBody HashMap<String, Object> getGugun(String sido){
		HashMap<String, Object> gungu = new HashMap<>();
		gungu.put("gungu", service.getGungu(sido));
//		System.out.println(gungu);
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
		System.out.println(board);
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
