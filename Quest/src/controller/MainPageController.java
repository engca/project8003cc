package controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import service.IQuestService;


@Controller
public class MainPageController {
	@Autowired
	IQuestService service;
	 
	@RequestMapping("todo.do")
	public ModelAndView todoBoardAllList(int boardflag){
		
		List<HashMap<String, Object>> list = service.listBoard(null, boardflag, null, 0);
		ModelAndView mv = new ModelAndView();
		if(boardflag==0){
			mv.addObject("title","잘해요");
		}
		else if(boardflag==1){
			mv.addObject("title","해주세요");
		}
		mv.addObject("list", list);
		mv.setViewName("ListBoard");
		return mv;		
	}
			
	
	
	
	
}
