import java.util.HashMap;


import org.springframework.context.ApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

import commons.Constant;
import service.IQuestService;
import service.QuestService;

public class Test {
	public static void main(String[] args) {
		ApplicationContext context = new GenericXmlApplicationContext("applicationContext.xml");
		IQuestService service = context.getBean("questService", IQuestService.class);
		
		for(int i = 0; i<10 ; i++)
		{
			HashMap<String, Object> params = new HashMap<>();
			params.put(Constant.User.USERID, "ID"+i);
			params.put(Constant.User.PASSWORD, "1111");
			params.put(Constant.User.NICKNAME, "nick"+i);
			params.put(Constant.User.STARPOINT, 0);
			params.put(Constant.User.DOCOUNT, 0);
			service.join(params);
			
		}
		
	}

}
