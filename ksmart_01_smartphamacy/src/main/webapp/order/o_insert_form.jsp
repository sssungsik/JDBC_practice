<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문하기</title>
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/main.css" />
</head>
<body>
<%@ include file="/module/top.jsp" %>
<%@ include file="/module/left.jsp" %>
<form action="<%= request.getContextPath() %>/order/o_insert_pro.jsp" method="post">
<!-- 	<input type="hidden" name="g_code"> -->	
<input type="hidden" name="m_id" value="<%= S_ID %>">

	판매자아이디 : <input type="text" name="o_seller_id"> <br>
	의약품코드 : <input type="text" name="o_m_code"> <br>
	의약품명 : <input type="text" name="o_m_name"> <br>
	수량 : <input type="text" name="o_amount"> <br>
	
	
	<input type="submit" value="상품등록버튼">
</form>	 
<%@ include file="/module/hadan.jsp" %>         		 
</body>
</html>