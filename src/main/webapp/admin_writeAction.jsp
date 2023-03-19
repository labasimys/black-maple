<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="product.ProductDAO" %>
<%@ page import="admin.AdminDAO" %>
<%@ page import="java.io.PrintWriter" %>
<<jsp:useBean id="product" class="product.Product" scope="page"></jsp:useBean>
<<jsp:useBean id="admin" class="admin.Admin" scope="page"></jsp:useBean>
<<jsp:setProperty property="adID" name="admin"/>
<<jsp:setProperty property="adPassword" name="admin"/>
<<jsp:setProperty property="productCate" name="product"/>
<<jsp:setProperty property="productName" name="product"/>
<<jsp:setProperty property="productDetail" name="product"/>
<<jsp:setProperty property="productPrice" name="product"/>
<<jsp:setProperty property="productThumbnail" name="product"/>
<<jsp:setProperty property="productImg" name="product"/>
<% request.setCharacterEncoding("UTF-8"); %>
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
		if(adID == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인이 필요합니다.')");
			script.println("location.href = 'admin_login.jsp'");
			script.println("</script>");
		}
		else{
			if(product.getProductName() == null || product.getProductDetail() == null || product.getProductImg() == null){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('입력되지 않은 사항이 있습니다.')");
				script.println("history.back()");
				script.println("</script>");
			}
			else{
				ProductDAO productDAO = new ProductDAO();
				int result = productDAO.write(product.getProductCate(), product.getProductName(), product.getProductDetail(), product.getProductPrice(), product.getProductThumbnail(), product.getProductImg());
				if(result == -1){
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('상품 등록 실패')");
					script.println("history.back()");
					script.println("</script>");
				}
				else{
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("location.href = 'admin_main.jsp'");
					script.println("</script>");
				}
			}
		}	
	%>
</body>
</html>