<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>
<%
String send_code = request.getParameter("send_code");
System.out.println(send_code + "<-- 샌드코드");
Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;
Class.forName("com.mysql.jdbc.Driver");
//한명의 회원 정보를 저장 할 변수 선언
//한명의 회원 정보를 담을 수 있는 다른 방법은?
String dbcode = null;
String dbname = null;
String dbprice = null;
String dbcomp = null;
String dbformul = null;
String dbstock = null;

try{
	String jdbcDriver = "jdbc:mysql://192.168.10.6:3306/dev51db?" +
			"useUnicode=true&characterEncoding=euckr";
	String dbUser = "dev51id";
	String dbPass = "dev51pw";
	conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
	System.out.println(conn + "<-- conn m_update_form.jsp");
	pstmt = conn.prepareStatement("SELECT * FROM tb01_medicine WHERE m_code=?");
	pstmt.setString(1, send_code);
	System.out.println(pstmt + "<-- pstmt");
	rs = pstmt.executeQuery();
	System.out.println(rs + "<-- rs ");
	if(rs.next()){
		System.out.println("if조건문 조건식 true일 경우 실행 ");
		dbcode = rs.getString("m_code");
		dbname = rs.getString("m_name");
		dbprice = rs.getString("m_price");
		dbcomp = rs.getString("m_comp");
		dbformul = rs.getString("m_formul");	
		dbstock = rs.getString("m_stock");	
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
<!-- 1번 방법 : 수정화면 시작  m_insert_form.jsp : 수정화면과 비슷 -->
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/main.css" />
</head>
<body>
<%@ include file="/module/top.jsp" %>
<%@ include file="/module/left.jsp" %>
<form action="<%= request.getContextPath() %>/mupdate/medicine_update_action.jsp" method="post">
<table border="1">
<tr>
	<td>약품코드</td>
	<td><input type="text" name="m_code" size="20" readonly value="<%= dbcode %>"></td>
<tr>
<tr>
	<td>약품명</td>
	<td><input type="text" name="m_name" size="20" value="<%= dbname %>"></td>
<tr>
<tr>
	<td>가격</td>
	<td><input type="number" name="m_price" size="20" value="<%= dbprice %>"></td>
<tr>
<tr>
	<td>제조사</td>
	<td><input type="text" name="m_comp" size="20" value="<%= dbcomp %>"></td>
<tr>
<tr>
	<td>제형</td>
	<td><input type="text" name="m_formul" size="20" value="<%= dbformul %>"></td>
<tr>
<tr>
	<td>재고</td>
	<td><input type="number" name="m_stock" size="20" value="<%= dbstock %>"></td>
<tr>
<tr>
	<td colspan="4"><input type="submit" value="수정"></td>
</tr>
</table>
</form>
<%@ include file="/module/hadan.jsp" %>

</body>
</html>
<!-- 1번 방법 : 수정화면 끝 -->