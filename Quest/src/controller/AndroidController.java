package controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

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
		HashMap<String, Object> data = new HashMap<>();
		HashMap<String, Object> boardList = service.getBoard(boardNo);
		System.out.println("getBoard"+boardList);
		System.out.println((int)boardList.get("addrNo"));
		HashMap<String, Object> addrList = service.getAddress((int)boardList.get("addrNo"));
		System.out.println("addrList"+addrList);
		data.put("boardList", boardList);
		data.put("addrList", addrList); 
		
		
		Gson gson = new Gson();
		String json = gson.toJson(data);
		System.out.println("m_getBoard json"+json);
		return json;
		
	}

}
