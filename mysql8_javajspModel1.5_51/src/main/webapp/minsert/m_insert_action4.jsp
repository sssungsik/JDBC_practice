<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.SQLException" %>
<%@ page import = "kr.or.ksmart.driverdb.DriverDB" %>

<% request.setCharacterEncoding("euc-kr"); %>
<jsp:useBean id="m" class="kr.or.ksmart.dto.Member"/>
<jsp:setProperty name="m" property="*"/>

<%
Connection conn = null;
PreparedStatement pstmt = null;
DriverDB db = new DriverDB();
conn = db.driverDbcon();
System.out.println(conn + "<-- conn");
System.out.println(m + "<-- m");
pstmt = conn.prepareStatement("INSERT INTO tb_member VALUES (?, ?, ?, ?, ?)"); 
pstmt.setString(1, m.getM_id());
pstmt.setString(2, m.getM_pw());
pstmt.setString(3, m.getM_level());
pstmt.setString(4, m.getM_name());
pstmt.setString(5, m.getM_email());
System.out.println(pstmt + "<-- pstmt-2");
int result = pstmt.executeUpdate(); //4단계 : 쿼리 실행
System.out.println(result + "<-- result");
pstmt.close();
conn.close();

response.sendRedirect(request.getContextPath()+"/msearch/m_search_list.jsp");

%>





















