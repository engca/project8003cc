package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import service.IQuestService;


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
		mav.setViewName("/main/ListBoard.jsp");
		return mav;		
	}

	@RequestMapping("join.do")
	public String join(){
		return "/main/join.jsp";
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
	
	@RequestMapping(method=RequestMethod.GET, value="readBoard.do")
	public ModelAndView viewboard(int num){
		ModelAndView mv = new ModelAndView();
		mv.addAllObjects(service.readBoard(num));
		mv.setViewName("readBoard");
		return mv;
	}
	
	@RequestMapping("writeBoard.do")
	public String writeBoard(){
		return "/main/writeBoard.jsp";
	}
	
	@RequestMapping("writeBoardProc.do")
	public ModelAndView writeBoardProc(){
		ModelAndView mav = new ModelAndView();
		return mav;
	}
	
	
}
