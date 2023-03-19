<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="user.UserDAO" %>
<%@ page import="order.OrderDAO" %>
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
		int productID = Integer.parseInt(request.getParameter("productID"));
		String userAddress = request.getParameter("userAddress");
		String userPhone = request.getParameter("userPhone");
		String Img = request.getParameter("Img");
		String Name = request.getParameter("Name");
		int amount = Integer.parseInt(request.getParameter("amount"));
		int sum = Integer.parseInt(request.getParameter("sum"));
		String userName = request.getParameter("userName");
		
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
			OrderDAO orderDAO = new OrderDAO();
			int result = orderDAO.write((String)session.getAttribute("userID"), productID, userAddress, userPhone, Img, Name, amount, sum, userName);
			if(result == -1){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('결제 실패')");
				script.println("history.back()");
				script.println("</script>");
			}
			else{
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("location.href = 'purchase_Complete.jsp'");
				script.println("</script>");
			}
		}
	%>
</body>
</html>