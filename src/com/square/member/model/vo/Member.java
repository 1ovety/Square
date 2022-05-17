package com.square.member.model.vo;

import java.sql.Date;

public class Member {

	private int userNo;
	private String userEmail;
	private String userId;
	private String userPwd;
	private Date enrollDate;
	private Date modifyDate;
	private String status;
	


	public Member() {}


	public Member(int userNo, String userEmail, String userId, String userPwd, Date enrollDate, Date modifyDate,
			String status) {
		super();
		this.userNo = userNo;
		this.userEmail = userEmail;
		this.userId = userId;
		this.userPwd = userPwd;
		this.enrollDate = enrollDate;
		this.modifyDate = modifyDate;
		this.status = status;
	}


	public int getUserNo() {
		return userNo;
	}


	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}


	public String getUserEmail() {
		return userEmail;
	}


	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}


	public String getUserId() {
		return userId;
	}


	public void setUserId(String userId) {
		this.userId = userId;
	}


	public String getUserPwd() {
		return userPwd;
	}


	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}


	public Date getEnrollDate() {
		return enrollDate;
	}


	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}


	public Date getModifyDate() {
		return modifyDate;
	}


	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}


	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}


	@Override
	public String toString() {
		return "Member [userNo=" + userNo + ", userEmail=" + userEmail + ", userId=" + userId + ", userPwd=" + userPwd
				+ ", enrollDate=" + enrollDate + ", modifyDate=" + modifyDate + ", status=" + status + "]";
	}
	
		
}
