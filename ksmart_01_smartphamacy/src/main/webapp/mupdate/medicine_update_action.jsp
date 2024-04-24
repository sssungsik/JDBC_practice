<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.SQLException" %>

<%
//post방식 한글 처리 방법
request.setCharacterEncoding("UTF-8");
String m_code = request.getParameter("m_code"); //String m_id = "id008";
String m_name = request.getParameter("m_name");
String m_price = request.getParameter("m_price");
String m_comp = request.getParameter("m_comp");
String m_formul = request.getParameter("m_formul");
String m_stock = request.getParameter("m_stock");


Connection conn = null;
PreparedStatement pstmt = null;
Class.forName("com.mysql.jdbc.Driver");
String jdbcDriver = "jdbc:mysql://192.168.10.6:3306/dev51db?" +
		"useUnicode=true&characterEncoding=euckr";
String dbUser = "dev51id";
String dbPass = "dev51pw";

conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
System.out.println(conn + "<-- conn");

pstmt = conn.prepareStatement("UPDATE tb01_medicine SET m_name=?,m_price=?,m_formul=?,m_stock=? WHERE m_code=?"); 
pstmt.setString(1, m_name);
pstmt.setString(2, m_price);
pstmt.setString(3, m_comp);
pstmt.setString(4, m_formul);
pstmt.setString(5, m_stock);
pstmt.setString(6, m_code);
System.out.println(pstmt + "<-- pstmt");
pstmt.executeUpdate();
pstmt.close();
conn.close();
response.sendRedirect(request.getContextPath()+"/msearch/medicine_search_list.jsp");
%>






