package dao;
import java.util.HashMap;
import java.util.List;

import javax.xml.stream.events.Comment;

import model.Apply;
import model.Board;
import model.Bookmark;
import model.Police;
import model.Score;
import model.User;

public interface daoInterface {
	public int insertBoard(Board board);
	public int updateBoard(Board board);
	public int deleteBoard(int boradNo);
	public List<Board> selectBoardAll();
	public Board selectBoardOne(int boardNo);
	
	public int insertUser(User user);
	public int updateUser(User user);
	public int deleteUser(int user_index);
	public User selectUser(int user_index);
	

	public int insertComment(HashMap<String, Object> params);
	public int updateComment(HashMap<String, Object> params);
	public int deleteComment(HashMap<String, Object> params);
//	public Comment selectCommentByBoardNo(int boardNo);
	public List<Comment> selectAllCommentByBoardNo(int boardNo);
	
	public int insertApply(Apply apply);
	public int updateApply(Apply apply);
	public List<Apply> selectAllApplyByBoardNo(int boardNo);
	public List<Apply> selectAllApplyByUserIndex(int User_Index);


	public int insertScore(HashMap<String, Object> params);
	public int updateScore(HashMap<String, Object> params);
//	public Score selectScoreByUser1Id(int user1_index);
//	public Score selectScoreByUser2Id(int user2_index);
	public HashMap<String, Object> selectScoreByBoardNo(int boardNo);

	public int insertBookMark(Bookmark bookmark);
	public int deleteBookMark(Bookmark bookmark);
	public Bookmark selectBookMark(Bookmark bookmark);

	public int insertPolice(Police police);
	public int selectPolice(Police police);

	public String selectaddr1(int addr1No);
	public String selectaddr2(int addr2No);

}
