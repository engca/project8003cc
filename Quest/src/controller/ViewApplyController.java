package controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import service.IQuestService;

@Controller
public class ViewApplyController {
	@Autowired
	IQuestService service;
	
	@RequestMapping("viewApplyPopup.do")
	public String viewApplyPopup(@RequestParam HashMap<String, Object>params){
		
		System.out.println(params);
		return "viewApplyPopup.popup";
	}
	@RequestMapping("viewApply.do")
	public void viewApply(@RequestParam HashMap<String, Object>params){
		
	}
	
	

}
