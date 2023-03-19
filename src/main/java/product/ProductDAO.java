package product;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class ProductDAO {
	private Connection conn;
	private ResultSet rs;
	
	public ProductDAO() {
		try {
			String dbURL = "jdbc:oracle:thin:@localhost:1521/xe";
			String dbID = "c##user001";
			String dbPassword = "1234";
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public String getImg(int productID) {
		String SQL = "select productImg from product where productID = ?";
		String img = null;
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, productID);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				img = rs.getString(7);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return img;
	}
	
	public String getDate() {
		String SQL = "select now()";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return ""; //데베 오류
	}
	
	public int getNext() {
		String SQL = "select productID from product order by productID desc";
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
	
	public int write(String productCate, String productName, String productDetail, int productPrice, String productThumbnail, String productImg) {
		String SQL = "insert into product(productID, productCate, productName, productDetail, productPrice, productThumbnail, productImg) values (?, ?, ?, ?, ?, ?, ?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, productCate);
			pstmt.setString(3, productName);
			pstmt.setString(4, productDetail);
			pstmt.setInt(5, productPrice);
			pstmt.setString(6, productThumbnail);
			pstmt.setString(7, productImg);
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //데베 오류
	}
	
	public ArrayList<Product> getList(){
		String SQL = "select * from product order by productID desc";
		ArrayList<Product> list = new ArrayList<Product>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Product product = new Product();
				product.setProductID(rs.getInt(1));
				product.setProductCate(rs.getString(2));
				product.setProductName(rs.getString(3));
				product.setProductDetail(rs.getString(4));
				product.setProductPrice(rs.getInt(5));
				product.setProductThumbnail(rs.getString(6));
				product.setProductImg(rs.getString(7));
				list.add(product);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public ArrayList<Product> getNewThingsList(int pageNumber){
		String SQL = "select * from (select a.*, rownum rnum from (select * from product order by productID desc)a) where rnum <= 8";
		ArrayList<Product> list = new ArrayList<Product>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Product product = new Product();
				product.setProductID(rs.getInt(1));
				product.setProductCate(rs.getString(2));
				product.setProductName(rs.getString(3));
				product.setProductDetail(rs.getString(4));
				product.setProductPrice(rs.getInt(5));
				product.setProductThumbnail(rs.getString(6));
				product.setProductImg(rs.getString(7));
				list.add(product);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public ArrayList<Product> getHairList(){
		String SQL = "select * from product where productCate = \'hair\' order by productID desc";
		ArrayList<Product> list = new ArrayList<Product>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Product product = new Product();
				product.setProductID(rs.getInt(1));
				product.setProductCate(rs.getString(2));
				product.setProductName(rs.getString(3));
				product.setProductDetail(rs.getString(4));
				product.setProductPrice(rs.getInt(5));
				product.setProductThumbnail(rs.getString(6));
				product.setProductImg(rs.getString(7));
				list.add(product);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public ArrayList<Product> getFaceList(){
		String SQL = "select * from product where productCate = \'face\' order by productID desc";
		ArrayList<Product> list = new ArrayList<Product>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Product product = new Product();
				product.setProductID(rs.getInt(1));
				product.setProductCate(rs.getString(2));
				product.setProductName(rs.getString(3));
				product.setProductDetail(rs.getString(4));
				product.setProductPrice(rs.getInt(5));
				product.setProductThumbnail(rs.getString(6));
				product.setProductImg(rs.getString(7));
				list.add(product);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public ArrayList<Product> getHatList(){
		String SQL = "select * from product where productCate = \'hat\' order by productID desc";
		ArrayList<Product> list = new ArrayList<Product>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Product product = new Product();
				product.setProductID(rs.getInt(1));
				product.setProductCate(rs.getString(2));
				product.setProductName(rs.getString(3));
				product.setProductDetail(rs.getString(4));
				product.setProductPrice(rs.getInt(5));
				product.setProductThumbnail(rs.getString(6));
				product.setProductImg(rs.getString(7));
				list.add(product);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public ArrayList<Product> getSuitList(){
		String SQL = "select * from product where productCate = \'suit\' order by productID desc";
		ArrayList<Product> list = new ArrayList<Product>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Product product = new Product();
				product.setProductID(rs.getInt(1));
				product.setProductCate(rs.getString(2));
				product.setProductName(rs.getString(3));
				product.setProductDetail(rs.getString(4));
				product.setProductPrice(rs.getInt(5));
				product.setProductThumbnail(rs.getString(6));
				product.setProductImg(rs.getString(7));
				list.add(product);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public ArrayList<Product> getCloakList(){
		String SQL = "select * from product where productCate = \'cloak\' order by productID desc";
		ArrayList<Product> list = new ArrayList<Product>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Product product = new Product();
				product.setProductID(rs.getInt(1));
				product.setProductCate(rs.getString(2));
				product.setProductName(rs.getString(3));
				product.setProductDetail(rs.getString(4));
				product.setProductPrice(rs.getInt(5));
				product.setProductThumbnail(rs.getString(6));
				product.setProductImg(rs.getString(7));
				list.add(product);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public ArrayList<Product> getWeaponList(){
		String SQL = "select * from product where productCate = \'weapon\' order by productID desc";
		ArrayList<Product> list = new ArrayList<Product>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Product product = new Product();
				product.setProductID(rs.getInt(1));
				product.setProductCate(rs.getString(2));
				product.setProductName(rs.getString(3));
				product.setProductDetail(rs.getString(4));
				product.setProductPrice(rs.getInt(5));
				product.setProductThumbnail(rs.getString(6));
				product.setProductImg(rs.getString(7));
				list.add(product);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public ArrayList<Product> getDecoList(){
		String SQL = "select * from product where productCate = \'deco\' order by productID desc";
		ArrayList<Product> list = new ArrayList<Product>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Product product = new Product();
				product.setProductID(rs.getInt(1));
				product.setProductCate(rs.getString(2));
				product.setProductName(rs.getString(3));
				product.setProductDetail(rs.getString(4));
				product.setProductPrice(rs.getInt(5));
				product.setProductThumbnail(rs.getString(6));
				product.setProductImg(rs.getString(7));
				list.add(product);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public ArrayList<Product> getShoesList(){
		String SQL = "select * from product where productCate = \'shoes\' order by productID desc";
		ArrayList<Product> list = new ArrayList<Product>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Product product = new Product();
				product.setProductID(rs.getInt(1));
				product.setProductCate(rs.getString(2));
				product.setProductName(rs.getString(3));
				product.setProductDetail(rs.getString(4));
				product.setProductPrice(rs.getInt(5));
				product.setProductThumbnail(rs.getString(6));
				product.setProductImg(rs.getString(7));
				list.add(product);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public boolean nextPage(int pageNumber) {
		String SQL = "select * from product where productID < ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 16);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public Product getProduct(int productID) {
		String SQL = "select * from product where productID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, productID);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				Product product = new Product();
				product.setProductID(rs.getInt(1));
				product.setProductCate(rs.getString(2));
				product.setProductName(rs.getString(3));
				product.setProductDetail(rs.getString(4));
				product.setProductPrice(rs.getInt(5));
				product.setProductThumbnail(rs.getString(6));
				product.setProductImg(rs.getString(7));
				return product;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}
