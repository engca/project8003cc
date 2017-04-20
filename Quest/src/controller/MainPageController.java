package controller;

import java.io.IOException;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import commons.Constant;
import service.IQuestService;
import service.QuestService;


@Controller
public class MainPageController {
	@Autowired
	IQuestService service; 
	 
	@RequestMapping("list.do")
	public ModelAndView todoBoardAllList(int boardflag){
		
		List<HashMap<String, Object>> list = service.listBoard(null, boardflag, null, 0);
		ModelAndView mav = new ModelAndView();
		if(boardflag==0){
			mav.addObject("title","잘해요");
		}
		else if(boardflag==1){
			mav.addObject("title","해주세요");
		}
		mav.addObject("list", list);
		mav.setViewName("/bootstrapResources/main/ListBoard.jsp");
		return mav;		
	}

	@RequestMapping("join.do")
	public String join(){
		return "/bootstrapResources/main/join.jsp";
	}	
	
	@RequestMapping("idCheck.do")
	public void idCheck(String userid, HttpServletRequest req, HttpServletResponse resp) throws IOException 	{ 
		// TODO Auto-generated method stub
		int result = service.idCheck(userid);	
		
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
	
//	@RequestMapping(method=RequestMethod.GET, value="viewBoard.do")
//	public ModelAndView viewboard(int boardNo){
//		ModelAndView mv = new ModelAndView();
//		mv.addAllObjects(service.readBoard(boardNo));
//		mv.setViewName("viewBoard");
//		return mv;
//	}
	
	@RequestMapping("viewBoard.do")
	public String viewBoard(){
		return "/bootstrapResources/main/viewBoard.jsp";
	}
	
	@RequestMapping("writeBoard.do")
	public String writeBoard(){
		return "/bootstrapResources/main/writeBoard.jsp";
	}
	
	@RequestMapping(method = RequestMethod.POST, value = "writeBoardProc.do")
	public String writeBoardProc(@ModelAttribute HashMap<String, Object> board, 
			HttpSession session){
		int userIndex = (int)session.getAttribute(Constant.User.USERINDEX);
		board.put("userIndex", userIndex);
		
		
		service.writeBoard(board);
		return "redirect:/list.do";
	}
	
	@RequestMapping("getSido.do")
	public 
	@ResponseBody HashMap<String, Object> getSido(){
		HashMap<String, Object> sido = new HashMap<>();
		sido.put("sido", service.getSidoAll());
		System.out.println(sido);
		return sido;  
	}

	@RequestMapping("getGugun.do")
	public
	@ResponseBody HashMap<String, Object> getGugun(String sido){
		HashMap<String, Object> gungu = new HashMap<>();
		gungu.put("gugun", service.getGungu(sido));
		System.out.println(gungu);
		return gungu;
	}
	
	
//	@RequestMapping(method = RequestMethod.POST, value ="updateBoard.do")  
//	public ModelAndView updateBoard(int boardNo){
//		ModelAndView mav = new ModelAndView();
//		mav.addObject("board", service.getBoard(boardNo));
//		mav.setViewName("/bootstrapResources/main/updateBoard.jsp");
//		return mav;
//	}
	
	@RequestMapping("updateBoard.do")
	public String updateBoard() {
		return "/bootstrapResources/main/updateBoard.jsp";
	}
	
	@RequestMapping("updateBoardProc.do")
	public String updateBoardProc(@ModelAttribute HashMap<String, Object> board){
		service.updateBoard(board);
		return "redirect:/viewBoard.do";
	}
	
	@RequestMapping("ListBoard.do")
	public String ListBoard() {
		return "/bootstrapResources/main/ListBoard.jsp";
	}
	

	@RequestMapping("police.do")
	public int police(int BoardNo, int userIndex){
		return service.selectpolice(BoardNo, userIndex);
	}

	
}
