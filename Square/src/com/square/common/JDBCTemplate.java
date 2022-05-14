package com.square.common;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

public class JDBCTemplate {
	
	//method to return connection after create connection object(access db)
	public static Connection getConnection() {
		
		// key value from driver.properties
		Properties prop = new Properties(); // Map collection(key-value)
		
		// physical path of a file ( driver.properties )
		String fileName = JDBCTemplate.class.getResource("/sql/driver/driver.properties").getPath();
		//c:\java-workspaces\square\webContent\WEB-INF\classes\sql\driver\driver.properties
		
		try {
		prop.load(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		//decalare Connection
		Connection conn = null;
		
		try {
			//register jdbc driver
			Class.forName(prop.getProperty("driver"));
			// create connection object connected db
			conn = DriverManager.getConnection(prop.getProperty("url"), 
												prop.getProperty("username"), 
												prop.getProperty("password"));
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return conn;
		
	}
	
	// method to commit using returned Connection 
	public static void commit(Connection conn) {
		try {
			if(conn != null && !conn.isClosed()) {
				conn.commit();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	
	// method to rollback using returned Connection
	
	public static void rollback(Connection conn) {
		try {
			if(conn != null && !conn.isClosed()) {
				conn.rollback();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	
	// method to return returned Connection
	public static void close(Connection conn) {
		try {
			if(conn != null && !conn.isClosed()) {
				conn.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	

	
	// method to return returned Statement
	public static void close(Statement stmt) {
		try {
			if(stmt != null & !stmt.isClosed()) {
				stmt.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
	// method to return returned ResultSet 
	public static void close(ResultSet rset) {
		try {
			if(rset != null & !rset.isClosed()) {
				rset.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
	
}
