<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
<form action="<%= request.getContextPath() %>/minsert/m_insert_action.jsp" method="post">
<table border="1">
<tr>
	
	<td colspan="2"><input type="text" name="m_id" size="20" placeholder="아이디"></td>
<tr>
<tr>
	
	<td colspan="2"><input type="text" name="m_pw" size="20" placeholder="비밀번호"></td>
<tr>
<tr>
	<td colspan="2"><input type="text" name="m_level" size="20" placeholder="권한"></td>
<tr>
<tr>
	<td>이름</td>
	<td><input type="text" name="m_name" size="20"></td>
<tr>
<tr>
	<td>이메일</td>
	<td><input type="text" name="m_email" size="20"></td>
<tr>
<tr>
	<td colspan="4"><input type="submit" value="회원가입버튼"></td>
</tr>
</table>
</form>
</body>
</html>