<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.SQLException" %>

<%
//post방식 한글 처리 방법
request.setCharacterEncoding("utf-8");
String user_id = request.getParameter("user_id"); //String m_id = "id008";
String user_pw = request.getParameter("user_pw");
String user_name = request.getParameter("user_name");
String user_level = request.getParameter("user_level");

System.out.println(user_id);
System.out.println(user_pw);
System.out.println(user_name);
System.out.println(user_level);

Connection conn = null;
PreparedStatement pstmt = null;
Class.forName("com.mysql.jdbc.Driver");
String jdbcDriver = "jdbc:mysql://192.168.10.6:3306/dev51db?" +
		"useUnicode=true&characterEncoding=utf-8";
String dbUser = "dev51id";
String dbPass = "dev51pw";

conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
System.out.println(conn + "<-- conn");
pstmt = conn.prepareStatement("UPDATE tb01_user SET	user_id=?, user_pw=?, user_name=?, user_level=? WHERE user_id=?"); 
pstmt.setString(1, user_id);
pstmt.setString(2, user_pw);
pstmt.setString(3, user_name);
pstmt.setString(4, user_level);
pstmt.setString(5, user_id);
System.out.println(pstmt + "<-- pstmt");
pstmt.executeUpdate();
pstmt.close();
conn.close();

response.sendRedirect(request.getContextPath()+"/user_search/user_search_list.jsp");
%>






