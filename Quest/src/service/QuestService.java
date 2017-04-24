package service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.reflection.SystemMetaObject;
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
// 
	@Override
	public int join(HashMap<String, Object> params) {
		// TODO Auto-generated method stub
		dao.insertUser(params);
		return 1; // 성공
	}

	@Override
	public HashMap<String, Object> login(String id, String password) {
		// TODO Auto-generated method stub
		HashMap<String, Object> params = new HashMap<>();
		params.put(Constant.User.USERID, id);
		HashMap<String, Object> user = dao.selectUser(params);
		if (user.get(Constant.User.PASSWORD) == password) {
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
		if (user == null) {
			return 0; // 성공. 아이디 사용가능
		} else {
			return 1; // 실패. 동일한 아이디 있음
		}
	}

	@Override
	public int nicknameCheck(String nickname) {
		// TODO Auto-generated method stub
		HashMap<String, Object> params = new HashMap<>();
		params.put(Constant.User.NICKNAME, nickname);
		HashMap<String, Object> user = dao.selectUser(params);
		if (user == null) {
			return 0; // 성공. 닉네임 사용가능
		} else {
			return 1; // 실패. 동일한 닉넴 있음
		}
	}

	
	@Override
	public HashMap<String, Object> getBoardList(int boardflag, int page) {
	
		// 시작페이지와 끝페이지
		int start = (page - 1) / 10 * 10 + 1;
		int end = ((page - 1) / 10 + 1) * 10;
		// 첫페이지와 마지막페이지
		int first = 1;
		int last = (dao.getBoardCount(boardflag) - 1) / 10 + 1;
		// 끝페이지 검증
		end = last < end ? last : end;
		// 해당 페이지의 게시물을 쿼리하기 위한 skip과 count
		int skip = (page - 1) * 10;
		int count = 10;
		
		HashMap<String, Object> params = new HashMap<>();
		params.put("boardFlag", boardflag);
		params.put("skip", skip);
		params.put("count", count);
		
		List<HashMap<String, Object>> list = dao.selectBoardByUserIndex(params);
		
		HashMap<String, Object> result = new HashMap<>();
		for (HashMap<String, Object> board : list ){
			int userindex = (int) (board.get("userIndex"));
			board.put("nickname", nickname(userindex));
		}				
		result.put("start", start);
		result.put("first", first);
		result.put("end", end);
		result.put("last", last);
		result.put("current", page);
		result.put("boardList", list);
		return result;  		
	}

	@Override
	public HashMap<String, Object> readBoard(int boardNo) {
		HashMap<String, Object> bd = dao.selectBoardOne(boardNo);
		bd.put(Constant.Board.READCOUNT, (int) bd.get(Constant.Board.READCOUNT) + 1);
		dao.updateBoard(bd);
		return bd;
	}


	@Override
	public int writeBoard(HashMap<String, Object> params) {
		// TODO Auto-generated method stub
		int addrNo = dao.selectAddrNo((String)params.get("gungu"));
		params.put("addrNo", addrNo);
		return dao.insertBoard(params);
	}

	@Override
	public int updateBoard(HashMap<String, Object> params) {
		// TODO Auto-generated method stub
		int addrNo = dao.selectAddrNo((String)params.get("gungu"));
		params.put("addrNo", addrNo);
		System.out.println(params);
		return dao.updateBoard(params);
	}

	@Override
	public int deleteBoard(HashMap<String, Object> params) {
		// TODO Auto-generated method stub
		int boradNo = (int) params.get(Constant.Board.BOARDNO);
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
		// params에 들어와야 할것들
		// 글을 올린사람 = user1_id
		// 신청하여 선택 받은사람 = user2_id
		// boardNo
		HashMap<String, Object> params = new HashMap<>();
		params.put("user1Index", user1Index);
		params.put("user2Index", user2Index);
		params.put("boardNo", boardNo);
		dao.insertScore(params);
		// INSERT INTO score VALUES
		// (#{user1_index},#{user2_index},#{boardNo},0,0,0)
		// 평가완료확인 = user1_exp = user2_exp = 0
		dao.deleteApply(boardNo);
		// 지원한 목록들 삭제

		return 0;
	}

	@Override
	public List<HashMap<String, Object>> listScore(int userIndex, int mode) {
		// TODO Auto-generated method stub
		// mode가 0이면 파라미터의 user가 user1일때 리턴되는 리스트
		// mode가 1면 파라미터의 user가 user2일때 리턴되는 리스트
		HashMap<String, Object> params = new HashMap<>();
		if (mode == 0)
			params.put("user1Index", userIndex);
		else if (mode == 1)
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
		if (mode == 0)
			params.put("user1StarPoint", starPoint);
		else if (mode == 1)
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
			dao.insertPolice(params);
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
//		System.out.println( dao.selectBoardOne(boardNo));
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
	public List<HashMap<String, Object>> getGungu(String sido) {
		// TODO Auto-generated method stub
		List<HashMap<String, Object>> gungu = dao.selectGungu(sido);
		return gungu;
	}

	@Override

	public List<HashMap<String, Object>> listBookmark(HashMap<String, Object> params) {
		// TODO Auto-generated method stub
		List<HashMap<String, Object>> bookmarkList = dao.selectBookMark(params);
		return bookmarkList;
	}

	public boolean isMyBoard(HashMap<String, Object> params) {
		// TODO Auto-generated method stub
		if(dao.isMyBoard(params) == null)
			return false;
		else 
			return true;
	}

	@Override
	public HashMap<String, Object> bookmarkBoardByUserIndex(int userIndex, int page) {
		// TODO Auto-generated method stub
	// TODO Auto-generated method stub
		
		// 시작페이지와 끝페이지 계산
		int start = (page - 1) / 10 * 10 + 1;
		int end = ((page - 1) / 10 + 1) * 10;
		// 첫페이지와 마지막 페이지 계산
		int first = 1;
		int last = (dao.getBookmarkByUserIndexCount(userIndex) - 1) / 10 + 1;
		end = last < end ? last : end;
		// 해당페이지의 게시물을 쿼리 하기 위한 skip과 count
		int skip = (page - 1) * 10;
		int count = 10;
		
		HashMap<String, Object> params = new HashMap<>();
		params.put("userIndex", userIndex);
		params.put("page", page);
		params.put("skip", skip);
		params.put("count", count);

		List<HashMap<String, Object>> list = dao.selectBookMarkByUserIndex(params);
		
		HashMap<String, Object> result = new HashMap<>();
		result.put("start", start);
		result.put("first", first);
		result.put("end", end);
		result.put("last", last);
		result.put("current", page);
		result.put("bookmarkList", list);
		result.put("nickname", dao.selectNicknname(userIndex));
		
		return result;

	}

	@Override
	public String nickname(int userIndex) {
		// TODO Auto-generated method stub
		
		return dao.selectNicknname(userIndex);
	}

	@Override
	public HashMap<String, Object> myapply(int userIndex, int page, int boardFlag) {
		// TODO Auto-generated method stub
		// 시작페이지와 끝페이지 계산
		int start = (page - 1) / 10 * 10 + 1;
		int end = ((page - 1) / 10 + 1) * 10;
		// 첫페이지와 마지막 페이지 계산
		int first = 1;
		int last = (dao.getCountBoardApplyByUserIndex(userIndex) - 1) / 10 + 1;
		end = last < end ? last : end;
		// 해당페이지의 게시물을 쿼리 하기 위한 skip과 count
		int skip = (page - 1) * 10;
		int count = 10;
		
		HashMap<String, Object> params = new HashMap<>();
		params.put("userIndex", userIndex);
		params.put("page", page);
		params.put("skip", skip);
		params.put("count", count);
		params.put("boardFlag", boardFlag);
		
		
		//apply+board 내가 신청한거
		List<HashMap<String, Object>> myapply = dao.selectBoardApply(params);
		for(HashMap<String, Object> p : myapply){
			String nickname =dao.selectNicknname((int)p.get("userIndex"));
			p.put("nickname", nickname);
			
		}
		
		
		HashMap<String, Object> result = new HashMap<>();
		result.put("myapplystart", start);
		result.put("myapplyfirst", first);
		result.put("myapplyend", end);
		result.put("myapplylast", last);
		result.put("myapplycurrent", page);
		result.put("myapply", myapply);
		result.put("myapplyboardFlag", boardFlag);
		
		
		return result;
	}

	@Override
	public HashMap<String, Object> myboard(int userIndex, int page, int boardFlag) {
		// TODO Auto-generated method stub
		// 시작페이지와 끝페이지 계산
		int start = (page - 1) / 10 * 10 + 1;
		int end = ((page - 1) / 10 + 1) * 10;
		// 첫페이지와 마지막 페이지 계산
		int first = 1;
		int last = (dao.getCountBoardByUserIndex(userIndex) - 1) / 10 + 1;
		end = last < end ? last : end;
		// 해당페이지의 게시물을 쿼리 하기 위한 skip과 count
		int skip = (page - 1) * 10;
		int count = 10;
		
		HashMap<String, Object> params = new HashMap<>();
		params.put("userIndex", userIndex);
		params.put("page", page);
		params.put("skip", skip);
		params.put("count", count);
		params.put("boardFlag", boardFlag);
		
		
		//board에서 내가 쓴거
		List<HashMap<String, Object>> myboard = dao.selectBoardByUserIndex(params);
		
		//apply+board 내가 신청한거
		
		String nickname =dao.selectNicknname(userIndex);
		
		HashMap<String, Object> result = new HashMap<>();
		result.put("myboardstart", start);
		result.put("myboardfirst", first);
		result.put("myboardend", end);
		result.put("myboardlast", last);
		result.put("myboardcurrent", page);
		result.put("myboard", myboard);
		result.put("myboardnickname", nickname);
		result.put("myboardboardFlag", boardFlag);
		
		
		return result;
	}


	public HashMap<String, Object> getAddress(int addrNo) {
		// TODO Auto-generated method stub
		return dao.selectAddress(addrNo);

	}




	






}
