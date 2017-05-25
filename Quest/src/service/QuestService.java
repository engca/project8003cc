package service;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Service;

import commons.Constant;
import dao.IQuestDao;

@Service
public class QuestService implements IQuestService {

	@Autowired
	private IQuestDao dao;
	@Autowired
	private DataSourceTransactionManager txManager;

	
	@Override
	public void getSession(HttpSession session, int userIndex) {
		// TODO Auto-generated method stub
		session.setAttribute("todoapply", getSessionTodoApply( userIndex));
		session.setAttribute("dowellApply", getSessionDowellApply( userIndex));
		session.setAttribute("todo", getSessionTodo(userIndex));
		session.setAttribute("dowell", getSessionDowell( userIndex));
	}

	@Override
	public int getSessionTodoApply(int userIndex) {
		// TODO Auto-generated method stub
		return dao.selectDowellApply(userIndex);
	}

	@Override
	public int getSessionDowellApply(int userIndex) {
		// TODO Auto-generated method stub
		return dao.selectTodoApply(userIndex);
	}

	@Override
	public int getSessionTodo(int userIndex) {
		// TODO Auto-generated method stub
		
		return dao.selectTodo(userIndex);
	}

	@Override
	public int getSessionDowell(int userIndex) {
		// TODO Auto-generated method stub
		return dao.selectDowell(userIndex);
	}

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
		System.out.println(id + " " + password);
		HashMap<String, Object> user = dao.selectUser(params);
		if (user != null) {
			if (user.get(Constant.User.PASSWORD).equals(password))
				return user;
			return null;
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
		for (HashMap<String, Object> board : list) {
			int userindex = (int) (board.get("userIndex"));
			board.put("nickname", nickname(userindex));
			int boardNo = (int) (board.get("boardNo"));
			// 신청갯수 체크하려고 넣은것!!
			int applyCount = (int) dao.applyCount(boardNo);
			board.put("applyCount", applyCount);
			// 댓글갯수 체크하려고 넣은 것!!
			int commentCount = dao.selectCommentCount(boardNo);
			board.put("commentCount", commentCount);
		}
		result.put("start", start);
		result.put("first", first);
		result.put("end", end);
		result.put("last", last);
		result.put("current", page);
		result.put("boardFlag", boardflag);
		result.put("boardList", list);
		System.out.println("리스트보드용" + result);
		return result;
	}

	@Override
	public HashMap<String, Object> searchBoardList(int boardflag, int searchFlag, int page, String searchKey,
			String[] area) {
		// TODO Auto-generated method stub
		// 시작페이지와 끝페이지

		int skip = (page - 1) * 10;
		int count = 10;

		HashMap<String, Object> params = new HashMap<>();
		params.put("boardFlag", boardflag);
		params.put("skip", skip);
		params.put("count", count);
		params.put("searchKey", searchKey);
		if (area != null) {
			int[] areaList = new int[area.length];
			for (int i = 0; i < area.length; i++) {
				areaList[i] = dao.selectAddrNo(area[i]);
				System.out.println(areaList[i]);
			}
			params.put("area", areaList);
		}
		List<HashMap<String, Object>> list = null;
		if (searchFlag == 0)
			list = dao.selectBoardByContent(params);
		else
			list = dao.selectBoardByWriter(params);
		int start = (page - 1) / 10 * 10 + 1;
		int end = ((page - 1) / 10 + 1) * 10;
		// 첫페이지와 마지막페이지
		int first = 1;
		// 끝페이지 검증
		// 해당 페이지의 게시물을 쿼리하기 위한 skip과 count
		int last = (list.size() - 1) / 10 + 1;
		end = last < end ? last : end;

		HashMap<String, Object> result = new HashMap<>();
		for (HashMap<String, Object> board : list) {
			int userindex = (int) (board.get("userIndex"));
			board.put("nickname", nickname(userindex));
			int boardNo = (int) (board.get("boardNo"));
			int commentCount = dao.selectCommentCount(boardNo);
			board.put("commentCount", commentCount);
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
	public HashMap<String, Object> readBoard(int boardNo, int userIndex) {
		// 보드 불러와서 조회수 업데이트하기
		HashMap<String, Object> bd = dao.selectBoardOne(boardNo);
		bd.put(Constant.Board.READCOUNT, (int) bd.get(Constant.Board.READCOUNT) + 1);
		dao.updateBoard(bd);

		// 컨택방법 테이블 참조
		int contactNo = (int) bd.get(Constant.Board.CONTACTNO);
		String contactMethod = null;
		if (contactNo == 1)
			contactMethod = "KakaoTalk";
		else if (contactNo == 2)
			contactMethod = "Email";
		else
			contactMethod = "Phone";

		// 주소테이블 참조
		int addrNo = (int) bd.get(Constant.Board.ADDRNO);
		HashMap<String, Object> addr = dao.selectAddress(addrNo);

		// 신청하기 테이블 참조
		int AboardNo = (int) bd.get(Constant.Board.BOARDNO);
		System.out.println("ReadBoard" + AboardNo + "&" + userIndex);
		HashMap<String, Object> apply = new HashMap<>();
		apply.put("boardNo", AboardNo);
		apply.put("userIndex", userIndex);
		HashMap<String, Object> applydata = dao.selectApply(apply);

		// 신고하기 테이블 참조
		int PboardNo = (int) bd.get(Constant.Board.BOARDNO);
		HashMap<String, Object> police = new HashMap<>();
		police.put("boardNo", PboardNo);
		police.put("userIndex", userIndex);
		HashMap<String, Object> policedata = dao.selectPolice(police);

		// 즐겨찾기 테이블 참조
		int BboardNo = (int) bd.get(Constant.Board.BOARDNO);
		HashMap<String, Object> bookmark = new HashMap<>();
		bookmark.put("boardNo", BboardNo);
		bookmark.put("userIndex", userIndex);
		List<HashMap<String, Object>> bookmarkdata = dao.selectBookMark(bookmark);

		// 최종 해쉬맵에 담아보내기
		HashMap<String, Object> result = new HashMap<>();
		result.put("applydata", applydata);
		result.put("policedata", policedata);
		result.put("bookmarkdata", bookmarkdata);
		result.put("boardList", bd);
		result.put("contactMethod", contactMethod);
		result.put("addr", addr);
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
		int addrNo = dao.selectAddrNo((String) params.get("gungu"));
		params.put("addrNo", addrNo);
		System.out.println(params);
		return dao.updateBoard(params);
	}

	@Override
	public int deleteBoard(int boardNo) {
		// TODO Auto-generated method stub
		return dao.deleteBoard(boardNo);
	}

	@Override
	public List<HashMap<String, Object>> listComment(int boardNo) {
		// TODO Auto-generated method stub
		List<HashMap<String, Object>> list = dao.selectAllCommentByBoardNo(boardNo);

		for (HashMap<String, Object> board : list) {
			int userindex = (int) (board.get("userIndex"));
			board.put("nickname", nickname(userindex));
		}
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
	public int commentCount(int BoardNo) {
		// TODO Auto-generated method stub
		return dao.selectCommentCount(BoardNo);
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
		System.out.println("choiceApply" + user2Index + "ok");

		// board 테이블 보드클래그 3. 퀘진행중으로 바꿈
		System.out.println("Board choiceApply" + dao.selectBoardOne(boardNo));
		HashMap<String, Object> flag = dao.selectBoardOne(boardNo);
		flag.put("bCompleteFlag", 3);
		dao.updateBoard(flag);
		System.out.println("?");

		// apply테이블 컴플리트 플래그 2. 간택완료로 바꿈
		HashMap<String, Object> tmp = new HashMap<>();
		tmp.put("boardNo", boardNo);
		tmp.put("userIndex", user2Index); // 신청자
		System.out.println("temp" + tmp);
		HashMap<String, Object> applyD = dao.selectApply(tmp);
		System.out.println("Befor aaplyD" + applyD);
		applyD.put("aCompleteFlag", 2);
		System.out.println("After aaplyD" + applyD);
		dao.updateApply(applyD);
		System.out.println("!!!!?");

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
	public int writeScore(int boardNo, float starPoint, int mode, HttpSession session, int user1Index, int user2Index) {
		// TODO Auto-generated method stub
		// boardNo
		// starPoint
		// mode = 0이면 내가 user1_exp
		// mode = 1이면 내가 user2_exp
		HashMap<String, Object> params = new HashMap<>();
		params.put("boardNo", boardNo);
		params.put("user1Index", user1Index);
		params.put("user2Index", user2Index);

		HashMap<String, Object> tmpParams = new HashMap<>();
		tmpParams.put("boardNo", boardNo);
		tmpParams.put("user1Index", user1Index);
		tmpParams.put("user2Index", user2Index);

		HashMap<String, Object> scoreData = dao.selectScoreByBoardNo(tmpParams);

		int sCompleteFlag = (int) scoreData.get(Constant.Score.SCOMPLETEFLAG);

		if (mode == 0) {
			params.put("user2StarPoint", starPoint);
			if (sCompleteFlag == 0) {
				params.put(Constant.Score.SCOMPLETEFLAG, 1);
			} else {
				params.put(Constant.Score.SCOMPLETEFLAG, 3);
				HashMap<String, Object> user1 = new HashMap<>();
				HashMap<String, Object> user2 = new HashMap<>();
				float user1StarPoint = (float) scoreData.get(Constant.Score.USER1STARPOINT);
				float user2StarPoint = starPoint;
				int user1DoCount = dao.selectDoCountByUserIndex(user1Index) + 1;
				int user2DoCount = dao.selectDoCountByUserIndex(user2Index) + 1;
				user1.put(Constant.User.USERINDEX, user1Index);
				user2.put(Constant.User.USERINDEX, user2Index);
				user1.put(Constant.User.STARPOINT,
						(dao.selectStarPointByUserIndex(user1Index) + user1StarPoint) / user1DoCount);
				user2.put(Constant.User.STARPOINT,
						(dao.selectStarPointByUserIndex(user2Index) + user2StarPoint) / user2DoCount);
				user1.put(Constant.User.DOCOUNT, user1DoCount);
				user2.put(Constant.User.DOCOUNT, user2DoCount);
				System.out.println(user1);
				System.out.println(user2);
				dao.updateUser(user1);
				dao.updateUser(user2);
				
				if(dao.countByBoardNo(boardNo) == 1) {
					HashMap<String, Object> tmp = dao.selectBoardOne(boardNo);
					tmp.put(Constant.Board.BCOMPLETEFLAG, 1);
					dao.updateBoard(tmp);
				}
			}
		}
		if (mode == 1) {
			params.put("user1StarPoint", starPoint);
			if (sCompleteFlag == 0) {
				params.put(Constant.Score.SCOMPLETEFLAG, 2);
			} else { 
				params.put(Constant.Score.SCOMPLETEFLAG, 3);
				HashMap<String, Object> user1 = new HashMap<>();
				HashMap<String, Object> user2 = new HashMap<>();
				float user1StarPoint = starPoint;
				float user2StarPoint = (float) scoreData.get(Constant.Score.USER2STARPOINT);
				int user1DoCount = dao.selectDoCountByUserIndex(user1Index) + 1;
				int user2DoCount = dao.selectDoCountByUserIndex(user2Index) + 1;
				user1.put(Constant.User.USERINDEX, user1Index);
				user2.put(Constant.User.USERINDEX, user2Index);
				user1.put(Constant.User.STARPOINT,
						(dao.selectStarPointByUserIndex(user1Index) + user1StarPoint) / user1DoCount);
				user2.put(Constant.User.STARPOINT,
						(dao.selectStarPointByUserIndex(user2Index) + user2StarPoint) / user2DoCount);
				user1.put(Constant.User.DOCOUNT, user1DoCount);
				user2.put(Constant.User.DOCOUNT, user2DoCount);
				System.out.println(user1);
				System.out.println(user2);
				dao.updateUser(user1);
				dao.updateUser(user2);
				
				if(dao.countByBoardNo(boardNo) == 1) {
					HashMap<String, Object> tmp = dao.selectBoardOne(boardNo);
					tmp.put(Constant.Board.BCOMPLETEFLAG, 1);
					dao.updateBoard(tmp);
				}
			}
		}
		System.out.println(params);
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
	public int selectpolice(int boardNo, int userIndex) {
		// TODO Auto-generated method stub
		HashMap<String, Object> params = new HashMap<>();
		params.put(Constant.Police.BOARDNO, boardNo);
		params.put(Constant.Police.USERINDEX, userIndex);
		HashMap<String, Object> result = dao.selectPolice(params);
		if (result == null) {
			dao.insertPolice(params);
			return 1; // 신고없음. 신고접수 가능
		} else
			return 2; // 신고데이터 있음. 신고접수 불가능
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
		// System.out.println( dao.selectBoardOne(boardNo));
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

	@Override
	public int BookmarkCheck(HashMap<String, Object> params) {
		// TODO Auto-generated method stub
		List<HashMap<String, Object>> list = dao.selectBookMark(params);
		if (list.size() != 0)
			return 2; // 즐겨찾기 한사람이 있음.
		else
			return 1; // 줄겨찾기 한사람이 없음. 즐겨찾기 가능!!
	}

	@Override
	public boolean isMyBoard(HashMap<String, Object> params) {
		// TODO Auto-generated method stub
		if (dao.isMyBoard(params) == null)
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

		// apply+board 내가 신청한거
		List<HashMap<String, Object>> myapply = dao.selectBoardApply(params);
		for (HashMap<String, Object> p : myapply) {
			String nickname = dao.selectNicknname((int) p.get("userIndex"));
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

		// board에서 내가 쓴거
		List<HashMap<String, Object>> myboard = dao.selectBoardByUserIndex(params);

		//apply+board 내가 신청한거		
		String nickname =dao.selectNicknname(userIndex);
		 
		HashMap<String, Object> result = new HashMap<>();
		for ( HashMap<String, Object> mylist : myboard ){
			int totalapplycount = dao.applyCount((int)(mylist.get("boardNo")));	
			mylist.put("totalapplycount", totalapplycount);
		}
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

	public int getUserIndexById(String id) {
		System.out.println(id);
		return dao.selectUserIndexById(id);
	}

	@Override
	public HashMap<String, Object> mycomplete(int userIndex, int page) {
		// TODO Auto-generated method stub
		// 시작페이지와 끝페이지 계산
		int start = (page - 1) / 10 * 10 + 1;
		int end = ((page - 1) / 10 + 1) * 10;
		// 첫페이지와 마지막 페이지 계산
		int first = 1;
		int last = (dao.getCountBoardComplete(userIndex) - 1) / 10 + 1;
		end = last < end ? last : end;
		// 해당페이지의 게시물을 쿼리 하기 위한 skip과 count
		int skip = (page - 1) * 10;
		int count = 10;

		HashMap<String, Object> params = new HashMap<>();
		params.put("userIndex", userIndex);
		params.put("page", page);
		params.put("skip", skip);
		params.put("count", count);

		int mode = 0;
		if (isMyBoard(params))
			mode = 0;
		else
			mode = 1;

		params.put("mode", mode);

		List<HashMap<String, Object>> myboard = dao.selectBoardComplete(params);

		String nickname = dao.selectNicknname(userIndex);

		HashMap<String, Object> result = new HashMap<>();
		result.put("start", start);
		result.put("first", first);
		result.put("end", end);
		result.put("last", last);
		result.put("current", page);
		result.put("completeList", myboard);
		result.put("nickname", nickname);

		return result;
	}

	@Override
	public int removeBookmark(int boardNo) {
		// TODO Auto-generated method stub
		HashMap<String, Object> params = new HashMap<>();
		params.put("boardNo", boardNo);
		return dao.deleteBookMark(params);

	}

	@Override
	public int deleteApplyUser(int user1Index, int user2Index, int boardNo) {
		// TODO Auto-generated method stub
		// score 지우기
		HashMap<String, Object> deleteScore = new HashMap<>();
		deleteScore.put("user2Index", user2Index);
		deleteScore.put("boardNo", boardNo);
		dao.deleteScore(deleteScore);
		System.out.println("delete Score OK!");

		// score table에 해당 보드넘버가 없으면 boardFlag 0
		// HashMap<String, Object> selectScore =
		// dao.selectScoreByBoardNo(boardNo);
		// System.out.println("deleteApplyUSer select Score " + selectScore);
		//
		// if(selectScore == null){
		// HashMap<String, Object> flag = dao.selectBoardOne(boardNo);
		// flag.put("bCompleteFlag", 0);
		// dao.updateBoard(flag);
		// System.out.println(flag);
		// }

		// apply테이블 컴플리트 플래그 2. 간택완료로 바꿈
		HashMap<String, Object> tmp = new HashMap<>();
		tmp.put("boardNo", boardNo);
		tmp.put("userIndex", user2Index); // 신청자
		System.out.println("temp" + tmp);
		HashMap<String, Object> applyD = dao.selectApply(tmp);
		System.out.println("Befor aaplyD" + applyD);
		applyD.put("aCompleteFlag", 1);
		System.out.println("After aaplyD" + applyD);
		dao.updateApply(applyD);
		System.out.println("!!!!?");

		return 0;

	}

	// 웹사이트 로그인 체크
	@Override
	public int loginCategoryCheck(String id) {
		// TODO Auto-generated method stub
		int loginCategoryNum = dao.selectLogincategory(id);
		System.out.println("로그인카테고리 : " + loginCategoryNum);
		return loginCategoryNum;
	}
	

@Override
	public int findPwQ(String id) {
		int question = dao.selectFindPwQ(id);
		return question;
	}

	@Override
	public int findPwA(String id, String answer) {
		String check = dao.selectFindPwA(id);
		if (check.equals(answer)) {
			return 0; // 비밀번호 같음
		} else {
			return 1;
		}
	}

	@Override
	public int updatePw(String id, String password) {
		// TODO Auto-generated method stub
		HashMap<String, Object> params = new HashMap<>();
		params.put("password", password);
		params.put("userId", id);
		return dao.updatePw(params);
	}

}
