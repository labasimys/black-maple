package order;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class OrderDAO {
	private Connection conn;
	private ResultSet rs;
	
	public OrderDAO() {
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
		String SQL = "select orderID from morder order by orderID desc";
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
	
	public int write(String userID, int productID, String userAddress, String userPhone, String orderImg, String orderName, int amount, int sum, String userName) {
		String SQL = "insert into morder values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, userID);
			pstmt.setInt(3, productID);
			pstmt.setString(4, userAddress);
			pstmt.setString(5, userPhone);
			pstmt.setInt(6, 1);
			pstmt.setString(7, orderImg);
			pstmt.setString(8, orderName);
			pstmt.setInt(9, amount);
			pstmt.setInt(10, sum);
			pstmt.setString(11, userName);
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //데베 오류
	}
	
	public ArrayList<Order> getOrderList(){
		String SQL = "select * from morder where orderValidity = 1";
		ArrayList<Order> list = new ArrayList<Order>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Order o = new Order();
				o.setOrderID(rs.getInt(1));
				o.setUserID(rs.getString(2));
				o.setProductID(rs.getInt(3));
				o.setUserAddress(rs.getString(4));
				o.setUserPhone(rs.getString(5));
				o.setOrderValidity(rs.getInt(6));
				o.setOrderImg(rs.getString(7));
				o.setOrderName(rs.getString(8));
				o.setAmount(rs.getInt(9));
				o.setSum(rs.getInt(10));
				o.setUserName(rs.getString(11));
				list.add(o);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public ArrayList<Order> getList(String userID){
		String SQL = "select * from morder where userID = ? and orderValidity = 1";
		ArrayList<Order> list = new ArrayList<Order>();
		try {
			Order order = new Order();
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Order o = new Order();
				o.setOrderID(rs.getInt(1));
				o.setUserID(rs.getString(2));
				o.setProductID(rs.getInt(3));
				o.setUserAddress(rs.getString(4));
				o.setUserPhone(rs.getString(5));
				o.setOrderValidity(rs.getInt(6));
				o.setOrderImg(rs.getString(7));
				o.setOrderName(rs.getString(8));
				o.setAmount(rs.getInt(9));
				o.setSum(rs.getInt(10));
				o.setUserName(rs.getString(11));
				list.add(o);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public int delete(int orderID) {
		String SQL = "update morder set orderValidity = 0 where orderID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, orderID);
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
}
