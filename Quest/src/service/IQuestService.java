package service;
import java.util.HashMap;

import java.util.List;

import javax.xml.stream.events.Comment;


public interface IQuestService {
	public String getContact(int conatactNo);
	
	public int join(HashMap<String, Object> params);
	public HashMap<String, Object> login(String id, String password);
	public int logout(HashMap<String, Object> params);
	public int unjoin(HashMap<String, Object> params);

	public int updateUser(HashMap<String, Object> params);
	public HashMap<String, Object> getUser(int userIndex);

	public int idCheck(String id); 
	public int nicknameCheck(String nickname); 

	// 보드 서비스
	public List<HashMap<String, Object>> listBoard(List<Integer> addrNo, int mode, String searchMsg, int userIndex);
	public int writeBoard(HashMap<String, Object> params);
	public int updateBoard(HashMap<String, Object> params);
	public int deleteBoard(HashMap<String, Object> params); 
	public HashMap<String, Object> getBoardList(int page); // 페이징 처리용 추가 (4/12)
	public HashMap<String, Object> readBoard(int boardNo);
	public HashMap<String, Object> getBoard(int boardNo);
	public boolean isMyBoard(HashMap<String, Object> params);

	public List<HashMap<String, Object>> listComment(int BoardNo);
	public int writeComment(HashMap<String, Object> params);
	public int updateComment(HashMap<String, Object> params);
	public int deleteComment(HashMap<String, Object> params); 

	public List<HashMap<String, Object>> listApply(int BoardNo);
	public int writeApply(HashMap<String, Object> params);
	public int updateApply(HashMap<String, Object> params);
	public int deleteApply(HashMap<String, Object> params); 
	public int choiceApply(int user1Index, int user2Index, int boardNo);

	public List<HashMap<String, Object>> listScore(int userIndex,int mode);
	public int writeScore(int boardNo, float starPoint, int mode);

	public int bookmark(int BoardNo, int userIndex); 

	public int police(int BoardNo, int userIndex); 
	public HashMap<String, Object> selectpolice(int BoardNo, int userIndex);  
	
	public List<HashMap<String, Object>> selectAll();
	
	public List<HashMap<String, Object>> getSidoAll();
	public List<HashMap<String, Object>> getGugun(String sido);

}
