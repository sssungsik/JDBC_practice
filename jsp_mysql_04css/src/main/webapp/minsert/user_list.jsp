<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<!-- DB결과물 보이는 것 (select 등) 에만 사용 -->
<%@ page import="java.sql.SQLException"%>
<html>
<head>
<link href="../css/main.css" rel="stylesheet" type="text/css">
</head>
<body>
	<header> <%@ include file="/module/top.jsp"%>
	<%@ include file="/u_search/u_search_form.jsp"%>
	</header>
	<main> <section class="main">
	<div class=user-list>
		<table width="80%" border="1">
			<p>도박사이트 회원목록</p>

			<thead>
				<tr>
					<th>아이디</th>
					<th>비번</th>
					<th>권한</th>
					<th>이름</th>
					<th>이메일</th>
					<th>휴대폰</th>
					<th>주소</th>
					<th>수정</th>
					<th>삭제</th>
				</tr>
			</thead>
			<%
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			Class.forName("com.mysql.jdbc.Driver");

			try {
				String jdbcDriver = "jdbc:mysql://localhost:3306/db04css?" + "useUnicode=true&characterEncoding=euckr";
				String dbUser = "dbid04css";
				String dbPass = "dbpw04css";
				conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
				System.out.println(conn + "<-- conn user_list.jsp");
				pstmt = conn.prepareStatement("SELECT * FROM tb_user");
				rs = pstmt.executeQuery();
				System.out.println(rs + "<-- rs user_list.jsp");
				//System.out.println(rs.next() + "<-- rs.next() user_list.jsp");
				while (rs.next()) { // 한 줄 조사 후에 데이터 존재 시 true /없으면 false 리턴 
					System.out.println("while 반복문 실행");
			%>

			<tbody>
				<tr>
					<td><%=rs.getString("u_id")%></td>
					<td><%=rs.getString("u_pw")%></td>
					<td><%=rs.getString("u_level")%></td>
					<td><%=rs.getString("u_name")%></td>
					<td><a href="#"><%=rs.getString("u_email")%></a></td>
					<td><%=rs.getString("u_phone")%></td>
					<td><%=rs.getString("u_addr")%></td>
					<td><a
						href=" <%=request.getContextPath()%>/u_update/user_update_form.jsp?sendId=<%=rs.getString("u_id")%>">수정</a></td>
					<td><a
						href=" <%=request.getContextPath()%>/u_delete/user_delete.jsp?sendId=<%=rs.getString("u_id")%>">삭제</a></td>
				</tr>
			</tbody>
			<%
			}
			} catch (SQLException ex) {
			out.println(ex.getMessage());
			ex.printStackTrace();
			} finally {
			if (rs != null)
			try {
				rs.close();
			} catch (SQLException ex) {
			}
			if (pstmt != null)
			try {
				pstmt.close();
			} catch (SQLException ex) {
			}
			if (conn != null)
			try {
				conn.close();
			} catch (SQLException ex) {
			}
			}
			%>

		</table>

	</div>
	</section> </main>
	<footer>
	<div class="footerlogo">
		<ul>
			<li><img src="./images/insta.png" alt="insta"></li>
			<li><img src="./images/facebook.png" alt="facebook"></li>
		</ul>
	</div>
	</footer>




</body>
</html>