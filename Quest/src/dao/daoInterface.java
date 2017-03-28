package dao;
import java.util.HashMap;

import java.util.List;

import javax.xml.stream.events.Comment;

public interface daoInterface {
	public int insertBoard(HashMap<String, Object> params);
	public int updateBoard(HashMap<String, Object> params);
	public int deleteBoard(int boradNo);
	public List<HashMap<String, Object>> selectBoardAll();
	public HashMap<String, Object> selectBoardOne(int boardNo);
	
	public int insertUser(HashMap<String, Object> params);
	public int updateUser(HashMap<String, Object> params);
	public int deleteUser(int user_index);
	public HashMap<String, Object> selectUser(int user_index);
	

	public int insertComment(HashMap<String, Object> params);
	public int updateComment(HashMap<String, Object> params);
	public int deleteComment(HashMap<String, Object> params);
//	public Comment selectCommentByBoardNo(int boardNo);
	public List<HashMap<String, Object>> selectAllCommentByBoardNo(int boardNo);
	
	public int insertApply(HashMap<String, Object> params);
	public int updateApply(HashMap<String, Object> params);
	public List<HashMap<String, Object>> selectAllApplyByBoardNo(int boardNo);
	public List<HashMap<String, Object>> selectAllApplyByUserIndex(int User_Index);


	public int insertScore(HashMap<String, Object> params);
	public int updateScore(HashMap<String, Object> params);
//	public Score selectScoreByUser1Id(int user1_index);
//	public Score selectScoreByUser2Id(int user2_index);
	public HashMap<String, Object> selectScoreByBoardNo(int boardNo);

	public int insertBookMark(HashMap<String, Object> params);
	public int deleteBookMark(HashMap<String, Object> params);
	public List<HashMap<String, Object>> selectBookMark(HashMap<String, Object> params); 

	public int insertPolice(HashMap<String, Object> params);
	public int selectPolice(HashMap<String, Object> params);

	public String selectaddr1(int addr1No);
	public String selectaddr2(int addr2No);

}
