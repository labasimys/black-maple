<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
	<div>
		<br><br>
		<div class="write">
			<h3 style="text-align:center;">상품 등록</h3>
			<br>
			<form action="admin_writeAction.jsp">
				<table class="writeform">
					<tr>
						<td class="write_title">카테고리</td>
						<td><input class="write_input" type="text" name="productCate"></td>
					</tr>
					<tr>
						<td class="write_title">상품명</td>
						<td><input class="write_input" type="text" name="productName"></td>
					</tr>
					<tr>
						<td class="write_title">상품가격</td>
						<td><input class="write_input" type="text" name="productPrice"></td>
					</tr>	
					<tr>
						<td class="write_title">상품상세</td>
						<td><textarea rows="25" cols="77" name="productDetail"></textarea></td>
					</tr>
					<tr>
						<td class="write_title">썸네일</td>
						<td><input class="write_input" type="text" name="productThumbnail"></td>
					</tr>
					<tr>
						<td class="write_title">이미지</td>
						<td><input class="write_input" type="text" name="productImg"></td>
					</tr>
				</table>
				<br>
				<button>등록</button>
			</form>
		</div>
	</div>
</body>
</html>