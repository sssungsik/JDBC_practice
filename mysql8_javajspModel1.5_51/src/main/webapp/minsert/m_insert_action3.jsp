<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.SQLException" %>
<%@ page import = "kr.or.ksmart.driverdb.DriverDB" %>
<%@ page import = "kr.or.ksmart.dto.Member" %>

<%
//post规侥 茄臂 贸府 规过
request.setCharacterEncoding("euc-kr");
Connection conn = null;
PreparedStatement pstmt = null;

String m_id = request.getParameter("m_id"); //String m_id = "id008";
String m_pw = request.getParameter("m_pw");
String m_level = request.getParameter("m_level");
String m_name = request.getParameter("m_name");
String m_email = request.getParameter("m_email");
System.out.println(m_id + "<-- m_id /minsert/m_insert_pro.jsp");
System.out.println(m_pw + "<-- m_pw /minsert/m_insert_pro.jsp");
System.out.println(m_level + "<-- m_level /minsert/m_insert_pro.jsp");
System.out.println(m_name + "<-- m_name /minsert/m_insert_pro.jsp");
System.out.println(m_email + "<-- m_email /minsert/m_insert_pro.jsp");
Member m = new Member();
m.setM_id(m_id);
m.setM_pw(m_pw);
m.setM_level(m_level);
m.setM_name(m_name);
m.setM_email(m_email);
System.out.println(m + "<- m ");

DriverDB db = new DriverDB();
conn = db.driverDbcon();
System.out.println(conn + "<-- conn");
pstmt = conn.prepareStatement("INSERT INTO tb_member VALUES (?, ?, ?, ?, ?)"); 
pstmt.setString(1, m.getM_id());
pstmt.setString(2, m.getM_pw());
pstmt.setString(3, m.getM_level());
pstmt.setString(4, m.getM_name());
pstmt.setString(5, m.getM_email());
System.out.println(pstmt + "<-- pstmt-2");
int result = pstmt.executeUpdate(); //4窜拌 : 孽府 角青
System.out.println(result + "<-- result");
pstmt.close();
conn.close();

response.sendRedirect(request.getContextPath()+"/msearch/m_search_list.jsp");

%>





















