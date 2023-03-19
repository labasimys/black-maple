<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="user.UserDAO" %>
<%@ page import="cart.CartDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Black Maple</title>
</head>
<body>
	<%	
		String userID = null;
		StringBuffer requestURL = request.getRequestURL();
		if (request.getQueryString() != null) {
		    requestURL.append("?").append(request.getQueryString());
		}
		String completeURL = requestURL.toString();
		String[] s = completeURL.split("=");
		int productID = Integer.parseInt(request.getParameter("productID"));
		String cartImg = request.getParameter("Img");
		String cartName = request.getParameter("Name");
		int amount = Integer.parseInt(request.getParameter("amount"));
		int sum = Integer.parseInt(request.getParameter("sum"));
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
			int result = cartDAO.write((String)session.getAttribute("userID"), productID, cartImg, cartName, amount, sum);
			if(result == -1){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('장바구니 추가 실패')");
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