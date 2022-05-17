package com.square.member.model.service;

import java.sql.Connection;

import com.square.common.JDBCTemplate;
import com.square.member.model.dao.MemberDao;
import com.square.member.model.vo.Member;

public class MemberService {

	/**
	 * request login service
	 * @param userEmail a email value when user Enter user's email
	 * @param userPwd a password value when user enter user's password
	 */
	public Member loginMember(String userEmail, String userPwd) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		Member m = new MemberDao().loginMember(conn, userEmail, userPwd);
		
		JDBCTemplate.close(conn);
		
		return m;
		
	}
	
	
}
