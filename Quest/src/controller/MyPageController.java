package controller;

import java.security.MessageDigest;
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

import commons.Constant;
import commons.Constant.User;
import service.IQuestService;

@Controller
public class MyPageController {
	@Autowired
	IQuestService service;

	 @RequestMapping("applyPopup.do")
	 public ModelAndView applyPopup(@RequestParam HashMap<String, Object> params) {
//		 System.out.println("applyPopup.do");
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
	 

	@RequestMapping(value="applyPopupProc.do", method=RequestMethod.GET)
	public ModelAndView applyPopupProc(@RequestParam HashMap<String, Object>params,HttpSession session) {
		int userIndex = (int)session.getAttribute("userIndex");
//		System.out.println("userIndex" + userIndex);
//		int userIndex = 1;
		System.out.println("applyPopupProc.do params : " + params );
		params.put("userIndex", userIndex);
		service.writeApply(params);
		System.out.println("apply OK!");
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("boardNo", params.get("boardNo"));
		mav.addObject("userIndex", userIndex);
//		model.addAttribute("boardNo", params.get("boardNo"));
		mav.setViewName("redirect:viewBoard.do");
//		System.out.println(mav);
		return mav;
	}
	
//	@RequestMapping(value="delete_applylist.do", method=RequestMethod.POST)
//	public void delete_applylist(int boardNo, int userIndex,HttpSession session){
//		System.out.println("delete_applylist.do 세션:" + session.getAttribute("userIndex") + "userIndex : "+userIndex);
//		HashMap<String, Object> params = (HashMap<String, Object>) service.getApply(boardNo, userIndex);
//		params.put(Constant.Apply.ACOMPLETEFLAG,"4");
//		
//		
//	}


	@RequestMapping("bookmark.do")
	public ModelAndView bookmarkProc(HttpSession session, @RequestParam(defaultValue="1")int page) {
		int userIndex = (int)session.getAttribute("userIndex");
		
		HashMap<String, Object> list = (HashMap<String,Object>) service.bookmarkBoardByUserIndex(userIndex,page);
		
		
		ModelAndView mav = new ModelAndView();
		mav.addAllObjects(list);
		mav.setViewName("mypageMenu.mypage.bookmark");
		return mav;
	}
	@RequestMapping("deleteBook.do")
	public String deleteBook(int boardNo){
		service.removeBookmark(boardNo);
//		System.out.println("deleteBook"+boardNo);
		return "redirect:bookmark.do";
	}


	@RequestMapping("bookmarkPopup.do")
	public String bookmarkPopup(@RequestParam HashMap<String, Object>params) {
//		System.out.println("book"+params);
		int boardNo=Integer.parseInt((String)params.get("boardNo"));
		int userIndex=Integer.parseInt((String)params.get("userIndex"));
		service.bookmark(boardNo, userIndex);
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
		System.out.println("컴플릿 두 : " + list);
//		System.out.println(list.get("completeList"));
//		int cnt = 0;
		for(HashMap<String, Object> tmp : (List<HashMap<String, Object>>) list.get("completeList")) {
//			cnt++;
//			list.put("playUserIndex"+cnt, tmp.get("user2Index"));
			tmp.put("playNick", service.nickname((int) tmp.get("user2Index")));
			System.out.println("playNick" + service.nickname((int) tmp.get("user2Index")));
			
		}
//		List<HashMap<String, Object>> completeList = (List<HashMap<String, Object>>) list.get("completeList");
//		System.out.println();
//		String playnick = service.nickname(Integer.parseInt(completeList.get(25));
		ModelAndView mav = new ModelAndView();
		mav.addAllObjects(list);
		mav.setViewName("mypageMenu.mypage.complete");
		System.out.println("?");
		return mav;
	}

	@RequestMapping("mylist.do")
	public String mylist(@RequestParam(defaultValue="9") int boardFlag,Model model) {
		model.addAttribute("boardFlag", boardFlag);

		return "mypageMenu.mypage.mylist";
	}
	
	@RequestMapping("mylistProc.do")
	public ModelAndView mylistProc
	(HttpSession session, @RequestParam(defaultValue="1")int page,int boardFlag) {
		int userIndex = (int) session.getAttribute("userIndex");
		
		
		ModelAndView mav = new ModelAndView();
//		mav.addObject("myboard",jservice.myboard(userIndex, page));
//		mav.addObject("myapply",jservice.myapply(userIndex, page));
		mav.addObject("boardFlag",boardFlag);
		mav.addAllObjects(service.myapply(userIndex, page, boardFlag));
		mav.addAllObjects(service.myboard(userIndex, page, boardFlag));
		mav.setViewName("mypageMenu.mypage.mylist");
		System.out.println(mav);
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
	public String starpoint(int boardNo, Model model, int user1Index, int user2Index) {
		model.addAttribute("boardNo", boardNo);
		model.addAttribute("user1Index", user1Index);
		model.addAttribute("user2Index", user2Index);
		return "starpoint.popup";
	} 
	
	
	@RequestMapping("starpointProc.do")
	public String starpointProc(HttpSession session, int boardNo, int starpoint, int user1Index, int user2Index) {
		int userIndex = (int)session.getAttribute("userIndex");
		int mode=0; 
		HashMap<String, Object> params = new HashMap<>();
		params.put("boardNo", boardNo);
		params.put("userIndex", userIndex);
		if(service.isMyBoard(params))
			mode = 0;
		else 
			mode = 1;
		int result = service.writeScore(boardNo, starpoint, mode, session, user1Index, user2Index);
		System.out.println(result);
		return "redirect:complete.do";
	}

	@RequestMapping("profileProc.do")
	public String profileProc(HttpSession session, @RequestParam(defaultValue="noPw") String password,int userIndex, String nickname) throws Exception {
		MessageDigest md = MessageDigest.getInstance("MD5");
		md.update(password.getBytes());
		byte[] result = md.digest();
		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < result.length; i++) {
			sb.append(Integer.toHexString(0xFF & result[i]));
		}
		
//		System.out.println("profileProc pass : " + password);
		//user 정보 불러오기
		HashMap<String, Object> origin_User = service.getUser(userIndex);
//		System.out.println("profileProc user : " +origin_User); 
		if ( password != null) {
			
			origin_User.put("password", sb.toString());
		}
		String origin_nick = service.nickname(userIndex);

		if (nickname.equals(origin_nick) ) {
			//기존 닉으로 변경
			origin_User.put("nickname", null);
			
		} else{
			//닉네임 변경시
			origin_User.put("nickname", nickname);
			session.setAttribute(Constant.User.NICKNAME, nickname);
			
		}
		

		service.updateUser(origin_User);

		return "redirect:profile.do";

	}
	

	@RequestMapping("applyUpdatePopup.do")
	 public ModelAndView applyUpdatePopup(@RequestParam HashMap<String, Object> params) {
		 System.out.println("applyUpdatePopup.do" + params);
		 HashMap<String, Object> tmp = service.getBoard(Integer.parseInt((String)(params.get("boardNo"))));
//		 System.out.println("tmp"+service.getContact(Integer.parseInt((String)params.get("contactNo"))));
		 tmp.put("contact", service.getContact(Integer.parseInt((String)params.get("contactNo"))));
		 int boardNo = Integer.parseInt((String)(params.get("boardNo")));
		 int userIndex = Integer.parseInt((String)(params.get("userIndex")));
		 HashMap<String, Object> apply = service.selectApply(boardNo, userIndex);
		 System.out.println("업데이트 apply : "+ apply);
		 ModelAndView mav = new ModelAndView();
		 mav.addObject("board", tmp);
		 mav.addObject("apply", apply);
		 mav.setViewName("applyUpdatePopup.popup");
		 System.out.println("update popup ok!");
	
		 return mav; 
	 }
	 
	 @RequestMapping(value="applyUpdatePopupProc.do", method=RequestMethod.POST)
		public ModelAndView applyUpdatePopupProc(@RequestParam HashMap<String, Object>params,HttpSession session) {
			int userIndex = (int)session.getAttribute("userIndex");
//			System.out.println("userIndex" + userIndex);
//			int userIndex = 1;
			System.out.println("? applyPopupProc.do params : " + params );
			params.put("userIndex", userIndex);
			HashMap<String, Object> apply = service.selectApply(Integer.parseInt((String)(params.get("boardNo"))), userIndex);
			System.out.println("?섏젙 Proc ?");
			apply.put("rewardNo", params.get("rewardNo"));
			apply.put("contactAnswer", params.get("contactAnswer"));
			apply.put("content", params.get("content"));
			
			service.updateApply(apply);
			
			System.out.println("Proc OK!");
			
			ModelAndView mav = new ModelAndView();
			mav.addObject("boardNo", params.get("boardNo"));
			mav.addObject("userIndex", userIndex);
//			model.addAttribute("boardNo", params.get("boardNo"));
			mav.setViewName("redirect:viewBoard.do");
//			System.out.println(mav);
			return mav;
		}
	 
	 
	 @RequestMapping("deleteApplyPopup.do")
	 public String deleteApplyPopup(@RequestParam HashMap<String, Object> params, Model model) {
		 System.out.println("deleteApplyPopup.do" + params);
//		 System.out.println("boardNo: " + params.get("boardNo"));
//		 System.out.println("getboard"+ Integer.parseInt((String)(params.get("boardNo"))));
//		 HashMap<String, Object> tmp = service.getBoard(Integer.parseInt((String)(params.get("boardNo"))));
//		 System.out.println("tmp"+service.getContact(Integer.parseInt((String)params.get("contactNo"))));
//		 tmp.put("contact", service.getContact(Integer.parseInt((String)params.get("contactNo"))));
//		 ModelAndView mav = new ModelAndView();
//		 mav.addAllObjects(tmp);
//		 mav.setViewName("applyPopup.popup");
		 model.addAttribute("boardNo",(params.get("boardNo")));
		 model.addAttribute("userIndex",(params.get("userIndex")));
		 System.out.println(model);
		 return "deleteApplyPopup.popup"; 
	 }
	 
		@RequestMapping("deleteApply.do")
		public ModelAndView deleteApply(int boardNo, int userIndex) {
			System.out.println("deleteProc" + boardNo + "&" + userIndex);
			service.deleteApply(boardNo, userIndex);
			
			ModelAndView mav = new ModelAndView();
			mav.addObject("boardNo", boardNo);
			mav.addObject("userIndex", userIndex);
			mav.setViewName("redirect:viewBoard.do");
			return mav;
		} 


	
}