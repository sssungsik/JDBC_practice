<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.SQLException" %>

<%
//post방식 한글 처리 방법
request.setCharacterEncoding("euc-kr");

String dbgCode = request.getParameter("dbgCode");
String dbgName = request.getParameter("dbgName");
String dbgCate = request.getParameter("dbgCate");
String dbgPrice = request.getParameter("dbgPrice");
String dbgColor = request.getParameter("dbgColor");
String dbgSize = request.getParameter("dbgSize");
String dbgDate = request.getParameter("dbgDate");
String dbgDesc = request.getParameter("dbgDesc");

Connection conn = null;
PreparedStatement pstmt = null;
Class.forName("com.mysql.jdbc.Driver");
String jdbcDriver = "jdbc:mysql://192.168.10.17:3306/dev51db?" +
		"useUnicode=true&characterEncoding=euckr";
String dbUser = "dev51id";
String dbPass = "dev51pw";

conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
System.out.println(conn + "<-- conn");
pstmt = conn.prepareStatement("UPDATE tb_goods SET g_name=?,g_cate=?,g_price=?,g_color=?,g_size=?,g_date=?,g_desc=? WHERE g_code=?"); 
pstmt.setString(1, dbgName);
pstmt.setString(2, dbgCate);
pstmt.setString(3, dbgPrice);
pstmt.setString(4, dbgColor);
pstmt.setString(5, dbgSize);
pstmt.setString(6, dbgDate);
pstmt.setString(7, dbgDesc);
pstmt.setString(8, dbgCode);
System.out.println(pstmt + "<-- pstmt");
pstmt.executeUpdate();
pstmt.close();
conn.close();
response.sendRedirect(request.getContextPath()+"/mgsearch/mg_search_list2.jsp"); // 범진이꺼 경로
%>






