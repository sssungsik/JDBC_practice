<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.SQLException" %>
    
   

 <%
 	request.setCharacterEncoding("UTF-8");
 	Connection conn = null;
 	PreparedStatement pstmt = null;
 // 콘솔출력
 	String u_id = request.getParameter("u_id");
 	String u_pw = request.getParameter("u_pw");
 	String u_level = request.getParameter("u_level");
 	String u_name = request.getParameter("u_name");
 	String u_email = request.getParameter("u_email");
 	String u_phone = request.getParameter("u_phone");
 	String u_addr = request.getParameter("u_addr");
 	
	System.out.println(u_id + "<-- u_id /minsert/m_insert_pro.jsp");
	System.out.println(u_pw + "<-- u_pw /minsert/m_insert_pro.jsp");
	System.out.println(u_level + "<-- u_level /minsert/m_insert_pro.jsp");
	System.out.println(u_name + "<-- u_name /minsert/m_insert_pro.jsp");
	System.out.println(u_email + "<-- u_email /minsert/m_insert_pro.jsp");
	System.out.println(u_phone + "<-- u_phone /minsert/m_insert_pro.jsp");
	System.out.println(u_addr + "<-- u_addr /minsert/m_insert_pro.jsp");
	
	
// JDBC 01
	Class.forName("com.mysql.jdbc.Driver");
// JDBC 02
	String jdbcDriver = "jdbc:mysql://localhost:3306/db04css?" + "useUnicode=true&characterEncoding=euckr";
	String dbUser = "dbid04css";
	String dbPass = "dbpw04css";
	conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
	System.out.println(conn + "<-- conn");
	
// JDBC 03
	pstmt = conn.prepareStatement("INSERT INTO tb_user VALUES (?, ?, ?, ?, ?, ?, ?)"); 
	System.out.println(pstmt + " : (pstmt - 1)");
	
	pstmt.setString(1, u_id);
	pstmt.setString(2, u_pw);
	pstmt.setString(3, u_level);
	pstmt.setString(4, u_name);
	pstmt.setString(5, u_email);
	pstmt.setString(6, u_phone);
	pstmt.setString(7, u_addr);
	System.out.println(pstmt + " : (pstmt - 2)");

// JDBC 04
	int result = pstmt.executeUpdate();
	System.out.println(result + "<-- result");
	
pstmt.close();
conn.close();

%>

 	