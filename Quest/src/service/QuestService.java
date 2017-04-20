package service;

import java.util.HashMap;
import java.util.List;

import org.apache.tomcat.util.bcel.Const;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import commons.Constant;
import commons.Constant.User;
import dao.IQuestDao;

@Service
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
	public List<HashMap<String, Object>> listBoard(
			@RequestParam(required=false) List<Integer> addrNo,
			@RequestParam(defaultValue="0") int boardflag, 
			@RequestParam(required=false) String searchMsg, 
			@RequestParam(required=false, defaultValue="0") int userIndex) {
		// TODO Auto-generated method stub
			HashMap<String, Object> params = new HashMap<>();
			
			params.put("addrNo", addrNo);
			params.put("boardFlag", boardflag);
			params.put("userIndex", userIndex);
			params.put("searchMsg", searchMsg);
			return dao.selectBoard(params);
			
				
//			addr/searchMsg/userIndex 는 없으면 검색안됨
//			boardflag 는 디폴트 "잘해요"
		
			
	}	
	
	@Override
	public HashMap<String, Object> readBoard(int boardNo) {
		HashMap<String, Object> bd = dao.selectBoardOne(boardNo);
		bd.put(Constant.Board.READCOUNT, (int)bd.get(Constant.Board.READCOUNT)+1);
		dao.updateBoard(bd);
		return bd;
	}
	
	@Override
	public HashMap<String, Object> getBoardList(int page) {
		// TODO Auto-generated method stub
		// 첫페이지 → 맨 앞페이지
		// 시작페이지 → 현재 보이는 첫 페이지
		// 끝페이지 → 현재 보이는 마지막 페이지
		// 마지막페이지 → 맨 마지막 페이지

		// 시작페이지와 끝페이지를 계산해보세요
		int start = (page - 1) / 10 * 10 + 1;
		int end = ((page - 1) / 10 + 1) * 10;
		// 첫페이지와 마지막페이지를 계산
		int first = 1;
		int last = (dao.getBoardCount() - 1) / 10 + 1;

		// 끝페이지 검증
		end = last < end ? last : end;

		// 해당 페이지의 게시물을 쿼리하기 위한 skip과 count
		int skip = (page - 1) * 10;
		int count = 10;
		HashMap<String, Object> params = new HashMap<>();
		params.put("skip", skip);
		params.put("count", count);
		List<HashMap<String, Object>> list = dao.selectBoardLimit(params);

		HashMap<String, Object> result = new HashMap<>();
		result.put("start", start);
		result.put("first", first);
		result.put("end", end);
		result.put("last", last);
		result.put("current", page);
		result.put("boardList", list);

		return result;
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
	public int selectpolice(int BoardNo, int userIndex) {
		// TODO Auto-generated method stub
		HashMap<String, Object> params = new HashMap<>();
		params.put(Constant.Police.BOARDNO, BoardNo);
		params.put(Constant.Police.USERINDEX, userIndex);
		HashMap<String, Object> result = dao.selectPolice(params);
		if(result == null){
			return 1;  //신고없음. 신고접수 가능
		}
		else return 2;	// 신고데이터 있음. 신고접수 불가능 
	}
	
	@Override
	public List<HashMap<String, Object>> selectAll() {
		// TODO Auto-generated method stub
		
		return dao.selectBoardAll(); 
	}
 
	@Override
	public HashMap<String, Object> getUser(int userIndex) {
		// TODO Auto-generated method stub
		HashMap<String, Object> tmp = new HashMap<>();
		tmp.put("userIndex", userIndex);
		HashMap<String, Object> user = dao.selectUser(tmp);
		
		return user;
	}
	public HashMap<String, Object> getBoard(int boardNo) {
		// TODO Auto-generated method stub
		return dao.selectBoardOne(boardNo);

	}

	@Override
	public String getContact(int contactNo) {
		// TODO Auto-generated method stub
				
		return dao.selectContact(contactNo);
	}

	@Override
	public List<HashMap<String, Object>> getSidoAll() {
		// TODO Auto-generated method stub
		List<HashMap<String, Object>> sido = dao.selectSidoAll();
		return sido;
	}

	@Override
	public List<HashMap<String, Object>> getGugun(String sido) {
		// TODO Auto-generated method stub
		List<HashMap<String, Object>> gugun = dao.selectGugun(sido);
		return gugun;
	}

	@Override
	public boolean isMyBoard(HashMap<String, Object> params) {
		// TODO Auto-generated method stub
		if(dao.isMyBoard(params) == null)
			return false;
		else
			return true;
	}  







}
