package model;

public class Apply {

	private int boardNo;
	private int rewardNo;
	private String contactAnswer;
	private String content;
	private String user_index;
	private int a_complete_flag;
	
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public int getRewardNo() {
		return rewardNo;
	}
	public void setRewardNo(int rewardNo) {
		this.rewardNo = rewardNo;
	}
	public String getContactAnswer() {
		return contactAnswer;
	}
	public void setContactAnswer(String contactAnswer) {
		this.contactAnswer = contactAnswer;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getUser_index() {
		return user_index;
	}
	public void setUser_index(String user_index) {
		this.user_index = user_index;
	}
	public int getA_complete_flag() {
		return a_complete_flag;
	}
	public void setA_complete_flag(int a_complete_flag) {
		this.a_complete_flag = a_complete_flag;
	}
	@Override
	public String toString() {
		return "Apply [boardNo:" + boardNo + ", rewardNo:" + rewardNo + ", contactAnswer:" + contactAnswer
				+ ", content:" + content + ", user_index:" + user_index + ", a_complete_flag:" + a_complete_flag + "]";
	}

	
}
