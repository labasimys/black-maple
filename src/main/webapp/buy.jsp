<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.ArrayList"%>
<%@ page import="product.Product"%>
<%@ page import="product.ProductDAO"%>
<% request.setCharacterEncoding("UTF-8"); %>
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
		if(userID == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요.')");
			script.println("location.href = 'login.jsp'");
			script.println("</script>");
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
			<li><a href="hatList.jsp"" onMouseOver='this.innerHTML="모자"' onMouseOut='this.innerHTML="HAT"'>HAT</a></li>
			<li><a href="suitList.jsp"" onMouseOver='this.innerHTML="한벌옷"' onMouseOut='this.innerHTML="SUIT"'>SUIT</a></li>
			<li><a href="shoesList.jsp"" onMouseOver='this.innerHTML="신발"' onMouseOut='this.innerHTML="SHOES"'>SHOES</a></li>
			<li><a href="cloakList.jsp"" onMouseOver='this.innerHTML="망토"' onMouseOut='this.innerHTML="CLOAK"'>CLOAK</a></li>
			<li><a href="weaponList.jsp"" onMouseOver='this.innerHTML="무기"' onMouseOut='this.innerHTML="WEAPON"'>WEAPON</a></li>
			<li><a href="decoList.jsp"" onMouseOver='this.innerHTML="얼굴장식"' onMouseOut='this.innerHTML="FACE-DECO"'>FACE-DECO</a></li>
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
		<div>
			<img src="images/buy.png" class="buy_title">
			<br><br><br><br>
			<img src="images/body_bar.jpg">
			<br><br><br>
			<form class="buyForm" action="purchase.jsp">
				<table style="border-collapse: collapse;">
					<tr class="list_head">
						<td colspan="2">상품</td>
						<td></td>
						<td>수량</td>
						<td></td>
						<td>가격</td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td rowspan="2" style="padding-left:20px; padding-top:25px; width:150px; text-align:center;">
							<input type="hidden" name="Img" onclick="return false;" value="<%= request.getParameter("Img") %>">
							<img src="images/<%= request.getParameter("Img") %>.jpg"style="width:110px; height:110px;">
						</td>
						<td rowspan="2" style="padding-top:25px; width:400px;">
							<input type="text" style="border:none;" readonly name="Name" value="<%= request.getParameter("Name") %>">
						</td>
						<td rowspan="2" style="text-align:center; padding-top:25px;"><img src="images/listbar.jpg"></td>
						<td rowspan="2" style="padding-left:20px; padding-top:20px;">
							<input type="text" style="border:none;" readonly name="amount" value="<%= request.getParameter("amount") %>">
						</td>
						<td rowspan="2" style="text-align:center; padding-top:25px;"><img src="images/listbar.jpg"></td>
						<td rowspan="2" style="padding-left:20px; padding-top:20px;">
							<input type="text" style="border:none;" readonly name="sum" value="<%= request.getParameter("sum") %>">
						</td>
						<td rowspan="2" style="text-align:center; padding-top:25px;"><img src="images/listbar.jpg"></td>
						<td rowspan="2" style="padding-top:20px; width:150px; text-align:center;">배송비 없음</td>
					</tr>
					<tr></tr>
					<tr>
						<td colspan="8" style="top:-50px;"><img src="images/body_bar.jpg"></td>
					</tr>
				</table>
				<br><br>
				<img src="images/delivery.png"  class="buy_title">
				<br><br><br><br>
				<img src="images/body_bar.jpg">
				<br><br><br>
				<table class="delivery">
					<tr>
						<td style="padding-bottom:10px; padding-left:20px; width:200px;">이름</td>
						<td style="width:400px;"><input type="text" name="userName"></td>
					</tr>
					<tr></tr>
					<tr>
						<td style="padding-bottom:10px; padding-left:20px; ">주소</td>
						<td><input type="text" name="userAddress"></td>
					</tr>
					<tr></tr>
					<tr>
						<td style="padding-bottom:10px; padding-left:20px; ">전화번호</td>
						<td><input type="text" name="userPhone"></td>
					</tr>
				</table>
				<br>
				<br><br><br><br><br><br><br><br><br><br><br>
				<img src="images/buy_info.png" class="buy_title">
				<br><br><br><br>
				<img src="images/body_bar.jpg">
				<p class="buy_info" align="left">
					<font style="font-weight:bold;">결제방법</font>
					<input type="radio" name="pay" checked="checked"> 무통장 입금
				</p>
				<br>
				<p class="buy_title" style="text-align:left; padding-legt:10px;">계좌번호 : xxx-xx-xxxxxx OO은행
				<br><br>
				예금주 : 김혜민</p>
				<br><br><br>
				<br><br>
				<button>결제하기</button>
				<%
					StringBuffer requestURL = request.getRequestURL();
					if (request.getQueryString() != null) {
					    requestURL.append("?").append(request.getQueryString());
					}
					String completeURL = requestURL.toString();
					String[] s = completeURL.split("=");
					int productID = Integer.parseInt(s[s.length-1]);
				%>
				<input type="hidden" name="productID" value="<%= productID %>">
			</form>
		</div>
		<br><br>
		<img src="images/body_bar.jpg">
		<br><br>
		<img src="images/footer_img.png" class="footer">
	</div>
</body>
</html>