package controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import commons.Constant;
import service.IQuestService;
import service.J_Service;

@Controller
public class ViewApplyController {
	@Autowired
	IQuestService service;
	

	@RequestMapping("viewApplyPopup.do")
	public ModelAndView viewApplyPopup(@RequestParam HashMap<String, Object> params, Model model) {
		// System.out.println("viewApply" + params);

		// data from applyTable by boardNo
		List<HashMap<String, Object>> applydata = service.listApply(Integer.parseInt((String) params.get("boardNo")));
		// System.out.println("?");
		 System.out.println("뷰어플라이:"+ applydata);
		// System.out.println("nick"+
		// service.nickname(Integer.parseInt((String)params.get("userIndex"))));

		for (HashMap<String, Object> tmp : applydata) {
			int userIndex = (int) tmp.get("userIndex");
			String nickname = service.nickname(userIndex);
			tmp.put("nickname", nickname);

		}

		ModelAndView mav = new ModelAndView();
		String contact = service.getContact(Integer.parseInt((String) params.get("contactNo")));
		// System.out.println("contact: " + contact);
		mav.addObject("contact", contact);
		mav.addObject("boardList", params);
		mav.addObject("applyList", applydata);
		
		mav.setViewName("viewApplyPopup.popup");
		return mav;
	}

	@RequestMapping("viewApply.do")
	public String viewApply(String[] chk, int boardNo, HttpSession session, Model model) {
		System.out.println("?");
		System.out.println("viewApply"+ chk);
//		String[] userIndex=chk.split("&");
		
//		int boardNum = Integer.parseInt(boardNo);
		System.out.println("viewApply boardno:" + boardNo);
		
		int userIndex1 = (int) session.getAttribute("userIndex");
		
		
		for (int i = 0 ; i< chk.length ; i++){
			int userIndex2 = Integer.parseInt(chk[i]);
			service.choiceApply(userIndex1, userIndex2, boardNo);
		}
			
		model.addAttribute("boardNo", boardNo);
		return "redirect:viewBoard.do";

	}
	
	@RequestMapping("deleteApplyUser.do")
	public String deleteApplyUser(int user2Index, int boardNo, HttpSession session, Model model ){
		int userIndex1 = (int) session.getAttribute("userIndex");
		service.deleteApplyUser(userIndex1, user2Index, boardNo);
		HashMap<String, Object> boardAll = service.getBoard(boardNo);
		model.addAllAttributes(boardAll);
		
		return "redirect:viewApplyPopup.do";
	}

}
