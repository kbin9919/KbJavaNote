package com.kb.app.admin.vo;

public class AdminVo {
	private String email;
	private String password;
	private String nick;
	private String enrollDate;
	private String modifyDate;
	private String introduction;
	private String followers;
	private String following;
	private String warnigPoint;
	private String authority;
	
	public AdminVo() {
		super();
	}
	
	public AdminVo(String email, String password, String nick, String enrollDate, String modifyDate,
			String introduction, String followers, String following, String warnigPoint, String authority) {
		super();
		this.email = email;
		this.password = password;
		this.nick = nick;
		this.enrollDate = enrollDate;
		this.modifyDate = modifyDate;
		this.introduction = introduction;
		this.followers = followers;
		this.following = following;
		this.warnigPoint = warnigPoint;
		this.authority = authority;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getNick() {
		return nick;
	}

	public void setNick(String nick) {
		this.nick = nick;
	}

	public String getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(String enrollDate) {
		this.enrollDate = enrollDate;
	}

	public String getModifyDate() {
		return modifyDate;
	}

	public void setModifyDate(String modifyDate) {
		this.modifyDate = modifyDate;
	}

	public String getIntroduction() {
		return introduction;
	}

	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}

	public String getFollowers() {
		return followers;
	}

	public void setFollowers(String followers) {
		this.followers = followers;
	}

	public String getFollowing() {
		return following;
	}

	public void setFollowing(String following) {
		this.following = following;
	}

	public String getWarnigPoint() {
		return warnigPoint;
	}

	public void setWarnigPoint(String warnigPoint) {
		this.warnigPoint = warnigPoint;
	}

	public String getAuthority() {
		return authority;
	}

	public void setAuthority(String authority) {
		this.authority = authority;
	}

	@Override
	public String toString() {
		return "AdminVo [email=" + email + ", password=" + password + ", nick=" + nick + ", enrollDate=" + enrollDate
				+ ", modifyDate=" + modifyDate + ", introduction=" + introduction + ", followers=" + followers
				+ ", following=" + following + ", warnigPoint=" + warnigPoint + ", authority=" + authority + "]";
	}
	
	
}
