<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.io.PrintWriter" %>
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
	<div class="join">
        <h3 style="text-align:center;">JOIN</h3>
        <br>
        <form method="post" action="joinAction.jsp">
            <table class="join_table">
                <tr>
                    <td class="join_title">아이디</td>
                    <td>
                        <input class="join_input" type="text" size="50" maxlength="20" name="userID" placeholder="20자 이하">   
                    </td>
                </tr>     
                <tr>
                    <td class="join_title">비밀번호</td>
                    <td>
                        <input class="join_input" type="password" size="50" maxlength="20" name="userPassword" placeholder="8자 이상 20자 이하">
                    </td>
                </tr>                 
                <tr>
                    <td class="join_title">이름</td>
                    <td>
                        <input class="join_input" type="text" size="50" maxlength="20" name="userName">
                    </td>
                </tr>  
                <tr>
                    <td class="join_title">성별</td>
                    <td>
                        <input type="radio" autocomplete="off" name="userGender" value="남">남
                        <input type="radio" autocomplete="off" name="userGender" value="여">여
                    </td>
                </tr>     
                <tr>
                    <td class="join_title">이메일</td>
                    <td>
                        <input class="join_input" type="text" name="userEmail" size="50" maxlength="50" placeholder="example@naver.com">
                    </td>
                </tr>
                <tr>
                    <td class="join_title">휴대전화</td>
                    <td>
                        <input class="join_input" type="text" name="userNumber" size="50" maxlength="20" placeholder="'-'포함">
                    </td>
                </tr>
                <tr>
                    <td class="join_title">주소</td>
                    <td>
                        <input class="join_input" type="text" size="50" name="userAddress">
                    </td>
                </tr>
            </table>
            <br>
            <button>join</button>
        </form>
    </div>
    <br><br>
	<img src="images/body_bar.jpg">
	<br><br>
	<img src="images/footer_img.png" class="footer">
</body>
</html>