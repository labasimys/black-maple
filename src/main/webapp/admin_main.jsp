<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="product.Product" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="product.ProductDAO" %>
<%@ page import="java.io.PrintWriter" %>
<jsp:useBean id="ProductDAO" class="product.ProductDAO"/>
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
			<%
				ProductDAO productDAO = new ProductDAO();
				ArrayList<Product> list = productDAO.getList();
				for(int i = 0;i<list.size();i++){
			%>
				<div class="list">
					<table>
						<tr>
							<td><img src="images/<%= list.get(i).getProductThumbnail() %>.gif"></td>
						</tr>
						<tr style="height:30px;">
							<td class="list_name"><%= list.get(i).getProductName() %></td>
						</tr>
						<tr style="height:30px;">
							<td class="list_price"><%= list.get(i).getProductPrice() %> 원</td>
						</tr>
						<tr style="height:55px;">
						</tr>
					</table>
				</div>
			<% 
				}
			%>
		</div>
	</div>
</body>
</html>