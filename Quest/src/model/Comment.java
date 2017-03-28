package model;

import java.util.Date;

public class Comment {
	private int boardNo;
	private int user_index;
	private Date date;
	private String content;
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public int getUser_index() {
		return user_index;
	}
	public void setUser_index(int user_index) {
		this.user_index = user_index;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	@Override
	public String toString() {
		return "Comment [boardNo=" + boardNo + ", user_index=" + user_index + ", date=" + date + ", content=" + content
				+ "]";
	}

	

}
