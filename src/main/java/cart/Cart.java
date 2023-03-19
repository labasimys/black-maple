package cart;

public class Cart {
	private int cartID;
	private String userID;
	private int productID;
	private int cartValidity;
	private String cartImg;
	private String cartName;
	private int amount;
	private int sum;
	
	public String getCartImg() {
		return cartImg;
	}
	public void setCartImg(String cartImg) {
		this.cartImg = cartImg;
	}
	public String getCartName() {
		return cartName;
	}
	public void setCartName(String cartName) {
		this.cartName = cartName;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public int getSum() {
		return sum;
	}
	public void setSum(int sum) {
		this.sum = sum;
	}
	public int getProductID() {
		return productID;
	}
	public void setProductID(int productID) {
		this.productID = productID;
	}
	public int getCartID() {
		return cartID;
	}
	public void setCartID(int cartID) {
		this.cartID = cartID;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public int getCartValidity() {
		return cartValidity;
	}
	public void setCartValidity(int cartValidity) {
		this.cartValidity = cartValidity;
	}
}
