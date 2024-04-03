<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.SQLException"%>

<%
// post방식 한글 처리 방법
request.setCharacterEncoding("UTF-8");

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


//---------------JDBC 순서 시작------------

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


//03단계 :Query실행을 위한 statement 또는 prepareStatement객체생성 시작

	// DB에서 INSERT 쿼리 테스트 후 붙여넣기
	pstmt = conn.prepareStatement("INSERT INTO tb_member VALUES (?,?,?,?,?)"); // 자리 
	System.out.println(pstmt + " : (pstmt - 1)");
	
	pstmt.setString(1, m_id); // 1번째 자리, m_id 할당
	pstmt.setString(2, m_pw);
	pstmt.setString(3, m_level);
	pstmt.setString(4, m_name);
	pstmt.setString(5, m_email);
	System.out.println(pstmt + " : (pstmt - 2)");
	
//03단계 : 종료


//04단계 : Query 실행 시작
	
	// 준비된 INSERT,UPDATE,DELETE 쿼리는 excuteUpdate메서드로 실행
	int result = pstmt.executeUpdate();
	System.out.println(result + "<-- result");
//04단계 : 종료

	
pstmt.close();
conn.close();

%>