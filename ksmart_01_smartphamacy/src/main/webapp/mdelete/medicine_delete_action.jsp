<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.SQLException" %>
<%@ page import = "java.sql.ResultSet" %>

<%
String S_ID = (String)session.getAttribute("S_ID");
String S_LEVEL = (String)session.getAttribute("S_LEVEL");
String send_code = request.getParameter("send_code");	
System.out.println(send_code + "<-- 샌드코드");
System.out.println(S_ID + "<-- ID");
System.out.println(S_LEVEL + "<-- LEVEL");
Connection conn = null;
PreparedStatement pstmt = null;
PreparedStatement pstmtChk = null;
ResultSet rs = null;
Class.forName("com.mysql.jdbc.Driver");
String jdbcDriver = "jdbc:mysql://192.168.10.6:3306/dev51db?" +
		"useUnicode=true&characterEncoding=euckr";
String dbUser = "dev51id";
String dbPass = "dev51pw";

conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
System.out.println(conn + "<-- conn");

pstmtChk = conn.prepareStatement("SELECT m.m_seller_id " +
		"FROM tb01_medicine AS m " +
		"WHERE m.m_code = ?");
pstmtChk.setString(1, send_code);
System.out.println(pstmtChk + " <--pstmtChk");
rs = pstmtChk.executeQuery();

pstmt = conn.prepareStatement("DELETE FROM tb01_medicine WHERE m_code=?"); 
pstmt.setString(1, send_code);
System.out.println(pstmt);

String chkId = null;
while(rs.next()){
	chkId = rs.getString("m_seller_id");
	System.out.println(chkId + " <--chkId");
}

if(S_ID.equals(chkId) || S_LEVEL.equals("관리자")){
	pstmt.executeUpdate();
}else{
	%>
	<script>
		alert('지울 수 없습니다. 자사 제품인지 확인해주세요.');
	</script>
	<%
}

pstmtChk.close();
pstmt.close();
conn.close();
response.sendRedirect(request.getContextPath()+"/msearch/medicine_search_list.jsp");
%>
