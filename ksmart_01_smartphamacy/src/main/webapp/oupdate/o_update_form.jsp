<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>

<%

	request.setCharacterEncoding("utf-8");
	String send_code = request.getParameter("send_code");
	System.out.println(send_code + "<-- send_code");
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	Class.forName("com.mysql.jdbc.Driver");
	
	String o_Code = null;
	String o_Seller_id = null;
	String o_m_Code  = null;
	String o_m_Name = null;
	String o_Amount = null;
	String o_Date = null;
	
	try{
		String jdbcDriver = "jdbc:mysql://192.168.10.6:3306/dev51db?" +
				"useUnicode=true&characterEncoding=euckr";
		String dbUser = "dev51id";
		String dbPass = "dev51pw";
		conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		System.out.println(conn + "<-- conn테스트");
		pstmt = conn.prepareStatement("SELECT * FROM tb01_order WHERE o_code=?");
		pstmt.setString(1, send_code);
		System.out.println(pstmt + "<-- pstmt ");
		rs = pstmt.executeQuery();
		System.out.println(rs + "<-- rs ");
		
		if(rs.next()){
			System.out.println("조건문 참이면 실행 ");
			o_Code = rs.getString("o_code");
			o_Seller_id = rs.getString("o_seller_id");
			o_m_Code = rs.getString("o_m_code");
			o_m_Name = rs.getString("o_m_name");
			o_Amount = rs.getString("o_amount");
			o_Date = rs.getString("o_date");
			System.out.println(o_Code);
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
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/main.css" />
</head>
<body>
<%@ include file="/module/top.jsp" %>
<%@ include file="/module/left.jsp" %>
	<form action="<%= request.getContextPath() %>/oupdate/o_update_action.jsp" method="post">
	<table border="1">
	<tr>
		<td>주문코드</td>
		<td><input type="text" name="o_Code" size="20" readonly value="<%= o_Code %>"></td>
	<tr>
	<tr>
		<td>판매자아이디</td>
		<td><input type="text" name="o_Seller_id" size="20" value="<%= o_Seller_id %>"></td>
	<tr>
	<tr>
		<td>약품코드</td>
		<td><input type="text" name="o_m_Code" size="20" value="<%= o_m_Code %>"></td>
	<tr>
	<tr>
		<td>약품이름</td>
		<td><input type="text" name="o_m_Name" size="20" value="<%= o_m_Name %>"></td>
	<tr>
	<tr>
		<td>주문수량</td>
		<td><input type="text" name="o_Amount" size="20" value="<%= o_Amount %>"></td>
	<tr>
	<td colspan="4"><input type="submit" value="주문수정"></td>
</tr>
</table>
</form> 
<%@ include file="/module/hadan.jsp" %>

</body>
</html>