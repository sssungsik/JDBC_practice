<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.SQLException" %>

<%
//post방식 한글 처리 방법
request.setCharacterEncoding("UTF-8");
Connection conn = null;
PreparedStatement pstmt = null;

String m_code = request.getParameter("m_code"); //String m_id = "id008";
String m_name = request.getParameter("m_name");
String m_price = request.getParameter("m_price");
String m_comp = request.getParameter("m_comp");
String m_formul = request.getParameter("m_formul");
String m_stock = request.getParameter("m_stock");
System.out.println(m_code + "<-- m_code");
System.out.println(m_name + "<-- m_name ");
System.out.println(m_price + "<-- m_price ");
System.out.println(m_comp + "<-- m_comp ");
System.out.println(m_formul + "<-- m_formul");
System.out.println(m_stock + "<-- m_stock ");

Class.forName("com.mysql.jdbc.Driver");
String jdbcDriver = "jdbc:mysql://192.168.10.6:3306/dev51db?" +
		"useUnicode=true&characterEncoding=euckr";
String dbUser = "dev51id";
String dbPass = "dev51pw";

conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
System.out.println(conn + "<-- conn");

pstmt = conn.prepareStatement("INSERT INTO tb01_medicine VALUES (?, ?, ?, ?, ?, ?)"); 

System.out.println(pstmt + "<-- pstmt-1");

pstmt.setString(1, m_code);
pstmt.setString(2, m_name);
pstmt.setString(3, m_price);
pstmt.setString(4, m_comp);
pstmt.setString(5, m_formul);
pstmt.setString(6, m_stock);
System.out.println(pstmt + "<-- pstmt-2");

//여기까지가 3단계 : 쿼리 실행 준비 완료!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
int result = pstmt.executeUpdate(); //4단계 : 쿼리 실행
System.out.println(result + "<-- result");
//1<-- result
pstmt.close();
conn.close();

response.sendRedirect(request.getContextPath()+"/msearch/medicine_search_list.jsp");

%>





















