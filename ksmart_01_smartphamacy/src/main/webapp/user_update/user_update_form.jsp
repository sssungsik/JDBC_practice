<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>
<%
String send_id = request.getParameter("send_id");
System.out.println(send_id + "<-- send_id m_update_form.jsp");
Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;
Class.forName("com.mysql.jdbc.Driver");

String dbid = null;
String dbpw = null;
String dblevel = null;
String dbname = null;
String dbemail = null;

try{
	String jdbcDriver = "jdbc:mysql://192.168.10.6:3306/dev51db?" +
			"useUnicode=true&characterEncoding=utf-8";
	String dbUser = "dev51id";
	String dbPass = "dev51pw";
	conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
	System.out.println(conn + "<-- conn m_update_form.jsp");
	pstmt = conn.prepareStatement("SELECT * FROM tb01_user WHERE user_id=?");
	pstmt.setString(1, send_id);
	System.out.println(pstmt);
	rs = pstmt.executeQuery();
	System.out.println(rs);
	
	if(rs.next()){
		System.out.println("if조건문 조건식 true일 경우 실행 m_update_form.jsp");
		dbid = rs.getString("user_id");
		dbpw = rs.getString("user_pw");
		dblevel = rs.getString("user_name");
		dbname = rs.getString("user_level");
			
		System.out.println(dbid);
		System.out.println(dbpw);
		System.out.println(dbname);
		System.out.println(dblevel);
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

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/main.css" />
</head>
<body>
<%@ include file="/module/top.jsp" %>
<%@ include file="/module/left.jsp" %>
<form action="<%= request.getContextPath() %>/user_update/user_update_action.jsp" method="post">
<table border="1">
<tr>
	<td>아이디</td>
	<td><input type="text" name="user_id" size="30" readonly value="<%= dbid %>"></td>
<tr>
<tr>
	<td>암호</td>
	<td><input type="text" name="user_pw" size="30" value="<%= dbpw %>"></td>
<tr>
<tr>
	<td>이름</td>
	<td><input type="text" name="user_name" size="30" value="<%= dbname %>"></td>
<tr>
<tr>
	<td>권한</td>
	<td><input type="text" name="user_level" size="30" value="<%= dblevel %>"></td>
<tr>
<tr>
	<td colspan="4"><input type="submit" value="회원수정버튼"></td>
</tr>
</table>
</form>
<%@ include file="/module/hadan.jsp" %>

</body>
</html>