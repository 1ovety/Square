package com.square.mainboard.model.dao;

import static com.square.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.square.common.model.vo.PageInfo;
import com.square.mainboard.model.vo.Attachment;
import com.square.mainboard.model.vo.Board;
import com.square.mainboard.model.vo.Category;

public class BoardDao {

	private Properties prop = new Properties();
	 
	public BoardDao() {
		try {
			prop.loadFromXML(new FileInputStream(BoardDao.class.getResource("/sql/mainboard/mainboard-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public int selectListCount(Connection conn) {
		
		//select statement => ResultSet Object (1row)
		int listCount = 0;
		PreparedStatement pstmt =null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();

			if(rset.next()) {
				listCount = rset.getInt("count");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return listCount;
	}
	
	public ArrayList<Board> selectList(Connection conn, PageInfo pi){
		
		// select statement = ResutSet (multiRow)
		
		ArrayList<Board> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() -1 ) * pi.getBoardLimit();
			int endRow = startRow + pi.getBoardLimit() -1 ;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				list.add(new Board(rset.getInt("board_no"),
									rset.getString("category_name"),
									rset.getString("board_title"),
									rset.getString("user_id"),
									rset.getInt("count"),
									rset.getDate("create_date")));
									
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
		
		
	}
	
	public ArrayList<Category> selectCategoryList(Connection conn){
		
		// select Statement - > ResultSet (multiRow)
		
		ArrayList<Category> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectCategoryList");
			
		try {
			pstmt = conn.prepareStatement(sql);
			rset= pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Category(rset.getInt("category_no"),
				rset.getString("category_name")));
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
		
	}
	
	public int insertBoard(Connection conn, Board b) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertBoard");
	
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(b.getCategoryNo()));
			pstmt.setString(2, b.getBoardTitle());
			pstmt.setString(3, b.getBoardContent());
			pstmt.setInt(4, Integer.parseInt(b.getBoardWriter()));
		
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			
			close(pstmt);
		
		}
		
		return result;
	
	}
	
	
	public int insertAttachment(Connection conn, Attachment at) {
		
		// insert statement 
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, at.getOriginName());
			pstmt.setString(2, at.getChangeName());
			pstmt.setString(3, at.getFilePath());;
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
	
		return result;
		
	}
	
	public int increaseCount(Connection conn, int boardNo) {
		//update statement 
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("increaseCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public Board selectBoard(Connection conn, int boardNo) {
		//select statement = > Resultset (1row)
		Board b = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectBoard");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				b = new Board(rset.getInt("board_no"),
							  rset.getString("category_name"),
							  rset.getString("board_title"),
							  rset.getString("board_content"),
							  rset.getString("user_id"),
							  rset.getDate("create_date"));
						
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		
		} finally { 
			close(rset);
			close(pstmt);
		}
		
		return b;
	}
	
	public Attachment selectAttachment(Connection conn, int boardNo) {
		//select statement = > ResultSet(1Row)
		Attachment at = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				at = new Attachment();
				at.setFileNo(rset.getInt("file_no"));
				at.setOriginName(rset.getString("origin_name"));
				at.setChangeName(rset.getString("change_name"));
				at.setFilePath(rset.getString("file_path"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return at;
		
		
	}
	
	
	
	
}
