package model;

public class Score {
	private String user1_index;
	private String user2_index;
	private int boardNo;
	private int s_complete_flag;
	private float user1_starPoint;
	private float user2_starPoint;
	public String getUser1_index() {
		return user1_index;
	}
	public void setUser1_index(String user1_index) {
		this.user1_index = user1_index;
	}
	public String getUser2_index() {
		return user2_index;
	}
	public void setUser2_index(String user2_index) {
		this.user2_index = user2_index;
	}
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public int getS_complete_flag() {
		return s_complete_flag;
	}
	public void setS_complete_flag(int s_complete_flag) {
		this.s_complete_flag = s_complete_flag;
	}
	public float getUser1_starPoint() {
		return user1_starPoint;
	}
	public void setUser1_starPoint(float user1_starPoint) {
		this.user1_starPoint = user1_starPoint;
	}
	public float getUser2_starPoint() {
		return user2_starPoint;
	}
	public void setUser2_starPoint(float user2_starPoint) {
		this.user2_starPoint = user2_starPoint;
	}
	@Override
	public String toString() {
		return "Score [user1_index=" + user1_index + ", user2_index=" + user2_index + ", boardNo=" + boardNo
				+ ", s_complete_flag=" + s_complete_flag + ", user1_starPoint=" + user1_starPoint + ", user2_starPoint="
				+ user2_starPoint + "]";
	}

	
	
}
