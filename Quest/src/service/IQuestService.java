package service;
import java.util.HashMap;

import java.util.List;

import javax.xml.stream.events.Comment;


public interface IQuestService {

	public int join(HashMap<String, Object> params);//성민 도현
	public HashMap<String, Object> login(String id, String password);
	public int logout(HashMap<String, Object> params);
	public int unjoin(HashMap<String, Object> params);

	public int updateUser(HashMap<String, Object> params);

	public int idCheck(String id); // 성민 도현
	public int nicknameCheck(String nickname); //성민 도현

	public List<HashMap<String, Object>> listBoard(List<Integer> addrNo, int mode, String searchMsg, int userIndex);
	public int writeBoard(HashMap<String, Object> params);
	public int updateBoard(HashMap<String, Object> params);
	public int deleteBoard(HashMap<String, Object> params); //성민 도현

	public List<HashMap<String, Object>> listComment(int BoardNo);
	public int writeComment(HashMap<String, Object> params);
	public int updateComment(HashMap<String, Object> params);
	public int deleteComment(HashMap<String, Object> params); //성민 도현

	public List<HashMap<String, Object>> listApply(int BoardNo);
	public int writeApply(HashMap<String, Object> params);
	public int updateApply(HashMap<String, Object> params);
	public int deleteApply(HashMap<String, Object> params); //성민 도현
	public int choiceApply(int user1Index, int user2Index, int boardNo);

	public List<HashMap<String, Object>> listScore(int userIndex,int mode);
	public int writeScore(int boardNo, float starPoint, int mode);

	public int bookmark(int BoardNo, int userIndex); //성민 도현

	public int police(int BoardNo, int userIndex); //성민 도현 

}
