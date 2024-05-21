<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.ResultSet" %>  <!-- DB결과물 보이는 것 (select 등) 에만 사용 -->
<%@ page import = "java.sql.SQLException" %>
<link href="../css/main.css" rel="stylesheet" type="text/css">
<%@ include file="/module/top.jsp" %>


<%@ include file="/u_search/u_search_form.jsp"%>

<div class = user-list>
<table  width="80%" border="1">
<thead>
	<tr>
		<th>아이디</th><th>비번</th><th>권한</th><th>이름</th><th>이메일</th><th>휴대폰</th><th>주소</th><th>수정</th><th>삭제</th>
	</tr>
	</thead>




<%
request.setCharacterEncoding("UTF-8");
String sk = request.getParameter("sk");
String sv = request.getParameter("sv");
System.out.println(sk + "  - sk");
System.out.println(sv + "  - sv");

Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;
// JDBC 실행 (user_list 참고)
// JDBC 1단계
Class.forName("com.mysql.jdbc.Driver");
// JDBC 2단계
	try{
String jdbcDriver = "jdbc:mysql://localhost:3306/db04css?" + "useUnicode=true&characterEncoding=euckr";
String dbUser = "dbid04css";
String dbPass = "dbpw04css";
conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
System.out.println(conn + "<-- conn ");
// JDBC 3단계
if(sk == null && sv == null) {
	System.out.println("1. sk,sv 값 null 조건");
}else if (sk != null && sv.equals("")){
	System.out.println("2. sk는 null 아니고 sv는 공백 조건");
}else if (sk != null && sv != null){
	System.out.println("3. sk,sv는 null이 아닌 조건");
	pstmt = conn.prepareStatement("SELECT * FROM tb_user WHERE " + sk + " = ?");
	pstmt.setString(1, sv);
}
		
	
/* 	if(sk.equals("u_id")) {
		pstmt = conn.prepareStatement("SELECT * FROM tb_user WHERE u_id = ?");
		pstmt.setString(1, sv);
	} else if (sk.equals("u_name")) {
		pstmt = conn.prepareStatement("SELECT * FROM tb_user WHERE u_name = ? ");
		pstmt.setString(1, sv);
	} else if (sk.equals("u_level")) {
		pstmt = conn.prepareStatement("SELECT * FROM tb_user WHERE u_level = ?");
		pstmt.setString(1, sv);
	}
} */
System.out.println(pstmt + "     -----> pstmt");
rs = pstmt.executeQuery();
System.out.println(rs + "<-- rs user_list.jsp");
while(rs.next()){ // 한 줄 조사 후에 데이터 존재 시 true /없으면 false 리턴 
	System.out.println("while 반복문 실행");
// JDBC 4단계
// JDBC 5단계
// JDBC 67단계
%>
	<tbody>
		<tr>
			<td><%= rs.getString("u_id")%></td>
			<td><%= rs.getString("u_pw")%></td>
			<td><%= rs.getString("u_level")%></td>
			<td><%= rs.getString("u_name")%></td>
			<td><a href="#"><%= rs.getString("u_email")%></a></td>
			<td><%= rs.getString("u_phone")%></td>
			<td><%= rs.getString("u_addr")%></td>
			<td> <a href=" <%= request.getContextPath() %>/u_update/user_update_form.jsp?sendId=<%= rs.getString("u_id")%>">수정</a></td>
			<td> <a href=" <%= request.getContextPath() %>/u_delete/user_delete.jsp?sendId=<%= rs.getString("u_id")%>">삭제</a></td>
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

	</div>


