<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
<%@ include file="/user_search/user_search_form.jsp" %>
회원 검색 <br>
<table width="100%" border="1">
<tr>
	<td>아이디</td><td>비번</td><td>권한</td><td>이름</td><td>수정</td><td>삭제</td>
</tr>
<%
request.setCharacterEncoding("utf-8");
String sk = request.getParameter("sk");
String sv = request.getParameter("sv");
System.out.println(sk + "<-- sk m_search_list.jsp");
System.out.println(sv + "<-- sv m_search_list.jsp");

Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;
Class.forName("com.mysql.jdbc.Driver");
String selectQuery = "SELECT *	FROM tb01_user";
try{
	String jdbcDriver = "jdbc:mysql://192.168.10.6:3306/dev51db?" +
			"useUnicode=true&characterEncoding=utf-8";
	String dbUser = "dev51id";
	String dbPass = "dev51pw";
	conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
	System.out.println(conn + "<-- conn m_search_list.jsp");
	if(sk == null && sv == null){
		System.out.println("1. sk,sv 변수에 담긴 값 null 조건");	
		pstmt = conn.prepareStatement(selectQuery);
	}else if(sk != null && sv.equals("")){
		System.out.println("2. sk는null아니고 sv는 공백 조건");
		pstmt = conn.prepareStatement(selectQuery);
	}else if(sk != null && sv != null){
		System.out.println("3-1. m_id 조건");
		pstmt = conn.prepareStatement(selectQuery+" WHERE "+ sk + "=?");
		pstmt.setString(1, sv);
	}
	System.out.println(pstmt);
	
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
<%@ include file="/module/hadan.jsp" %>

</body>
</html>





