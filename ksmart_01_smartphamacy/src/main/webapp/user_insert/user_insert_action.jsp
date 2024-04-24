<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.SQLException" %>

<%
request.setCharacterEncoding("utf-8");
Connection conn = null;
PreparedStatement pstmt = null;

String user_id = request.getParameter("user_id");
String user_pw = request.getParameter("user_pw");
String user_name = request.getParameter("user_name");
String user_level = request.getParameter("user_level");
System.out.println(user_id);
System.out.println(user_pw);
System.out.println(user_name);
System.out.println(user_level);

Class.forName("com.mysql.jdbc.Driver");
String jdbcDriver = "jdbc:mysql://192.168.10.6:3306/dev51db?" +
		"useUnicode=true&characterEncoding=euckr";
String dbUser = "dev51id";
String dbPass = "dev51pw";

conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
System.out.println(conn + "<-- conn");
pstmt = conn.prepareStatement("INSERT INTO tb01_user VALUES (?, ?, ?, ?)");

System.out.println(pstmt);

pstmt.setString(1, user_id);
pstmt.setString(2, user_pw);
pstmt.setString(3, user_name);
pstmt.setString(4, user_level);

int result = pstmt.executeUpdate();
System.out.println(result);

pstmt.close();
conn.close();

response.sendRedirect(request.getContextPath()+"/user_search/user_search_list.jsp");
%>