package controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import commons.Constant.User;
import service.IQuestService;

@Controller
public class MyPageController {
	@Autowired
	IQuestService service;

	 @RequestMapping("applyPopup.do")
	 public ModelAndView applyPopup(@RequestParam HashMap<String, Object> params) {
//		 System.out.println("applyPopup.do");
//		 System.out.println("params" + params);
//		 System.out.println("boardNo: " + params.get("boardNo"));
//		 System.out.println("getboard"+ Integer.parseInt((String)(params.get("boardNo"))));
		 HashMap<String, Object> tmp = service.getBoard(Integer.parseInt((String)(params.get("boardNo"))));
//		 System.out.println("tmp"+service.getContact(Integer.parseInt((String)params.get("contactNo"))));
		 
		 tmp.put("contact", service.getContact(Integer.parseInt((String)params.get("contactNo"))));
		 ModelAndView mav = new ModelAndView();
		 mav.addAllObjects(tmp);
		 mav.setViewName("applyPopup.popup");
	
		 return mav;
	 }
	 

	@RequestMapping("applyPopupProc.do")
	public String applyPopupProc(Model model, @RequestParam HashMap<String, Object>params,HttpSession session) {
		int userIndex = (int)session.getAttribute("userIndex");
//		System.out.println("userIndex" + userIndex);
//		int userIndex = 1;
		params.put("userIndex", userIndex);
		service.writeApply(params);
//		System.out.println("applyPopupProc.do params : " + params );
//		System.out.println("apply OK!");
	
		model.addAttribute("boardNo", params.get("boardNo"));
		return "redirect:viewBoard.do";
	}


	@RequestMapping("bookmark.do")
	public ModelAndView bookmarkProc(HttpSession session, @RequestParam(defaultValue="1")int page, int boardNo) {
		int userIndex = (int)session.getAttribute("userIndex");
		service.bookmark(boardNo, userIndex);
		HashMap<String, Object> list = (HashMap<String,Object>) service.bookmarkBoardByUserIndex(userIndex,page);
		
		
		
				
		ModelAndView mav = new ModelAndView();
		mav.addAllObjects(list);
		mav.setViewName("mypageMenu.mypage.bookmark");
		return mav;
	}


	@RequestMapping("bookmarkPopup.do")
	public String bookmarkPopup() {
		return "bookmarkPopup.popup";
	}
	
	@RequestMapping("bookmarkCheck.do")
	@ResponseBody
	public int bookmarkCheck(@RequestParam HashMap<String,Object> params) {
		int result = service.BookmarkCheck(params);
		return result;
	}

	
	
	@RequestMapping("complete.do")
	public ModelAndView complete(HttpSession session, @RequestParam(defaultValue="1")int page) {
		int userIndex = (int)session.getAttribute("userIndex");
		
		HashMap<String, Object> list = (HashMap<String,Object>) service.mycomplete(userIndex,page);
		
		ModelAndView mav = new ModelAndView();
		mav.addAllObjects(list);
		mav.setViewName("mypageMenu.mypage.complete");
		return mav;
	}

	@RequestMapping("mylist.do")
	public String mylist(@RequestParam(defaultValue="9") int boardFlag,Model model) {
		model.addAttribute("boardFlag", boardFlag);
		
		return "mypageMenu.mypage.mylist";
	}
	
	@RequestMapping("mylistProc.do")
	public ModelAndView mylistProc
	(HttpSession session, @RequestParam(defaultValue="1")int page,@RequestParam(defaultValue="9")int boardFlag) {
		int userIndex = (int) session.getAttribute("userIndex");
		
		
		ModelAndView mav = new ModelAndView();
//		mav.addObject("myboard",jservice.myboard(userIndex, page));
//		mav.addObject("myapply",jservice.myapply(userIndex, page));
		mav.addObject("boardFlag",boardFlag);
		mav.addAllObjects(service.myapply(userIndex, page, boardFlag));
		mav.addAllObjects(service.myboard(userIndex, page,boardFlag));
		mav.setViewName("mypageMenu.mypage.mylist");
		return mav;
		
	}

	@RequestMapping("profile.do")
	public ModelAndView profile(HttpSession session) {
		int index = (int) session.getAttribute("userIndex");
		HashMap<String, Object> user = service.getUser(index);
		ModelAndView mav = new ModelAndView();
		mav.addAllObjects(user);
		mav.setViewName("mypageMenu.mypage.profile");
		return mav;
	}

	
	@RequestMapping("starpoint.do")
	public String starpoint(int boardNo, Model model) {
		model.addAttribute("boardNo", boardNo);
		return "starpoint.popup";
	} 
	
	
	@RequestMapping("starpointProc.do")
	public String starpointProc(HttpSession session, int boardNo, int starpoint) {
		int userIndex = (int)session.getAttribute("userIndex");
		boardNo=1;
		int mode=0;
		HashMap<String, Object> params = new HashMap<>();
		params.put("boardNo", boardNo);
		params.put("userIndex", userIndex);
		if(service.isMyBoard(params))
			mode = 0;
		else 
			mode = 1;
		service.writeScore(boardNo, starpoint, mode);
		return "redirect:complete.do";
	}

	@RequestMapping("profileProc.do")
	public String profileProc(HashMap<String, Object> params) {
		HashMap<String, Object> origin_User = service.getUser((int) params.get("userIndex"));

		if (params.get("pass") != null) {
			origin_User.put("pass", params.get("pass"));
		}

		if (params.get("nickname") != null) {
			origin_User.put("nickname", params.get("nickname"));
		}

		service.updateUser(origin_User);

		return "redirect:profile.do";

	}
}