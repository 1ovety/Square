package com.square.mainboard.model.service;

import static com.square.common.JDBCTemplate.close;
import static com.square.common.JDBCTemplate.commit;
import static com.square.common.JDBCTemplate.getConnection;
import static com.square.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.square.common.model.vo.PageInfo;
import com.square.mainboard.model.dao.BoardDao;
import com.square.mainboard.model.vo.Attachment;
import com.square.mainboard.model.vo.Board;
import com.square.mainboard.model.vo.Category;
import com.square.mainboard.model.vo.Reply;


public class BoardService {

	public int selectListCount() {
		
		Connection conn = getConnection();
		int listCount = new BoardDao().selectListCount(conn);
		
		close(conn);
		return listCount;
		
	}
	
	public ArrayList<Board> selectList(PageInfo pi){
		
		Connection conn = getConnection();
		ArrayList<Board> list = new BoardDao().selectList(conn, pi);
		close(conn);
		return list;
		
	}
	
	public ArrayList<Category> selectCategoryList(){
		
		Connection conn = getConnection();
		ArrayList<Category> list = new BoardDao().selectCategoryList(conn);
		close(conn);
		return list;
	}
	
	
	public int insertBoard(Board b, Attachment at) {
		
		Connection conn = getConnection();
		int result1 = new BoardDao().insertBoard(conn, b);
		
		int result2 = 1;
		if(at != null) {
			result2 = new BoardDao().insertAttachment(conn, at);  
		}
		//processed Transaction
		if(result1 > 0 && result2  > 0) {
			commit(conn);  
		}else {
			rollback(conn);
		}

		close(conn);
		
		// if one of these is 0, return 0
		return result1 * result2;
		
	}
	
	public int increaseCount(int boardNo) {
		Connection conn = getConnection();
		int result = new BoardDao().increaseCount(conn, boardNo);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}
	
	public Board selectBoard(int boardNo) {
		
		Connection conn = getConnection();
		Board b = new BoardDao().selectBoard(conn, boardNo);
		close(conn);
		return b;
		
	}
	
	public Attachment selectAttachment(int boardNo) {
		
		Connection conn = getConnection();
		Attachment at = new BoardDao().selectAttachment(conn, boardNo);
		close(conn);
		return at;
	}
	
	public int updateBoard(Board b, Attachment at) {
		Connection conn = getConnection();
		
		int result1 = new BoardDao().updateBoard(conn, b);
		
		int result2 = 1;
		if(at != null) { // if there is new attachment
			if(at.getFileNo() != 0) { // if there was already attachment => Attachment Update
				result2 = new BoardDao().updateAttachment(conn, at);
			}else { // no old attachment => Attachment Insert
				result2 = new BoardDao().insertNewAttachment(conn, at);
			}
		}
		
		if(result1 > 0 && result2 > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result1 * result2; // if there is error one of them should be 0, result 0
	}
	
	public ArrayList<Attachment> selectAttachmentList(int boardNo){
		Connection conn = getConnection();
		ArrayList<Attachment> list = new BoardDao().selectAttachmentList(conn, boardNo);
		close(conn);
		return list;
	}
	
	public ArrayList<Reply> selectReplyList(int boardNo){
		Connection conn = getConnection();
		ArrayList<Reply> list = new BoardDao().selectReplyList(conn, boardNo);
		close(conn);
		return list;
	}
	
	public int insertReply(Reply r) {
		Connection conn = getConnection();
		int result = new BoardDao().insertReply(conn,r);
		
		if(result > 0) {
			commit(conn);
			
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	
}
