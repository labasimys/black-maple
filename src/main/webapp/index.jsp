<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="product.Product" %>
<%@ page import="product.ProductDAO" %>
<%@ page import="java.util.ArrayList" %>
<jsp:useBean id="ProductDAO" class="product.ProductDAO"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
	
    <title>Black Maple</title>
	
	<link rel="stylesheet" type="text/css" href="css/main.css">
	<link rel="shortcut icon" href="images/icon.ico">
	<link rel="icon" href="images/icon.ico">
	<script type="text/javascript" src="js/jquery-1.12.4.min.js"></script>
	<script type="text/javascript" src="js/main.js"></script>
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
	<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
	
    <script>
      $( document ).ready( function() {
        var jbOffset = $( '.menu' ).offset();
        $( window ).scroll( function() {
          if ( $( document ).scrollTop() > jbOffset.top ) {
            $( '.menu' ).addClass( 'menu_fixed' );
          }
          else {
            $( '.menu' ).removeClass( 'menu_fixed' );
          }
        });
      } );
    </script>
     
    <script>
      $( document ).ready( function() {
        $( window ).scroll( function() {
          if ( $( this ).scrollTop() > 200 ) {
            $( '.top_button' ).fadeIn();
          } else {
            $( '.top_button' ).fadeOut();
          }
        } );
        $( '.top_button' ).click( function() {
          $( 'html, body' ).animate( { scrollTop : 0 }, 400 );
          return false;
        } );
      } );
    </script>
    
    <div class="top_button"><img src="images/top_button.png"></div>
    <% 
		String userID = null;
		if(session.getAttribute("userID") != null){
			userID = (String)session.getAttribute("userID");
		}
		int pageNumber = 1;
		if(request.getParameter("pageNumber") != null){
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}
	%>
	
	<div class="top_menu">
		<% 
			if(userID == null){	
		%>
		<ul>
			<li><a href="login.jsp">LOGIN</a></li>
			<li> | </li>
			<li><a href="join.jsp">JOIN</a></li>
			<li> | </li>
			<li><a href="basket.jsp">장바구니</a></li>
			<li> | </li>
			<li><a href="purchaseList.jsp">주문목록</a></li>
			<li> | </li>
			<li><a href="cscenter.jsp">고객센터</a></li>
		</ul>
		<%
			}
			else {
		%>
		<ul style="padding-left:930px;">
			<li><a href="logoutAction.jsp">LOGOUT</a></li>
			<li> | </li>
			<li><a href="basket.jsp">장바구니</a></li>
			<li> | </li>
			<li><a href="purchaseList.jsp">주문목록</a></li>
			<li> | </li>
			<li><a href="cscenter.jsp">고객센터</a></li>
		</ul>
		<%
			}
		%>
	</div>
	
    <div class="title">
      <a href="index.jsp"><img src="images/BigLogo.png"></a>
    </div>
    
    <div class="menu">
		<ul>
			<li style="padding-left:10px;"><a href="index.jsp"><img src="images/SmallLogo.png"></a></li>
			<li style="padding-left:60px;"><a href="hairList.jsp" onMouseOver='this.innerHTML="헤어"' onMouseOut='this.innerHTML="HAIR-STYLE"'>HAIR-STYLE</a></li>
			<li><a href="faceList.jsp" onMouseOver='this.innerHTML="얼굴"' onMouseOut='this.innerHTML="FACE-STYLE"'>FACE-STYLE</a></li>
			<li><a href="hatList.jsp" onMouseOver='this.innerHTML="모자"' onMouseOut='this.innerHTML="HAT"'>HAT</a></li>
			<li><a href="suitList.jsp" onMouseOver='this.innerHTML="한벌옷"' onMouseOut='this.innerHTML="SUIT"'>SUIT</a></li>
			<li><a href="shoesList.jsp" onMouseOver='this.innerHTML="신발"' onMouseOut='this.innerHTML="SHOES"'>SHOES</a></li>
			<li><a href="cloakList.jsp" onMouseOver='this.innerHTML="망토"' onMouseOut='this.innerHTML="CLOAK"'>CLOAK</a></li>
			<li><a href="weaponList.jsp" onMouseOver='this.innerHTML="무기"' onMouseOut='this.innerHTML="WEAPON"'>WEAPON</a></li>
			<li><a href="decoList.jsp" onMouseOver='this.innerHTML="얼굴장식"' onMouseOut='this.innerHTML="FACE-DECO"'>FACE-DECO</a></li>
			<%
				if(userID == null){
			%>
				<li><a href="login.jsp" style="float:right;"><img src="images/login.png"></a></li>
			<%
				}
				else{
			%>
				<li><a href="logoutAction.jsp" style="float:right;"><img src="images/logout.png"></a></li>
			<%
				}
			%>
		</ul>
	</div>
</head>

<body>
	<div align="center"> 
		<table class="img_table">
			<tr>
				<td rowspan="2" colspan="2">
					<div class="slide">
						<ul class="slide_ul">
							<li><a href="view.jsp?productID=1"><img src="images/1-1.jpg"></a></li>
							<li><a href="view.jsp?productID=2"><img src="images/2-1.jpg" alt=""></a></li>
							<li><a href="view.jsp?productID=3"><img src="images/3-1.jpg" alt=""></a></li>
							<li><a href="view.jsp?productID=4"><img src="images/4-1.jpg" alt=""></a></li>
						</ul>
					</div>
				</td>
				<td><a href="view.jsp?productID=5"><img src="images/5-1.jpg" style="margin-left:-8px; width:300px; height:300px;"></a></td>
				<td><a href="view.jsp?productID=6"><img src="images/6-1.jpg" style="margin-left:-8px; width:300px; height:300px;"></a></td>
			</tr>
			<tr>
				<td><a href="view.jsp?productID=7"><img src="images/7-1.jpg" style="margin-left:-8px; margin-top:-16px; width:300px; height:300px;"></a></td>
				<td><a href="view.jsp?productID=8"><img src="images/8-1.jpg" style="margin-left:-8px; margin-top:-16px; width:300px; height:300px;"></a></td>
			</tr>
		</table>
		<br><br>
		<h1 class="list_title">NEW THINGS</h1>
		<img src="images/title_bar.png"><br>
 		<div> 
			<%
				ProductDAO productDAO = new ProductDAO();
				ArrayList<Product> list = productDAO.getNewThingsList(pageNumber);
				for(int i = 0;i<list.size();i++){
			%>
				<div class="list">
					<table>
						<tr>
							<td><a href="view.jsp?productID=<%= list.get(i).getProductID() %>"><img src="images/<%= list.get(i).getProductThumbnail() %>.gif"></a></td>
						</tr>
						<tr style="height:30px;">
							<td class="list_name"><a href="view.jsp?productID=<%= list.get(i).getProductID() %>"><%= list.get(i).getProductName() %></a></td>
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
		<br><br>
		<img src="images/body_bar.jpg">
		<br><br>
		<img src="images/footer_img.png" class="footer">
	</div>
</body>
</html>