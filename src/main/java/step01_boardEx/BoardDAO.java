package step01_boardEx;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

// D(Data) A(Access) O(Object) : 데이터(DB) 접근 객체
public class BoardDAO {
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	
	//데이터베이스 연결 메서드
	public void getConnection() {
		
		try {
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/MVC1_PRACTICE?serverTimezone=Asia/Seoul", "root", "1234");
		} 	
		catch (Exception e) {
		
			e.printStackTrace();
		}
	}
	
	
	//데이터베이스 연결 자원 해제 메서드
	public void getClose() {
		
		if(rs != null) 		try { rs.close(); } 	catch (SQLException e) { e.printStackTrace(); }
		if(pstmt != null) 	try { pstmt.close(); } 	catch (SQLException e) { e.printStackTrace(); }
		if(conn != null) 	try { conn.close(); } 	catch (SQLException e) { e.printStackTrace(); }
	}
	
	
	//게시글 작성 DAO
	public void insertBoard() {
		
		try {		
			getConnection();
			
			String sql = "INSERT INTO BOARD(WRITER, EMAIL, SUBJECT, PASSWORD, CONTENT, READ_CNT, ENROLL_DT)";
			sql += "VALUES(?, ?, ?, ?, ?, 0, ENROLL_DT)";
			pstmt = conn.prepareStatement(sql);
			
			conn.prepareStatement(null);
		}
		catch(Exception e) {			
			e.printStackTrace();
		}
		finally {		
			getClose();
		}
	}
}
