package service;
import java.util.HashMap;

import java.util.List;

import javax.xml.stream.events.Comment;


public interface serviceInterface {

	public int join(HashMap<String, Object> params);

	public HashMap<String, Object> login(String id, String password);

	public int logout(HashMap<String, Object> params);

	public int unjoin(HashMap<String, Object> params);

	public HashMap<String, Object> updateUser(HashMap<String, Object> params);

	public int idCheck(String id);

	public int nicknameCheck(String nickname);

	public List<HashMap<String, Object>> listBoard(HashMap<String, Object> params, int mode, String searchMsg);

	public int writeBoard(HashMap<String, Object> params);

	public int updateBoard(HashMap<String, Object> params);

	public int deleteBoard(HashMap<String, Object> params);

	public List<HashMap<String, Object>> listComment(int BoardNo);

	public int writeComment(HashMap<String, Object> params);

	public int updateComment(HashMap<String, Object> params);

	public int deleteComment(HashMap<String, Object> params);

	public List<HashMap<String, Object>> listApply(int BoardNo);

	public int writeApply(HashMap<String, Object> params);

	public int updateApply(HashMap<String, Object> params);

	public int deleteApply(HashMap<String, Object> params);

	public int choiceApply(int user_index);

	public List<HashMap<String, Object>> listBoard(int user1_index);

	public int writeScore(float starPoint);

	public int bookmark(int BoardNo, int user_index);

	public int police(int BoardNo, int user_index);

}
