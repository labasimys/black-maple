<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="user.UserDAO" %>
<%@ page import="cart.CartDAO" %>
<%@ page import="product.ProductDAO" %>
<%@ page import="java.io.PrintWriter" %>
<<jsp:useBean id="user" class="user.User" scope="page"></jsp:useBean>
<<jsp:useBean id="product" class="product.Product" scope="page"></jsp:useBean>
<<jsp:setProperty property="userID" name="user"/>
<<jsp:setProperty property="userPassword" name="user"/>
<<jsp:useBean id="cart" class="cart.Cart" scope="page"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Black Maple</title>
</head>
<body>
	<%	
		String userID = null;
		if(session.getAttribute("userID") != null){
			userID = (String)session.getAttribute("userID");
		}
		if(userID == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인이 필요합니다.')");
			script.println("location.href = 'login.jsp'");
			script.println("</script>");
		}
		else{
			CartDAO cartDAO = new CartDAO();
			int result = cartDAO.delete(Integer.parseInt(request.getParameter("cartID")));
			if(result == -1){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('장바구니 삭제 실패')");
				script.println("history.back()");
				script.println("</script>");
			}
			else{
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("location.href = 'basket.jsp'");
				script.println("</script>");
			}
		}
	%>
</body>
</html>