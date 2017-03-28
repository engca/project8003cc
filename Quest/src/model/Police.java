package model;

public class Police {
	private int boardNo;
	private String user_index;
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public String getUser_index() {
		return user_index;
	}
	public void setUser_index(String user_index) {
		this.user_index = user_index;
	}
	@Override
	public String toString() {
		return "Police [boardNo=" + boardNo + ", user_index=" + user_index + "]";
	}

	

}
