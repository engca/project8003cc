package dao;
import java.util.HashMap;

import java.util.List;

import javax.xml.stream.events.Comment;

public interface IQuestDao {
	public String selectContact(int contactNo);

	//게시판 관련
	public int insertBoard(HashMap<String, Object> params);
	public int updateBoard(HashMap<String, Object> params);
	public int deleteBoard(int boradNo);
	public List<HashMap<String, Object>> selectBoardAll();
	public List<HashMap<String, Object>> selectBoard(HashMap<String, Object> params);
	public HashMap<String, Object> selectBoardOne(int boardNo);
	public int getBoardCount();
	public List<HashMap<String, Object>> selectBoardLimit(HashMap<String, Object> params);
	public HashMap<String, Object> isMyBoard(HashMap<String, Object> params);
	
	// 회원관리 부분
	public int insertUser(HashMap<String, Object> params);
	public int updateUser(HashMap<String, Object> params);
	public int deleteUser(int userIndex);
	public HashMap<String, Object> selectUser(HashMap<String, Object> params);
	
	// 코멘트 관리부분
	public int insertComment(HashMap<String, Object> params);
	public int updateComment(HashMap<String, Object> params);
	public int deleteComment(HashMap<String, Object> params);
//	public Comment selectCommentByBoardNo(int boardNo);
	public List<HashMap<String, Object>> selectAllCommentByBoardNo(int boardNo);
	
	// 신청하기
	public int insertApply(HashMap<String, Object> params);
	public int updateApply(HashMap<String, Object> params);
	public int deleteApply(int boardNo);
	public HashMap<String, Object> selectApply(HashMap<String, Object> params);
	public List<HashMap<String, Object>> selectAllApplyByBoardNo(int boardNo);
	public List<HashMap<String, Object>> selectAllApplyByUserIndex(int userIndex);

	// 평가하기
	public int insertScore(HashMap<String, Object> params);
	public int updateScore(HashMap<String, Object> params);
	public List<HashMap<String, Object>> selectScoreByUserindex(HashMap<String, Object> params);
//	public Score selectScoreByUser1Id(int user1_index);
//	public Score selectScoreByUser2Id(int user2_index);
	public HashMap<String, Object> selectScoreByBoardNo(int boardNo);

	// 즐겨찾기
	public int insertBookMark(HashMap<String, Object> params);
	public int deleteBookMark(HashMap<String, Object> params);
	public List<HashMap<String, Object>> selectBookMark(HashMap<String, Object> params);
	public List<HashMap<String, Object>> selectBookMarkByUserIndex (int userIndex);

	// 신고하기
	public int insertPolice(HashMap<String, Object> params);
	public HashMap<String, Object> selectPolice(HashMap<String, Object> params);

	// 주소관련
	public HashMap<String, Object> selectAddress(int addrNo);
	public List<HashMap<String, Object>> selectSidoAll();
	public List<HashMap<String, Object>> selectGugun(String sido);
	

}
