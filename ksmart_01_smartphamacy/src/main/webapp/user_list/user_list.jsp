<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/main.css" />
</head>
<body>
<%@ include file="/module/top.jsp" %>
<%@ include file="/module/left.jsp" %>
회원 리스트 <br>
<table width="100%" border="1">
<tr>
	<td>아이디</td><td>비번</td><td>이름</td><td>권한</td><td>수정</td><td>삭제</td>
</tr>
<%
Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

Class.forName("com.mysql.jdbc.Driver");

try{
	String jdbcDriver = "jdbc:mysql://192.168.10.6:3306/dev51db?" +
			"useUnicode=true&characterEncoding=utf-8";
	String dbUser = "dev51id";
	String dbPass = "dev51pw";
	conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
	System.out.println(conn);
	pstmt = conn.prepareStatement("SELECT * FROM tb01_user");
	rs = pstmt.executeQuery();
	System.out.println(rs);
	while(rs.next()){
%>
	<tr>
			<td><%= rs.getString("user_id")%></td>
			<td><%= rs.getString("user_pw")%></td>
			<td><%= rs.getString("user_name")%></td>
			<td><%= rs.getString("user_level")%></td>
			<td>
	<a href="<%= request.getContextPath() %>/user_update/user_update_form.jsp?send_id=<%= rs.getString("user_id")%>">수정버튼</a>			
			</td>
			<td>
	<a href="<%= request.getContextPath() %>/user_delete/user_delete_action.jsp?send_id=<%= rs.getString("user_id")%>">삭제버튼</a>			
			</td>
			
		</tr>
<%
	}
} catch(SQLException ex) {
	out.println(ex.getMessage());
	ex.printStackTrace();
} finally {
	if (rs != null) try { rs.close(); } catch(SQLException ex) {}
	if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
	if (conn != null) try { conn.close(); } catch(SQLException ex) {}
}
%>
</table>