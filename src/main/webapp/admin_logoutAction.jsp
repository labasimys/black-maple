<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Black Maple</title>
</head>
<body>
	<%	
		session.invalidate();
		response.sendRedirect("index.jsp");
	%>
</body>
</html>