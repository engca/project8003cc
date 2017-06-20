package controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import commons.Constant;
import service.IQuestService;

@Controller
public class AndroidController {
	@Autowired
	IQuestService service;
	
	@RequestMapping("m_android.do")
	public @ResponseBody String android() {
		HashMap<String, Object> data = new HashMap<>();
		System.out.println("m_android");
		HashMap<String, Object> data0 = service.getBoardList(0, 1);
		HashMap<String, Object> data1 = service.getBoardList(1, 1);
//		data.put("welldolist", data0); //잘해요
//		data.put("todolist", data1); //해주세요
		data.put("list0", data0); //잘해요
		data.put("list1", data1); //해주세요
//		System.out.println(data0.get("boardList"));
//		return data;
		Gson gson = new Gson();
		String json = gson.toJson(data);
		System.out.println("json"+json);
		return json;
		
	}
	
	@RequestMapping("m_getBoard.do")
	public @ResponseBody String getBoard(int boardNo) {
		System.out.println("m_getBoard in!");
		System.out.println(boardNo);
		
//		HashMap<String, Object> boardList = service.getBoard(Integer.parseInt(boardNo));
		HashMap<String, Object> boardList = service.getBoard(boardNo);
		System.out.println("getBoard"+boardList);
		
//		return data;
		Gson gson = new Gson();
		String json_boarList = gson.toJson(boardList);
		System.out.println("boardList"+json_boarList);
		return json_boarList;
//		return null;
		
	}
	@RequestMapping("m_session.do")
	public @ResponseBody String session(HttpSession session) {
		System.out.println("m_session in!");
		
		HashMap<String, Object> sessionMap = new HashMap<>();
		sessionMap.put(Constant.User.USERID, session.getAttribute(Constant.User.USERID));
		Gson gson = new Gson();
		String json_sessionMap = gson.toJson(sessionMap);
		System.out.println("sessionMap"+sessionMap);
		return json_sessionMap;
	}
}
