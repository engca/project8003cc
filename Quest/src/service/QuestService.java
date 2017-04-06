package service;

import java.util.HashMap;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Component;

import commons.Constant;
import dao.IQuestDao;

@Component
public class QuestService implements IQuestService {
	
	@Autowired
	private IQuestDao dao;
	@Autowired
	private DataSourceTransactionManager txManager;

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
	public List<HashMap<String, Object>> listBoard(List<Integer> addrNo, int mode, String searchMsg, int userIndex) {
		// TODO Auto-generated method stub
			HashMap<String, Object> params = new HashMap<>();
			
			params.put("addrNo", addrNo);
			params.put("boardFlag", mode);
			params.put("userIndex", userIndex);
			params.put("searchMsg", searchMsg);
			return dao.selectBoard(params);
			//선택한 지역 번호 리스트와
			//어떤리스트를 보여줄지랑
			//검색어
			
			//될지 안될지 모르겟음
			//될지 안될지 모르겟음
			//될지 안될지 모르겟음
			//될지 안될지 모르겟음
			//될지 안될지 모르겟음
			//될지 안될지 모르겟음
			//될지 안될지 모르겟음
			//될지 안될지 모르겟음
			//될지 안될지 모르겟음
			//될지 안될지 모르겟음
			//될지 안될지 모르겟음
			//될지 안될지 모르겟음
			//될지 안될지 모르겟음
			//될지 안될지 모르겟음
			//될지 안될지 모르겟음
			//될지 안될지 모르겟음
			
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
	public int choiceApply(int user1Index, int user2Index, int boardNo) {
		// TODO Auto-generated method stub
		// selectApply
//		params에 들어와야 할것들
			//글을 올린사람 = user1_id
			//신청하여 선택 받은사람 = user2_id
			//boardNo
		HashMap<String, Object> params = new HashMap<>();
		params.put("user1Index", user1Index);
		params.put("user2Index", user2Index);
		params.put("boardNo", boardNo);
		dao.insertScore(params);
		//INSERT INTO score VALUES (#{user1_index},#{user2_index},#{boardNo},0,0,0)
		//평가완료확인  = user1_exp = user2_exp = 0
		dao.deleteApply(boardNo);
		// 지원한 목록들 삭제
		
		return 0;
	}

	@Override
	public List<HashMap<String, Object>> listScore(int userIndex, int mode) {
		// TODO Auto-generated method stub
//		mode가 0이면 파라미터의 user가  user1일때 리턴되는 리스트
//		mode가 1면 파라미터의 user가 user2일때 리턴되는 리스트
		HashMap<String, Object> params = new HashMap<>();
		if(mode == 0)
			params.put("user1Index", userIndex);
		else if(mode == 1)
			params.put("user2Index", userIndex);
		
		return dao.selectScoreByUserindex(params);
	}

	@Override
	public int writeScore(int boardNo, float starPoint, int mode) {
		// TODO Auto-generated method stub
		// boardNo
		// starPoint
		// mode = 0이면 내가 user1_exp
		// mode = 1이면 내가 user2_exp
		HashMap<String, Object> params = new HashMap<>();
		
		params.put("boardNo", boardNo);
		if(mode == 0)
			params.put("user1StarPoint", starPoint);
		else if(mode == 1)
			params.put("user2StarPoint", starPoint);
		return dao.updateScore(params);
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

	@Override
	public List<HashMap<String, Object>> selectAll() {
		// TODO Auto-generated method stub
		
		return dao.selectBoardAll();
	}

}
