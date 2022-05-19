package com.square.member.model.service;

import java.sql.Connection;

import static com.square.common.JDBCTemplate.*;
import com.square.member.model.dao.MemberDao;
import com.square.member.model.vo.Member;

public class MemberService {

	/**
	 * request login service
	 * @param userEmail a email value when user Enter user's email
	 * @param userPwd a password value when user enter user's password
	 */
	public Member loginMember(String userEmail, String userPwd) {
		
		Connection conn = getConnection();
		
		Member m = new MemberDao().loginMember(conn, userEmail, userPwd);
		
		close(conn);
		
		return m;
		
	}
	
	/**
	 * service to sign in
	 * @param m Member Object that value that user enter in memberEnrollForm
	 * @return  processed a number of rows
	 */
	public int insertMember(Member m) {
		
		Connection conn = getConnection();
		int result = new MemberDao().insertMember(conn, m);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	
	
}
