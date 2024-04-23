<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>
<%
String send_id = request.getParameter("send_id");
System.out.println(send_id + "<-- send_id m_update_form.jsp");
Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;
Class.forName("com.mysql.jdbc.Driver");
//한명의 회원 정보를 저장 할 변수 선언
String dbid = null;
String dbpw = null;
String dblevel = null;
String dbname = null;
String dbemail = null;

try{
	String jdbcDriver = "jdbc:mysql://192.168.10.17:3306/dev51db?" +
			"useUnicode=true&characterEncoding=euckr";
	String dbUser = "dev51id";
	String dbPass = "dev51pw";
	conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
	System.out.println(conn + "<-- conn m_update_form.jsp");
	pstmt = conn.prepareStatement("SELECT * FROM tb_member WHERE m_id=?");
	pstmt.setString(1, send_id);
	System.out.println(pstmt + "<-- pstmt m_update_form.jsp");
	rs = pstmt.executeQuery();
	System.out.println(rs + "<-- rs m_update_form.jsp");
	//System.out.println(rs.next() + "<-- rs.next() m_update_form.jsp");
	if(rs.next()){
		System.out.println("if조건문 조건식 true일 경우 실행 m_update_form.jsp");
		dbid = rs.getString("m_id");
		dbpw = rs.getString("m_pw");
		dblevel = rs.getString("m_level");
		dbname = rs.getString("m_name");
		dbemail = rs.getString("m_email");	
		System.out.println(dbid + "<-- dbid m_update_form.jsp");
		System.out.println(dbpw + "<-- dbpw m_update_form.jsp");
		System.out.println(dblevel + "<-- dblevel m_update_form.jsp");
		System.out.println(dbname + "<-- dbname m_update_form.jsp");
		System.out.println(dbemail + "<-- dbemail m_update_form.jsp");
%>
<!-- 1번 방법 : 수정화면 시작  m_insert_form.jsp : 수정화면과 비슷 -->
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<form action="<%= request.getContextPath() %>/minsert/m_insert_action.jsp" method="post">
<table border="1">
<tr>
	<td>아이디</td>
	<td><input type="text" name="m_id" size="20" readonly value="<%= dbid %>"></td>
<tr>
<tr>
	<td>암호</td>
	<td><input type="text" name="m_pw" size="20" value="<%= dbpw %>"></td>
<tr>
<tr>
	<td>권한</td>
	<td><input type="text" name="m_level" size="20" value="<%= dblevel %>"></td>
<tr>
<tr>
	<td>이름</td>
	<td><input type="text" name="m_name" size="20" value="<%= dbname %>"></td>
<tr>
<tr>
	<td>이메일</td>
	<td><input type="text" name="m_email" size="20" value="<%= dbemail %>"></td>
<tr>
<tr>
	<td colspan="4"><input type="submit" value="회원수정버튼"></td>
</tr>
</table>
</form>
</body>
</html>
<!-- 1번 방법 : 수정화면 끝 -->
<%
	}
} catch(SQLException ex) {
	out.println(ex.getMessage());
	ex.printStackTrace();
} finally {
	if (rs != null) try { rs.close(); } catch(SQLException ex) {}
	if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
	if (conn != null) try { conn.close(); } catch(SQLException ex) {}
}

//참고 파일 : m_list.jsp / m_insert_form.jsp / m_insert_action.jsp
//1단계 : 드라이버로딩 2단계 : DB연결
//3단계 : 쿼리 실행 준비 SELECT * FROM tb_member WHERE m_id='id005'
//			SELECT * FROM tb_member WHERE m_id=?
//4단계 : 쿼리 실행 
//5단계 : 쿼리 실행 후 결과 사용 : 수정화면에 뿌려준다.
//6,7단계 : 객체 종료
%>
