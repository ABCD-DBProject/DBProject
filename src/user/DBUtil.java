package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement; 
import java.sql.ResultSet; 
import java.util.ArrayList;
import java.sql.*;


public class DBUtil {

	public static Connection getMySQLConnection() {
		Connection conn = null;
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			String url = "jdbc:mysql://127.0.0.1:3306/dbproject?characterEncoding=UTF-8&serverTimezone=UTC"; 
			String user = "root"; 
			String password = "1234"; 
			conn = DriverManager.getConnection(url, user, password); 
		}catch(ClassNotFoundException e) {
			System.out.println("MySQL 드라이버가 없습니다.<br/>");
		/*}catch(MySQLDataException e){
		 * System.out.println("데이터베이스가 없습니다.<br/>"); 에러문 오류 일단 그냥 빼버림	
		*/	
		}catch(SQLException e) {
			System.out.println("사용자 계정 또는 비밀번호가 일치하지 않습니다.<br/>");
		}
		return conn;
	}
	public static void close(Connection conn) {
		try {if(conn != null) {conn.close();}}catch(Exception e) {e.printStackTrace();}
	}
	public static void close(Statement stmt) {
		try {if(stmt != null) {stmt.close();}}catch(Exception e) {e.printStackTrace();}
	}
	public static void close(PreparedStatement pstmt) {
		try {if(pstmt != null) {pstmt.close();}}catch(Exception e) {e.printStackTrace();}
	}
	public static void close(ResultSet rs) {
		try {if(rs != null) {rs.close();}}catch(Exception e) {e.printStackTrace();}
	}
}
