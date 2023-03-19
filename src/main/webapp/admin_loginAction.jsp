<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="admin.AdminDAO" %>
<%@ page import="java.io.PrintWriter" %>
<jsp:useBean id="admin" class="admin.Admin" scope="page"></jsp:useBean>
<jsp:setProperty property="adID" name="admin"/>
<jsp:setProperty property="adPassword" name="admin"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Black Maple</title>
</head>
<body>
	<%	
		String adID = null;
		if(session.getAttribute("adID") != null){
			adID = (String)session.getAttribute("adID");
		}
		AdminDAO adDAO = new AdminDAO();
		int result = adDAO.login(admin.getAdID(), admin.getAdPassword());
		if(result == 1){
			session.setAttribute("adID", admin.getAdID());
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href = 'admin_main.jsp'");
			script.println("</script>");
		}
		else if(result == 0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('비밀번호가 틀립니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
		else if(result == -1){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('존재하지 않는 아이디입니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
		else if(result == -2){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('데이터베이스 오류가 발생했습니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
	%>
</body>
</html>