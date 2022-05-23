package com.square.member.model.service;

import static com.square.common.JDBCTemplate.close;
import static com.square.common.JDBCTemplate.commit;
import static com.square.common.JDBCTemplate.getConnection;
import static com.square.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

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
	
	
	public Member updateMember( String userId, String userEmail, String userPwd) {

		
		 //update Statement
			
			
			Connection conn = getConnection();
			int result = new MemberDao().updateMember(conn, userEmail,  userPwd, userId);
			
			Member updateMem = null;
			if(result > 0) {
				commit(conn);
				updateMem = new MemberDao().selectMember(conn, userId);
			
			} else {
				rollback(conn);
			}
				close(conn);
				
				return updateMem;
		}

	
}
