<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.SQLException" %>

<%
String send_id = request.getParameter("send_id");	//예)String send_id="id004"
System.out.println(send_id + "<-- send_id m_delete_action.jsp");
Connection conn = null;
PreparedStatement pstmt = null;
Class.forName("com.mysql.jdbc.Driver");
String jdbcDriver = "jdbc:mysql://192.168.10.6:3306/dev51db?" +
		"useUnicode=true&characterEncoding=utf-8";
String dbUser = "dev51id";
String dbPass = "dev51pw";

conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
System.out.println(conn + "<-- conn");

pstmt = conn.prepareStatement("DELETE FROM tb01_user WHERE user_id=?"); 
pstmt.setString(1, send_id);
pstmt.executeUpdate();
pstmt.close();
conn.close();
response.sendRedirect(request.getContextPath()+"/user_search/user_search_list.jsp");
%>
