package dao;
import java.util.HashMap;

import java.util.List;

import javax.xml.stream.events.Comment;

public interface IQuestDao {
	public String selectContact(int contactNo);
	public int selectTodo(int userIndex);
	public int selectDowell(int userIndex);
	public int selectDowellApply(int userIndex);
	public int selectTodoApply(int userIndex);
	//게시판 관련
	public int insertBoard(HashMap<String, Object> params);
	public int updateBoard(HashMap<String, Object> params);
	public int deleteBoard(int boradNo);
	public List<HashMap<String, Object>> selectBoardAll();
	public List<HashMap<String, Object>> selectBoardByContent(HashMap<String, Object> params);
	public List<HashMap<String, Object>> selectBoardByWriter(HashMap<String, Object> params);
	public HashMap<String, Object> selectBoardOne(int boardNo);
	public int getBoardCount(int boardFlag);
	public int getBoardCountByContent(HashMap<String, Object> params);
	public int getBoardCountByWriter(HashMap<String, Object> params);
	public List<HashMap<String, Object>> selectBoardLimit(HashMap<String, Object> params);
	public HashMap<String, Object> isMyBoard(HashMap<String, Object> params);
	
	// 회원관리 부분
	public int insertUser(HashMap<String, Object> params);
	public int updateUser(HashMap<String, Object> params);
	public int deleteUser(int userIndex);
	public HashMap<String, Object> selectUser(HashMap<String, Object> params);
	public String selectNicknname(int userIndex);
	public int selectLogincategory (String id);
	public int selectDoCountByUserIndex(int userIndex);
	public float selectStarPointByUserIndex(int userIndex);
	public int selectFindPwQ(String id);
	public String selectFindPwA(String id);
	public int updatePw(HashMap<String, Object> params);

	
	// 코멘트 관리부분
	public int insertComment(HashMap<String, Object> params);
	public int updateComment(HashMap<String, Object> params);
	public int deleteComment(HashMap<String, Object> params);
//	public Comment selectCommentByBoardNo(int boardNo);
	public List<HashMap<String, Object>> selectAllCommentByBoardNo(int boardNo);
	public int selectCommentCount(int boardNo);

	public List<HashMap<String, Object>> selectCommentList(int boardNo);
	public HashMap<String, Object> selectComment(HashMap<String, Object> params);
	public void updateSequence(HashMap<String, Object> params);
	public void updateGroup(int boardNo);
	
	// 신청하기 
	public int insertApply(HashMap<String, Object> params);
	public int updateApply(HashMap<String, Object> params);
	public int deleteApply(HashMap<String, Object> params);
	public HashMap<String, Object> selectApply(HashMap<String, Object> params);
	public List<HashMap<String, Object>> selectAllApplyByBoardNo(int boardNo);
	public List<HashMap<String, Object>> selectAllApplyByUserIndex(int userIndex);
	public int applyCount(int boardNo);

	// 평가하기
	public int insertScore(HashMap<String, Object> params);
	public int updateScore(HashMap<String, Object> params);
	public List<HashMap<String, Object>> selectScoreByUserindex(HashMap<String, Object> params);
//	public Score selectScoreByUser1Id(int user1_index);
//	public Score selectScoreByUser2Id(int user2_index);
	public HashMap<String, Object> selectScoreByBoardNo(HashMap<String, Object> params);
	public int selectUserIndexById(String id);
	public int deleteScore(HashMap<String, Object> params);
	public int countByBoardNo(int boardNo);
	
	// 즐겨찾기
	public int insertBookMark(HashMap<String, Object> params);
	public int deleteBookMark(HashMap<String, Object> params);
	public List<HashMap<String, Object>> selectBookMark(HashMap<String, Object> params);
	public List<HashMap<String, Object>> selectBookMarkByUserIndex (HashMap<String, Object> params);
	public int getBookmarkByUserIndexCount(int userIndex);

	// 신고하기
	public int insertPolice(HashMap<String, Object> params);
	public HashMap<String, Object> selectPolice(HashMap<String, Object> params);
	public int countPolice(int boardNo);

	// 주소관련
	public HashMap<String, Object> selectAddress(int addrNo);
	public List<HashMap<String, Object>> selectSidoAll();
	public List<HashMap<String, Object>> selectGungu(String sido);
	public int selectAddrNo(String gungu);

	
	//마이페이지 
	//마이리스트
	public int getCountBoardByUserIndex(int userIndex);
	public int getCountBoardApplyByUserIndex(int userIndex);
	public List<HashMap<String, Object>> selectBoardByUserIndex(HashMap<String, Object>params);
	public List<HashMap<String, Object>> selectBoardApply(HashMap<String, Object>params);
	
	
	
	public int getCountBoardComplete(int userIndex);
	public List<HashMap<String, Object>> selectBoardComplete(HashMap<String, Object>params);
	
	
	//파일관련
	public int insertBoardFile(HashMap<String, Object> params);
	public int updateBoardFile(HashMap<String, Object> params);
	public int deleteBoardFile(int fileId);
	public HashMap<String, Object> selectOneBoardFile(int fileId);
	public List<HashMap<String, Object>> selectAllBoardFile();
	
}
