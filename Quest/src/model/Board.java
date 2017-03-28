package model;

import java.util.Date;

public class Board {
	private int board_flag;
	private int b_complete_flag;
	private int boardNo;
	private int user_index;
	private Date date;
	private int police_count;
	private int read_count;
	private String title;
	private int addr1No;
	private int addr2No;
	private String reward1;
	private String reward2;
	private String reward3;
	private int people;
	private int contactNo;
	private int st_time;
	private int play_time;
	private String content;
	public int getBoard_flag() {
		return board_flag;
	}
	public void setBoard_flag(int board_flag) {
		this.board_flag = board_flag;
	}
	public int getB_complete_flag() {
		return b_complete_flag;
	}
	public void setB_complete_flag(int b_complete_flag) {
		this.b_complete_flag = b_complete_flag;
	}
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
	public int getPolice_count() {
		return police_count;
	}
	public void setPolice_count(int police_count) {
		this.police_count = police_count;
	}
	public int getRead_count() {
		return read_count;
	}
	public void setRead_count(int read_count) {
		this.read_count = read_count;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getAddr1No() {
		return addr1No;
	}
	public void setAddr1No(int addr1No) {
		this.addr1No = addr1No;
	}
	public int getAddr2No() {
		return addr2No;
	}
	public void setAddr2No(int addr2No) {
		this.addr2No = addr2No;
	}
	public String getReward1() {
		return reward1;
	}
	public void setReward1(String reward1) {
		this.reward1 = reward1;
	}
	public String getReward2() {
		return reward2;
	}
	public void setReward2(String reward2) {
		this.reward2 = reward2;
	}
	public String getReward3() {
		return reward3;
	}
	public void setReward3(String reward3) {
		this.reward3 = reward3;
	}
	public int getPeople() {
		return people;
	}
	public void setPeople(int people) {
		this.people = people;
	}
	public int getContactNo() {
		return contactNo;
	}
	public void setContactNo(int contactNo) {
		this.contactNo = contactNo;
	}
	public int getSt_time() {
		return st_time;
	}
	public void setSt_time(int st_time) {
		this.st_time = st_time;
	}
	public int getPlay_time() {
		return play_time;
	}
	public void setPlay_time(int play_time) {
		this.play_time = play_time;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	@Override
	public String toString() {
		return "Board [board_flag=" + board_flag + ", b_complete_flag=" + b_complete_flag + ", boardNo=" + boardNo
				+ ", user_index=" + user_index + ", police_count=" + police_count + ", read_count=" + read_count
				+ ", title=" + title + ", addr1No=" + addr1No + ", addr2No=" + addr2No + ", reward1=" + reward1
				+ ", reward2=" + reward2 + ", reward3=" + reward3 + ", people=" + people + ", contactNo=" + contactNo
				+ ", st_time=" + st_time + ", play_time=" + play_time + ", content=" + content + "]";
	}

	

}
