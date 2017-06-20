package controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
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
		System.out.println("dfdfdfdfdfdf");
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

}
