package service;

import java.util.HashMap;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import commons.Constant;
import dao.IQuestDao;

@Component
public class QuestService implements IQuestService {
	
	@Autowired
	private IQuestDao dao;

	@Override
	public int join(HashMap<String, Object> params) {
		// TODO Auto-generated method stub
		return dao.insertUser(params);
	}

	@Override
	public HashMap<String, Object> login(String id, String password) {
		// TODO Auto-generated method stub
		HashMap<String, Object> params = new HashMap<>();
		params.put(Constant.User.USERID, id);
		HashMap<String, Object> user = dao.selectUser(params);
		if(user.get(Constant.User.PASSWORD) == password) {
			return user;
		} else {
			return null;
		}
	}

	@Override
	public int logout(HashMap<String, Object> params) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int unjoin(HashMap<String, Object> params) {
		// TODO Auto-generated method stub
		int userIndex = (int) params.get(Constant.User.USERINDEX);
		return dao.deleteUser(userIndex);
	}

	@Override
	public int updateUser(HashMap<String, Object> params) {
		// TODO Auto-generated method stub
		return dao.updateUser(params);
	}

	@Override
	public int idCheck(String id) {
		// TODO Auto-generated method stub
		HashMap<String, Object> params = new HashMap<>();
		params.put(Constant.User.USERID, id);
		HashMap<String, Object> user = dao.selectUser(params);
		if(user == null) {
			return 0; //성공
		} else {
			return 1; //실패
		}
	}

	@Override
	public int nicknameCheck(String nickname) {
		// TODO Auto-generated method stub
		HashMap<String, Object> params = new HashMap<>();
		params.put(Constant.User.NICKNAME, nickname);
		HashMap<String, Object> user = dao.selectUser(params);
		if(user == null) {
			return 0; //성공
		} else {
			return 1; //실패
		}
	}

	@Override
	public List<HashMap<String, Object>> listBoard(HashMap<String, Object> params, int mode, String searchMsg) {
		// TODO Auto-generated method stub
		// 상진아 화이팅
		// 상진아 화이팅
		// 상진아 화이팅
		// 상진아 화이팅
		// 상진아 화이팅
		// 상진아 화이팅
		// 상진아 화이팅
		// 상진아 화이팅
		// 상진아 화이팅
		// 상진아 화이팅
		// 상진아 화이팅
		// 상진아 화이팅
		// 상진아 화이팅
		// 상진아 화이팅
		// 상진아 화이팅
		// 상진아 화이팅
		// 상진아 화이팅
		return null;
	}

	@Override
	public int writeBoard(HashMap<String, Object> params) {
		// TODO Auto-generated method stub
		return dao.insertBoard(params);
	}

	@Override
	public int updateBoard(HashMap<String, Object> params) {
		// TODO Auto-generated method stub
		return dao.updateBoard(params);
	}

	@Override
	public int deleteBoard(HashMap<String, Object> params) {
		// TODO Auto-generated method stub
		int boradNo = (int)params.get(Constant.Board.BOARDNO);
		return dao.deleteBoard(boradNo);
	}

	@Override
	public List<HashMap<String, Object>> listComment(int BoardNo) {
		// TODO Auto-generated method stub
		List<HashMap<String, Object>> list = dao.selectAllCommentByBoardNo(BoardNo);
		return list;
	}

	@Override
	public int writeComment(HashMap<String, Object> params) {
		// TODO Auto-generated method stub
		return dao.insertComment(params);
	}

	@Override
	public int updateComment(HashMap<String, Object> params) {
		// TODO Auto-generated method stub
		return dao.updateComment(params);
	}

	@Override
	public int deleteComment(HashMap<String, Object> params) {
		// TODO Auto-generated method stub
		return dao.deleteComment(params);
	}

	@Override
	public List<HashMap<String, Object>> listApply(int BoardNo) {
		// TODO Auto-generated method stub
		List<HashMap<String, Object>> list = dao.selectAllApplyByBoardNo(BoardNo);
		return list;
	}

	@Override
	public int writeApply(HashMap<String, Object> params) {
		// TODO Auto-generated method stub
		return dao.insertApply(params);
	}

	@Override
	public int updateApply(HashMap<String, Object> params) {
		// TODO Auto-generated method stub
		return dao.updateApply(params);
	}

	@Override
	public int deleteApply(HashMap<String, Object> params) {
		// TODO Auto-generated method stub
		params.put(Constant.Apply.ACOMPLETEFLAG, 0);
		return dao.updateApply(params);
	}

	@Override
	public int choiceApply(int userIndex) {
		// TODO Auto-generated method stub
		// 상진아 고마워 화이팅
		// 상진아 고마워 화이팅
		// 상진아 고마워 화이팅
		// 상진아 고마워 화이팅
		// 상진아 고마워 화이팅
		// 상진아 고마워 화이팅
		// 상진아 고마워 화이팅
		// 상진아 고마워 화이팅
		// 상진아 고마워 화이팅
		// 상진아 고마워 화이팅
		
		return 0;
	}

	@Override
	public List<HashMap<String, Object>> listBoard(int user1Index) {
		// TODO Auto-generated method stub
		// 상진아 고마워 화이팅
		// 상진아 고마워 화이팅
		// 상진아 고마워 화이팅
		// 상진아 고마워 화이팅
		// 상진아 고마워 화이팅
		// 상진아 고마워 화이팅
		// 상진아 고마워 화이팅
		// 상진아 고마워 화이팅
		// 상진아 고마워 화이팅
		// 상진아 고마워 화이팅
		
		return null;
	}

	@Override
	public int writeScore(float starPoint) {
		// TODO Auto-generated method stub
		HashMap<String, Object> params = new HashMap<>();
		params.put(Constant.Score.USER1STARPOINT, starPoint);
		// 상진아 고마워 화이팅
		// 상진아 고마워 화이팅
		// 상진아 고마워 화이팅
		// 상진아 고마워 화이팅
		// 상진아 고마워 화이팅
		// 상진아 고마워 화이팅
		// 상진아 고마워 화이팅
		// 상진아 고마워 화이팅
		// 상진아 고마워 화이팅
		// 상진아 고마워 화이팅
		// 상진아 고마워 화이팅
		// 상진아 고마워 화이팅
		// 상진아 고마워 화이팅
		// 상진아 고마워 화이팅
		// 상진아 고마워 화이팅
		// 상진아 고마워 화이팅
		return dao.insertScore(params);
	}

	@Override
	public int bookmark(int BoardNo, int userIndex) {
		// TODO Auto-generated method stub
		HashMap<String, Object> params = new HashMap<>();
		params.put(Constant.Bookmark.BOARDNO, BoardNo);
		params.put(Constant.Bookmark.USERINDEX, userIndex);
		return dao.insertBookMark(params);
	}

	@Override
	public int police(int BoardNo, int userIndex) {
		// TODO Auto-generated method stub
		HashMap<String, Object> params = new HashMap<>();
		params.put(Constant.Police.BOARDNO, BoardNo);
		params.put(Constant.Police.USERINDEX, userIndex);
		return dao.insertPolice(params);
	}

}
