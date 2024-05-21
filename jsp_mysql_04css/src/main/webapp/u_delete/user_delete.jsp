<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.SQLException" %>

    
<% 
 	String sendId = request.getParameter("sendId");
	request.setCharacterEncoding("UTF-8");
 	Connection conn = null;
 	PreparedStatement pstmt = null;
	try{
		Class.forName("com.mysql.jdbc.Driver");
		String jdbcDriver = "jdbc:mysql://localhost:3306/db04css?" + "useUnicode=true&characterEncoding=euckr";
		String dbUser = "dbid04css";
		String dbPass = "dbpw04css";
		conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		System.out.println(conn + "<-- conn user_list.jsp");
		
		pstmt = conn.prepareStatement("DELETE FROM tb_user WHERE u_id = ?");
		pstmt.setString(1, sendId);
	
		
		int result = pstmt.executeUpdate();
	}catch(SQLException ex) {
		out.println(ex.getMessage());
		ex.printStackTrace();
	} finally {
	
		if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
		if (conn != null) try { conn.close(); } catch(SQLException ex) {}
	}
%>
<script language = "javascript">
location.replace("../minsert/user_list.jsp");
</script>
 	
 	