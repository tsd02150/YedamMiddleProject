package com.yedam.common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

// Connection 객체 반환
public class DAO{
	
	public static Connection getConnenct() {
		Connection conn = null;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		try {
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "hr", "hr");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return conn;
	}
}
