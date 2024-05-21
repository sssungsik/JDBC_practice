<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/main.css" />
</head>
<body>
<%@ include file="/module/top.jsp" %>
<%@ include file="/module/left.jsp" %>
<form action="<%= request.getContextPath() %>/minsert/medicine_insert_action.jsp" method="post">
<table border="1">
<tr>
	<td>약품코드</td>
	<td><input type="text" name="m_code" size="20"></td>
<tr>
<tr>
	<td>약품명</td>
	<td><input type="text" name="m_name" size="20"></td>
<tr>
<tr>
	<td>가격</td>
	<td><input type="number" name="m_price" size="20"></td>
<tr>
<tr>
	<td>제조사</td>
	<td><input type="text" name="m_comp" size="20"></td>
<tr>
<tr>
	<td>제형</td>
	<td><input type="text" name="m_formul" size="20"></td>
<tr>
<tr>
	<td>재고</td>
	<td><input type="number" name="m_stock" size="20"></td>
<tr>
<tr>
	<td colspan="4"><input type="submit" value="등록"></td>
</tr>
</table>
</form>
<%@ include file="/module/hadan.jsp" %>
</body>
</html>