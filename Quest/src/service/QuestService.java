package service;

import java.util.HashMap;
import java.util.List;

import javax.net.ssl.HttpsURLConnection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

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
		
		return null;
	}

	@Override
	public int logout(HashMap<String, Object> params) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int unjoin(HashMap<String, Object> params) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public HashMap<String, Object> updateUser(HashMap<String, Object> params) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int idCheck(String id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int nicknameCheck(String nickname) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<HashMap<String, Object>> listBoard(HashMap<String, Object> params, int mode, String searchMsg) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int writeBoard(HashMap<String, Object> params) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateBoard(HashMap<String, Object> params) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteBoard(HashMap<String, Object> params) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<HashMap<String, Object>> listComment(int BoardNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int writeComment(HashMap<String, Object> params) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateComment(HashMap<String, Object> params) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteComment(HashMap<String, Object> params) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<HashMap<String, Object>> listApply(int BoardNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int writeApply(HashMap<String, Object> params) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateApply(HashMap<String, Object> params) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteApply(HashMap<String, Object> params) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int choiceApply(int userIndex) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<HashMap<String, Object>> listBoard(int user1Index) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int writeScore(float starPoint) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int bookmark(int BoardNo, int userIndex) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int police(int BoardNo, int userIndex) {
		// TODO Auto-generated method stub
		return 0;
	}

}
