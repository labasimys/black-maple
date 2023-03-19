<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="admin.Admin" %>
<%@ page import="admin.AdminDAO" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="product.ProductDAO" %>
<%@ page import="product.Product" %>
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
    
    <script>
    	var pid = <%= request.getParameter("productID") %>;
    	function mySubmit(index){
    		if(index == 1){
    			document.form.action="buy.jsp?productID=<%= request.getParameter("productID") %>";
    		}
    		if(index == 2){
    			document.form.action="basketAddAction.jsp?productID=<%= request.getParameter("productID") %>";
    		}
    		document.form.submit();
    	}
    	var sell_price;
    	var amount;
    	function init () {
    		sell_price = document.form.sell_price.value;
    		amount = document.form.amount.value;
    		document.form.sum.value = sell_price;
    		change();
    	}

    	function add () {
    		hm = document.form.amount;
    		sum = document.form.sum;
    		hm.value ++ ;

    		sum.value = parseInt(hm.value) * sell_price;
    	}

    	function del () {
    		hm = document.form.amount;
    		sum = document.form.sum;
    			if (hm.value > 1) {
    				hm.value -- ;
    				sum.value = parseInt(hm.value) * sell_price;
    			}
    	}

    	function change () {
    		hm = document.form.amount;
    		sum = document.form.sum;

    			if (hm.value < 0) {
    				hm.value = 0;
    			}
    		sum.value = parseInt(hm.value) * sell_price;
    	}
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

<body onload="init();" >
	<% 
		int productID = 0;
		if(request.getParameter("productID") != null){
			productID = Integer.parseInt(request.getParameter("productID"));
		}
		if(productID == 0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글입니다.')");
			script.println("location.href = admin_main.jsp");
			script.println("</script>");
		}
		Product product = new ProductDAO().getProduct(productID);
	%>
	<div align="center">
		<div>
			<table class= "view_table">
				<form name="form" method="post">
					<tr>
						<td rowspan = "10" colspan="4">
							<input type="hidden" name="Img" onclick="return false;"value="<%= product.getProductImg() %>">
							<input type="hidden" name="productID" value="<%= product.getProductID() %>">
							<img src="images/<%= product.getProductImg() %>.jpg">
						</td>
					</tr>
					<tr></tr>
					<tr>
					<td colspan = "2"style="padding-left:30px;">
						<input type="text" name="Name" style="border:none; font-weight:bold; font-size:20px;" readonly value="<%= product.getProductName() %>">
					</td>
					</tr>
					<tr>
						<td style="padding-left:30px;">판매가</td>
						<td>
							<input type="text" style="border:none;" readonly name="Price" value="<%= product.getProductPrice() %> 원">
						</td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td style="padding-left:30px;">수량</td>
						<td>
							<input type=hidden name="sell_price" value="<%= product.getProductPrice() %>">
							<input type="button" onclick="del();" class="mbtn">
							<input type="text" name="amount" value="1" size="3" onchange="change();">
							<input type="button" onclick="add();" class="pbtn">
						</td>
					</tr>
					<tr>
						<td style="padding-left:30px; font-weight:bold; font-size:18px;">총 금액</td>
						<td style="font-weight:bold; font-size:18px;">
							<input type="text" name="sum" size="4" readonly style="border:none; font-weight:bold; font-size:18px;"> 원
						</td>
					</tr>
					<tr>
						<td rowspan="3"colspan = "2"style="padding-left:20px;">
							<input type="image" src="images/buy_now.jpg" onclick="mySubmit(1)">
						</td>
						<td rowspan="3"colspan = "2">
							<input type="image" src="images/basket.jpg" onclick="mySubmit(2)">
						</td>
					</tr>
					<tr></tr>
					<tr></tr>
					<tr></tr>
				</form>
			</table>
			<br><br>
			<img src="images/body_bar.jpg">
			<br><br>
			<br><br>
			<div>
				<img src="images/<%= product.getProductDetail() %>.jpg">			
			</div>
		</div>
		<br><br>
		<img src="images/body_bar.jpg">
		<br><br>
		<img src="images/footer_img.png" class="footer">
	</div>
</body>
</html>