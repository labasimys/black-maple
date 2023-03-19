package cart;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class CartDAO {
	private Connection conn;
	private ResultSet rs;
	
	public CartDAO() {
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
	
	public int getNext() {
		String SQL = "select cartID from cart order by cartID desc";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1) + 1;
			}
			return 1; //첫번째 상품
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //데베 오류
	}
	
	public int write(String userID, int productID, String cartImg, String cartName, int amount, int sum) {
		String SQL = "insert into cart values(?, ?, ?, ?, ?, ?, ?, ?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, userID);
			pstmt.setInt(3, productID);
			pstmt.setInt(4, 1);
			pstmt.setString(5, cartImg);
			pstmt.setString(6, cartName);
			pstmt.setInt(7, amount);
			pstmt.setInt(8, sum);
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //데베 오류
	}
	
	public ArrayList<Cart> getList(String userID){
		String SQL = "select * from cart where userID = ? and cartValidity = 1";
		ArrayList<Cart> list = new ArrayList<Cart>();
		try {
			Cart cart = new Cart();
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Cart c = new Cart();
				c.setCartID(rs.getInt(1));
				c.setUserID(rs.getString(2));
				c.setProductID(rs.getInt(3));
				c.setCartValidity(rs.getInt(4));
				c.setCartImg(rs.getString(5));
				c.setCartName(rs.getString(6));
				c.setAmount(rs.getInt(7));
				c.setSum(rs.getInt(8));
				list.add(c);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public int delete(int cartID) {
		String SQL = "update cart set cartValidity = 0 where cartID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, cartID);
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public ArrayList<Cart> orderList(String userID){
		String SQL = "select * from cart where userID = ? and cartValidity = 1";
		ArrayList<Cart> list = new ArrayList<Cart>();
		try {
			Cart cart = new Cart();
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Cart c = new Cart();
				c.setCartID(rs.getInt(1));
				c.setUserID(rs.getString(2));
				c.setProductID(rs.getInt(3));
				c.setCartValidity(rs.getInt(4));
				c.setCartImg(rs.getString(5));
				c.setCartName(rs.getString(6));
				c.setAmount(rs.getInt(7));
				c.setSum(rs.getInt(8));
				list.add(c);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}
