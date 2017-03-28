package service;
import java.util.List;

import javax.xml.stream.events.Comment;

import model.Apply;
import model.Board;
import model.User;

public interface serviceInterface {

	public int join(User user);

	public User login(String id, String password);

	public int logout(User user);

	public int unjoin(User user);

	public User updateUser(User user);

	public int idCheck(String id);

	public int nicknameCheck(String nickname);

	public List<Board> listBoard(Board board, int mode, String searchMsg);

	public int writeBoard(Board board);

	public int updateBoard(Board board);

	public int deleteBoard(Board board);

	public List<Comment> listComment(int BoardNo);

	public int writeComment(Comment comment);

	public int updateComment(Comment comment);

	public int deleteComment(Comment comment);

	public List<Apply> listApply(int BoardNo);

	public int writeApply(Apply apply);

	public int updateApply(Apply apply);

	public int deleteApply(Apply apply);

	public int choiceApply(int user_index);

	public List<Board> listBoard(int user1_index);

	public int writeScore(float starPoint);

	public int bookmark(int BoardNo, int user_index);

	public int police(int BoardNo, int user_index);

}
