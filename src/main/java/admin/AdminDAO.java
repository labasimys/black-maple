package admin;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class AdminDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public AdminDAO() {
		try {
			String dbURL = "jdbc:oracle:thin:@localhost:1521:xe";
			String dbID = "c##user001";
			String dbPassword = "1234";
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public int login(String adID, String adPassword) {
		String SQL = "SELECT adPassword FROM admin WHERE adID = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, adID);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				if(rs.getString(1).equals(adPassword))
					return 1; //로그인 성공
				else
					return 0; //비밀번호 틀림
			}
			return -1; //아이디 없음
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2; //데이터베이스 오류
	}
}
