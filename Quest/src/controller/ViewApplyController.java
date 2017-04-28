package controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import commons.Constant;
import service.IQuestService;

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
		// System.out.println(applydata);
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
	public ModelAndView viewApply(String msg) {
		System.out.println("viewApply"+msg);
		String[] userIndex=msg.split("&");
		
		//inseScore
		//bcompleteFlag = 3으로 변경
	
		
		ModelAndView mav = new ModelAndView();

		return mav;

	}

}
