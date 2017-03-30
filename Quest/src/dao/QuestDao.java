package dao;

import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class QuestDao implements daoInterface{
	private SqlSessionFactory sqlSessionFactory;
	
	public QuestDao(){
		InputStream is = null;
		try {
			is = Resources.getResourceAsStream("configuration.xml");
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(is);
		} catch (Exception e) {
			// TODO: handle exception
		}
		finally{
				try {
					if(is!=null)
					is.close();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		}
	}
	

	@Override
	public int insertBoard(HashMap<String, Object> params) {
		// TODO Auto-generated method stub
		SqlSession s = sqlSessionFactory.openSession();
		try{
			return s.getMapper(daoInterface.class).insertBoard(params);
		}
		finally{
			s.close();
		}
	}

	@Override
	public int updateBoard(HashMap<String, Object> params) {
		// TODO Auto-generated method stub
		SqlSession s = sqlSessionFactory.openSession();
		try{
			return s.getMapper(daoInterface.class).updateBoard(params);
		}
		finally{
			s.close();
		}
	}

	@Override
	public int deleteBoard(int boradNo) {
		// TODO Auto-generated method stub
		SqlSession s = sqlSessionFactory.openSession();
		try{
			return s.getMapper(daoInterface.class).deleteBoard(boradNo);
		}
		finally{
			s.close();
		}
	}

	@Override
	public List<HashMap<String, Object>> selectBoardAll() {
		// TODO Auto-generated method stub
		SqlSession s = sqlSessionFactory.openSession();
		try{
			return s.getMapper(daoInterface.class).selectBoardAll();
		}
		finally{
			s.close();
		}
	}

	@Override
	public HashMap<String, Object> selectBoardOne(int boardNo) {
		// TODO Auto-generated method stub
		SqlSession s = sqlSessionFactory.openSession();
		try{
			return s.getMapper(daoInterface.class).selectBoardOne(boardNo);
		}
		finally{
			s.close();
		}
	}

	@Override
	public int insertUser(HashMap<String, Object> params) {
		// TODO Auto-generated method stub
		SqlSession s = sqlSessionFactory.openSession();
		try{
			return s.getMapper(daoInterface.class).insertUser(params);
		}
		finally{
			s.close();
		}
	}

	@Override
	public int updateUser(HashMap<String, Object> params) {
		// TODO Auto-generated method stub
		SqlSession s = sqlSessionFactory.openSession();
		try{
			return s.getMapper(daoInterface.class).updateUser(params);
		}
		finally{
			s.close();
		}
	}

	@Override
	public int deleteUser(int userIndex) {
		// TODO Auto-generated method stub
		SqlSession s = sqlSessionFactory.openSession();
		try{
			return s.getMapper(daoInterface.class).deleteUser(userIndex);
		}
		finally{
			s.close();
		}
	}

	@Override
	public HashMap<String, Object> selectUser(int userIndex) {
		// TODO Auto-generated method stub
		SqlSession s = sqlSessionFactory.openSession();
		try{
			return s.getMapper(daoInterface.class).selectUser(userIndex);
		}
		finally{
			s.close();
		}
	}

	@Override
	public int insertComment(HashMap<String, Object> params) {
		// TODO Auto-generated method stub
		SqlSession s = sqlSessionFactory.openSession();
		try{
			return s.getMapper(daoInterface.class).insertComment(params);
		}
		finally{
			s.close();
		}
	}

	@Override
	public int updateComment(HashMap<String, Object> params) {
		// TODO Auto-generated method stub
		SqlSession s = sqlSessionFactory.openSession();
		try{
			return s.getMapper(daoInterface.class).updateComment(params);
		}
		finally{
			s.close();
		}
	}

	@Override
	public int deleteComment(HashMap<String, Object> params) {
		// TODO Auto-generated method stub
		SqlSession s = sqlSessionFactory.openSession();
		try{
			return s.getMapper(daoInterface.class).deleteComment(params);
		}
		finally{
			s.close();
		}
	}

	@Override
	public List<HashMap<String, Object>> selectAllCommentByBoardNo(int boardNo) {
		// TODO Auto-generated method stub
		SqlSession s = sqlSessionFactory.openSession();
		try{
			return s.getMapper(daoInterface.class).selectAllCommentByBoardNo(boardNo);
		}
		finally{
			s.close();
		}
	}

	@Override
	public int insertApply(HashMap<String, Object> params) {
		// TODO Auto-generated method stub
		SqlSession s = sqlSessionFactory.openSession();
		try{
			return s.getMapper(daoInterface.class).insertApply(params);
		}
		finally{
			s.close();
		}
	}

	@Override
	public int updateApply(HashMap<String, Object> params) {
		// TODO Auto-generated method stub
		SqlSession s = sqlSessionFactory.openSession();
		try{
			return s.getMapper(daoInterface.class).updateApply(params);
		}
		finally{
			s.close();
		}
	}

	@Override
	public List<HashMap<String, Object>> selectAllApplyByBoardNo(int boardNo) {
		// TODO Auto-generated method stub
		SqlSession s = sqlSessionFactory.openSession();
		try{
			return s.getMapper(daoInterface.class).selectAllApplyByBoardNo(boardNo);
		}
		finally{
			s.close();
		}
	}

	@Override
	public List<HashMap<String, Object>> selectAllApplyByUserIndex(int userIndex) {
		// TODO Auto-generated method stub
		SqlSession s = sqlSessionFactory.openSession();
		try{
			return s.getMapper(daoInterface.class).selectAllApplyByUserIndex(userIndex);
		}
		finally{
			s.close();
		}
	}

	@Override
	public int insertScore(HashMap<String, Object> params) {
		// TODO Auto-generated method stub
		SqlSession s = sqlSessionFactory.openSession();
		try{
			return s.getMapper(daoInterface.class).insertScore(params);
		}
		finally{
			s.close();
		}
	}

	@Override
	public int updateScore(HashMap<String, Object> params) {
		// TODO Auto-generated method stub
		SqlSession s = sqlSessionFactory.openSession();
		try{
			return s.getMapper(daoInterface.class).updateScore(params);
		}
		finally{
			s.close();
		}
	}

	@Override
	public HashMap<String, Object> selectScoreByBoardNo(int boardNo) {
		// TODO Auto-generated method stub
		SqlSession s = sqlSessionFactory.openSession();
		try{
			return s.getMapper(daoInterface.class).selectScoreByBoardNo(boardNo);
		}
		finally{
			s.close();
		}
	}

	@Override
	public int insertBookMark(HashMap<String, Object> params) {
		// TODO Auto-generated method stub
		SqlSession s = sqlSessionFactory.openSession();
		try{
			return s.getMapper(daoInterface.class).insertBookMark(params);
		}
		finally{
			s.close();
		}
	}

	@Override
	public int deleteBookMark(HashMap<String, Object> params) {
		// TODO Auto-generated method stub
		SqlSession s = sqlSessionFactory.openSession();
		try{
			return s.getMapper(daoInterface.class).deleteBookMark(params);
		}
		finally{
			s.close();
		}
	}

	@Override
	public List<HashMap<String, Object>> selectBookMark(HashMap<String, Object> params) {
		// TODO Auto-generated method stub
		SqlSession s = sqlSessionFactory.openSession();
		try{
			return s.getMapper(daoInterface.class).selectBookMark(params);
		}
		finally{
			s.close();
		}
	}

	@Override
	public int insertPolice(HashMap<String, Object> params) {
		// TODO Auto-generated method stub
		SqlSession s = sqlSessionFactory.openSession();
		try{
			return s.getMapper(daoInterface.class).insertPolice(params);
		}
		finally{
			s.close();
		}
	}

	@Override
	public int selectPolice(HashMap<String, Object> params) {
		// TODO Auto-generated method stub
		SqlSession s = sqlSessionFactory.openSession();
		try{
			return s.getMapper(daoInterface.class).selectPolice(params);
		}
		finally{
			s.close();
		}
	}

	@Override
	public String selectAddress(int addrNo) {
		// TODO Auto-generated method stub
		SqlSession s = sqlSessionFactory.openSession();
		try{
			return s.getMapper(daoInterface.class).selectAddress(addrNo);
		}
		finally{
			s.close();
		}
	}

}
