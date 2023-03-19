<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="order.Order" %>
<%@ page import="order.OrderDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
	<meta name="description" content="쇼핑몰">
	<meta name="keywords" content="HTML5, CSS, JQUERY">
	
    <title>Black Maple</title>
	
	<link rel="stylesheet" type="text/css" href="css/main.css">
	<link rel=" shortcut icon" href="images/icon.ico">
	<link rel="icon" href="images/icon.ico">
	<script type="text/javascript" src="js/jquery-1.12.4.min.js"></script>
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
	<script type="text/javascript" src="js/main.js"></script>	
	
	<script>
      $( document ).ready( function() {
        var jbOffset = $( '.adMenu' ).offset();
        $( window ).scroll( function() {
          if ( $( document ).scrollTop() > jbOffset.top ) {
            $( '.adMenu' ).addClass( 'jbFixed' );
          }
          else {
            $( '.adMenu' ).removeClass( 'jbFixed' );
          }
        });
      } );
    </script>
    
    <div class="adMenu">
		<ul>
			<li><a href="admin_main.jsp">메인</a></li>
			<li><a href="admin_writeform.jsp">상품등록</a></li>
			<li><a href="admin_order.jsp">주문관리</a></li>
			<li><a href="admin_logoutAction.jsp">로그아웃</a></li>
		</ul>
	</div>
</head>
<body>
	<%
		String adID = null;
		if(session.getAttribute("adID") != null){
			adID = (String) session.getAttribute("adID");
		}
		if(adID == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인이 필요합니다.')");
			script.println("location.href = 'admin_login.jsp'");
			script.println("</script>");
		}
		int pageNumber = 1;
		if(request.getParameter("pageNumber") != null){
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}
	%>
	<div align="center"> 
		<div>
			<table style="border-collapse: collapse;">
				<tr class="list_head">
					<td colspan="2">상품</td>
					<td></td>
					<td>수량</td>
					<td></td>
					<td>가격</td>
					<td></td>
					<td>주문한 고객</td>
				</tr>
				<tr>
				<%
					OrderDAO orderDAO = new OrderDAO();
					ArrayList<Order> list = orderDAO.getOrderList();
					for(int i = 0;i<list.size();i++){
				%>
					<td rowspan="2" style="padding-left:20px; padding-top:25px; width:150px; text-align:center;">
						<img src="images/<%= list.get(i).getOrderImg() %>.jpg"style="width:110px; height:110px;">
					</td>
					<td rowspan="2" style="padding-top:25px; width:400px;">
						<%= list.get(i).getOrderName() %>
					</td>
					<td rowspan="2" style="text-align:center; padding-top:25px;"><img src="images/listbar.jpg"></td>
					<td rowspan="2" style="padding-left:20px; padding-top:20px;"><%= list.get(i).getAmount() %></td>
					<td rowspan="2" style="text-align:center; padding-top:25px;"><img src="images/listbar.jpg"></td>
					<td rowspan="2" style="padding-left:20px; padding-top:20px;"><%= list.get(i).getSum() %></td>
					<td rowspan="2" style="text-align:center; padding-top:25px;"><img src="images/listbar.jpg"></td>
					<td rowspan="2" class="cancelbutton" style="padding-left:10px;width:150px; padding-top:20px;">
						<%= list.get(i).getUserID() %>
					</td>
				</tr>
				<tr></tr>
				<tr>
					<td colspan="8" style="top:-50px;"><img src="images/body_bar.jpg"></td>
				</tr>
				<%
					}
				%>
			</table>
		</div>
	</div>
</body>
</html>