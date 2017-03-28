package model;

public class User {

	private int user_index;
	private String user_id;
	private String password;
	private String nickname;
	private float star_point;
	private int do_count;
	
	
	public int getUser_index() {
		return user_index;
	}
	public void setUser_index(int user_index) {
		this.user_index = user_index;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public float getStar_point() {
		return star_point;
	}
	public void setStar_point(float star_point) {
		this.star_point = star_point;
	}
	public int getDo_count() {
		return do_count;
	}
	public void setDo_count(int do_count) {
		this.do_count = do_count;
	}
	@Override
	public String toString() {
		return "User [user_index=" + user_index + ", user_id=" + user_id + ", password=" + password + ", star_point="
				+ star_point + ", do_count=" + do_count + "]";
	}

	
	
	
}
