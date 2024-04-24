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
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/main.css" />
</head>
<body>
<%@ include file="/module/top.jsp" %>
<%@ include file="/module/left.jsp" %>
<%@ include file="/osearch/o_search_form.jsp" %>
주문 내역 검색 <br>
<div style="overflow: scroll; width: 100%; height: 300px;">
<table width="100%" border="1">
<tr>
	<td>주문코드</td><td>판매자아이디</td><td>의약품코드</td><td>의약품이름</td><td>수량</td><td>수정</td><td>삭제</td>
</tr>

<%
request.setCharacterEncoding("utf-8");
String sk = request.getParameter("sk");
String sv = request.getParameter("sv");

Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;
Class.forName("com.mysql.jdbc.Driver");
String selectQuery = "SELECT o.* FROM tb01_order AS o";
try{
	String jdbcDriver = "jdbc:mysql://192.168.10.6:3306/dev51db?" +
			"useUnicode=true&characterEncoding=euckr";
	String dbUser = "dev51id";
	String dbPass = "dev51pw";
	conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
	if(sk == null && sv == null){	
		pstmt = conn.prepareStatement(selectQuery);
	}else if(sk != null && sv.equals("")){
		pstmt = conn.prepareStatement(selectQuery);
	}else if(sk != null && sv != null){
		pstmt = conn.prepareStatement(selectQuery+" WHERE "+ sk + "=?");
		pstmt.setString(1, sv);
	}
	
	rs = pstmt.executeQuery();
	
	while(rs.next()){
		//System.out.println("select 쿼리 실행 결과 몇 줄 나올까?");
%>
<!-- 화면 위치 시작 -->
		<tr>
			<td><%= rs.getString("o_code")%></td>
			<td><%= rs.getString("o_seller_id")%></td>
			<td><%= rs.getString("o_m_code")%></td>
			<td><%= rs.getString("o_m_name")%></td>
			<td><%= rs.getString("o_amount")%></td>
			<td>
<a href="<%= request.getContextPath() %>/oupdate/o_update_form.jsp?send_code=<%= rs.getString("o_Code")%>">수정버튼</a>			
			</td>
			<td>
<a href="<%= request.getContextPath() %>/odelete/o_delete_action.jsp?send_code=<%= rs.getString("o_Code")%>">삭제버튼</a>			
			</td>
			
		</tr>
<!-- 화면 위치 끝 -->		
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
</div>
<%@ include file="/module/hadan.jsp" %>

</body>
</html>