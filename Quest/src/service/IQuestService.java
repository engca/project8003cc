package service;
import java.util.HashMap;

import java.util.List;

import javax.xml.stream.events.Comment;


public interface IQuestService {
	//contact
	public String getContact(int conatactNo);
	
	//join
	public int join(HashMap<String, Object> params);
	public HashMap<String, Object> login(String id, String password);
	public int logout(HashMap<String, Object> params);
	public int unjoin(HashMap<String, Object> params);

	public int updateUser(HashMap<String, Object> params);
	public HashMap<String, Object> getUser(int userIndex);

	public int idCheck(String id); 
	public int nicknameCheck(String nickname); 
	
	public String nickname(int userIndex);

	// 보드 서비스   
//	public List<HashMap<String, Object>> listBoard(List<Integer> addrNo, int mode, String searchMsg, int userIndex);
	public int writeBoard(HashMap<String, Object> params);
	public int updateBoard(HashMap<String, Object> params);
	public int deleteBoard(int boardNo); 
	public HashMap<String, Object> getBoardList(int boardflag, int page); // 페이징 처리용 추가 (4/12)
	public HashMap<String, Object> readBoard(int boardNo);
	public HashMap<String, Object> getBoard(int boardNo);
	public boolean isMyBoard(HashMap<String, Object> params);
	public HashMap<String, Object> searchBoardList(int boardflag, int page, String searchKey);
	//댓글
	public List<HashMap<String, Object>> listComment(int BoardNo);
	public int writeComment(HashMap<String, Object> params);
	public int updateComment(HashMap<String, Object> params);
	public int deleteComment(HashMap<String, Object> params); 
	
	//신청하기
	public List<HashMap<String, Object>> listApply(int BoardNo);
	public int writeApply(HashMap<String, Object> params);
	public int updateApply(HashMap<String, Object> params);
	public int deleteApply(HashMap<String, Object> params); 
	public int choiceApply(int user1Index, int user2Index, int boardNo);

	//평가하기
	public List<HashMap<String, Object>> listScore(int userIndex,int mode);
	public int writeScore(int boardNo, float starPoint, int mode);

	//즐겨찾기
	public int bookmark(int BoardNo, int userIndex); 
	public List<HashMap<String, Object>> listBookmark(HashMap<String, Object> params);
	public HashMap<String, Object> bookmarkBoardByUserIndex(int userIndex, int page);

	
	//신고하기
	public int police(int BoardNo, int userIndex); 
	public int selectpolice(int BoardNo, int userIndex);
	
	public List<HashMap<String, Object>> selectAll();
	
	public List<HashMap<String, Object>> getSidoAll();
	public List<HashMap<String, Object>> getGungu(String sido);
	public HashMap<String, Object> getAddress(int addrNo);
	
	// 마이리스트내가쓴글
	public HashMap<String, Object> myapply(int userIndex , int page, int boardFlag);
	public HashMap<String, Object> myboard(int userIndex , int page, int boardFlag);
	
	
	public int getUserIndexById(String id);
	public HashMap<String, Object> mycomplete(int userIndex, int page);

}
