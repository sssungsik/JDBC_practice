<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.SQLException"%>

<%
// post방식 한글 처리 방법
request.setCharacterEncoding("euc-kr");


Connection conn = null;
PreparedStatement pstmt = null;

// 화면에서 입력자료 받아서 콘솔창에 출력 시작
String m_id = request.getParameter("m_id");
String m_pw = request.getParameter("m_pw");
String m_level = request.getParameter("m_level");
String m_name = request.getParameter("m_name");
String m_email = request.getParameter("m_email");
System.out.println(m_id + "<-- m_id /minsert/m_insert_pro.jsp");
System.out.println(m_pw + "<-- m_pw /minsert/m_insert_pro.jsp");
System.out.println(m_level + "<-- m_level /minsert/m_insert_pro.jsp");
System.out.println(m_name + "<-- m_name /minsert/m_insert_pro.jsp");
System.out.println(m_email + "<-- m_email /minsert/m_insert_pro.jsp");
// 화면에서 입력자료 받아서 콘솔창에 출력 끝
	// 01단계 : 드라이버 로딩 시작
	Class.forName("com.mysql.jdbc.Driver");
	// 01단계 : 드라이버 로딩 끝

//02단계 :DB연결(Connection)시작
		String jdbcDriver = "jdbc:mysql://localhost:3306/dev51db?" +
				"useUnicode=true&characterEncoding=euckr";
		String dbUser = "dev51id";
		String dbPass = "dev51pw";
		
		conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		System.out.println(conn + "<-- conn");
		
// 02 단계 :DB연결(Connection)끝
%>