<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.SQLException" %>

<%
request.setCharacterEncoding("utf-8");
	String o_Code = request.getParameter("o_Code");
	String o_Seller_id = request.getParameter("o_Seller_id");
	String o_m_Code = request.getParameter("o_m_Code");
	String o_m_Name = request.getParameter("o_m_Name");
	String o_Amount = request.getParameter("o_Amount");
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	Class.forName("com.mysql.jdbc.Driver");
	String jdbcDriver = "jdbc:mysql://192.168.10.6:3306/dev51db?" +
			"useUnicode=true&characterEncoding=euckr";
	String dbUser = "dev51id";
	String dbPass = "dev51pw";
	
	conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
	System.out.println(conn + "<-- conn");
	// 날짜는 now()로 업뎃버튼누르면 현재날짜로 변경됨
	pstmt = conn.prepareStatement("UPDATE tb01_order SET o_seller_id=?, o_m_code=?, o_m_name=?, o_amount=?, o_date=NOW() WHERE o_code=? ");
	
	pstmt.setString(1, o_Seller_id);
	pstmt.setString(2, o_m_Code);
	pstmt.setString(3, o_m_Name);
	pstmt.setString(4, o_Amount);
	pstmt.setString(5, o_Code);
	
	System.out.println(pstmt + "<-- pstmt테스트");
	pstmt.executeUpdate();
	pstmt.close();
	conn.close();
	response.sendRedirect(request.getContextPath()+"/osearch/o_search_list.jsp");  //경로 확인해야함!
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>