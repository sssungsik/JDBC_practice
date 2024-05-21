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
<link href="../css/main.css" rel="stylesheet" type="text/css">

</head>
<body>
<div class = user-list>
	<form action="<%=request.getContextPath()%>/u_update/user_update_action.jsp" method="post"> 
		<table  width="80%" border="1">
		<h1>회원수정</h1>


<%
	String sendId = request.getParameter("sendId");

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	Class.forName("com.mysql.jdbc.Driver");
	
	try{
		String jdbcDriver = "jdbc:mysql://localhost:3306/db04css?" + "useUnicode=true&characterEncoding=euckr";
		String dbUser = "dbid04css";
		String dbPass = "dbpw04css";
		conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		System.out.println(conn + "<-- conn user_list.jsp");
		pstmt = conn.prepareStatement("SELECT * FROM tb_user WHERE u_id = '" + sendId + "';" );
		rs = pstmt.executeQuery();
		System.out.println(rs + "<-- rs user_list.jsp");
		//System.out.println(rs.next() + "<-- rs.next() user_list.jsp");
		while(rs.next()){ // 한 줄 조사 후에 데이터 존재 시 true /없으면 false 리턴 
			System.out.println("while 반복문 실행");
%>
	
	<thead>
	<tr>
		<th>아이디</th><th>비번</th><th>권한</th><th>이름</th><th>이메일</th><th>휴대폰</th><th>주소</th><th>수정</th>
	</tr>
	</thead>
	
		<tbody>
		<tr>
			<td><input type="text" name="u_id" value=<%= rs.getString("u_id")%> readonly></td>
			<td><input type="text" value=<%= rs.getString("u_pw")%> name="u_pw"></td>
			<td><select id="userGrade"  name="u_level">
 			 <option value="판매자">판매자</option>
 			 <option value="구매자">구매자</option>
 			 <option value="관리자">관리자</option></select></td>
			<td><input type="text" value=<%= rs.getString("u_name")%> name="u_name"></td>
			<td><input type="email" value=<%= rs.getString("u_email")%> name="u_email"></td>
			<td><input type="number"  value=<%= rs.getString("u_phone")%> name="u_phone"></td>
			<td>	<input type="text"  value=<%= rs.getString("u_addr")%> name="u_addr"></td>
			<td> <button type="submit" value="수정버튼">수정</button></td>
		</tr>
		</tbody>
			
<%		
	}
}catch(SQLException ex) {
	out.println(ex.getMessage());
	ex.printStackTrace();
} finally {
	if (rs != null) try { rs.close(); } catch(SQLException ex) {}
	if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
	if (conn != null) try { conn.close(); } catch(SQLException ex) {}
}
%>
	
	
	
	</table>
	
	

</form>
</div>
</body>
</html>

