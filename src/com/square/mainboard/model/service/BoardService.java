package com.square.mainboard.model.service;

import static com.square.common.JDBCTemplate.close;
import static com.square.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.square.common.model.vo.PageInfo;
import com.square.mainboard.model.dao.BoardDao;
import com.square.mainboard.model.vo.Board;


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
}
