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
System.out.println(send_id + "<-- send_id");
Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;
Class.forName("com.mysql.jdbc.Driver");
//�Ѹ��� ȸ�� ������ ���� �� ���� ����
//�Ѹ��� ȸ�� ������ ���� �� �ִ� �ٸ� �����?


String dbgCode = null;
String dbgName = null;
String dbgCate = null;
String dbgPrice = null;
String dbgColor = null;
String dbgSize = null;
String dbgDate = null;
String dbgDesc = null;


try{
	String jdbcDriver = "jdbc:mysql://192.168.10.17:3306/dev51db?" +
			"useUnicode=true&characterEncoding=euckr";
	String dbUser = "dev51id";
	String dbPass = "dev51pw";
	conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
	System.out.println(conn + "<-- conn");
	pstmt = conn.prepareStatement("SELECT * FROM tb_goods WHERE g_code=?");
	pstmt.setString(1, send_id);
	System.out.println(pstmt + "<-- pstmt m_update_form.jsp");
	rs = pstmt.executeQuery();
	System.out.println(rs + "<-- rs m_update_form.jsp");
	//System.out.println(rs.next() + "<-- rs.next() m_update_form.jsp");
	if(rs.next()){
		System.out.println("if���ǹ� ���ǽ� true�� ��� ���� m_update_form.jsp");
		dbgCode = rs.getString("g_code");
		dbgName = rs.getString("g_name");
		dbgCate = rs.getString("g_cate");
		dbgPrice = rs.getString("g_price");
		dbgColor = rs.getString("g_color");
		
		dbgSize = rs.getString("g_size");	
		dbgDate = rs.getString("g_date");	
		dbgDesc = rs.getString("g_desc");	
		
		
		
		System.out.println(dbgCode + "<--dbgCode");
		System.out.println(dbgName + "<--dbgName");
		System.out.println(dbgCate + "<-- dbgCate");
		System.out.println(dbgPrice + "<-- dbgPrice");
		System.out.println(dbgColor + "<-- dbgColor");
		
		System.out.println(dbgSize + "<-- dbgSize");
		System.out.println(dbgDate + "<-- dbgDate");
		System.out.println(dbgDesc + "<-- dbgDesc");
		
		
		
		
	}
} catch(SQLException ex) {
	out.println(ex.getMessage());
	ex.printStackTrace();
} finally {
	if (rs != null) try { rs.close(); } catch(SQLException ex) {}
	if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
	if (conn != null) try { conn.close(); } catch(SQLException ex) {}
}

//���� ���� : m_list.jsp / m_insert_form.jsp / m_insert_action.jsp
//1�ܰ� : ����̹��ε� 2�ܰ� : DB����
//3�ܰ� : ���� ���� �غ� SELECT * FROM tb_member WHERE m_id='id005'
//			SELECT * FROM tb_member WHERE m_id=?
//4�ܰ� : ���� ���� 
//5�ܰ� : ���� ���� �� ��� ��� : ����ȭ�鿡 �ѷ��ش�.
//6,7�ܰ� : ��ü ����
%>
<!-- 1�� ��� : ����ȭ�� ����  m_insert_form.jsp : ����ȭ��� ��� -->
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/main.css" />
</head>
<body>
<%@ include file="/module/top.jsp" %>
<%@ include file="/module/left.jsp" %>
<form action="<%= request.getContextPath() %>/goods/goods_update_action.jsp" method="post">
<table border="1">
<tr>
	<td>��ǰ�ڵ�</td>
	<td><input type="text" name="dbgCode" size="20" readonly value="<%= dbgCode %>"></td>
<tr>
<tr>
	<td>��ǰ�̸�</td>
	<td><input type="text" name="dbgName" size="20" value="<%= dbgName %>"></td>
<tr>
<tr>
	<td>�з�</td>
	<td><input type="text" name="dbgCate" size="20" value="<%= dbgCate %>"></td>
<tr>
<tr>
	<td>����</td>
	<td><input type="text" name="dbgPrice" size="20" value="<%= dbgPrice %>"></td>
<tr>
<tr>
	<td>����</td>
	<td><input type="text" name="dbgColor" size="20" value="<%= dbgColor %>"></td>
<tr>
<tr>
	<td>ũ��</td>
	<td><input type="text" name="dbgSize" size="20" value="<%= dbgSize %>"></td>
<tr>
<tr>
	<td>��¥</td>
	<td><input type="text" name="dbgDate" size="20" value="<%= dbgDate %>"></td>
<tr>
<tr>
	<td>����</td>
	<td><input type="text" name="dbgDesc" size="20" value="<%= dbgDesc %>"></td>
<tr>



<tr>
	<td colspan="4"><input type="submit" value="ȸ��������ư"></td>
</tr>
</table>
</form> 
<%@ include file="/module/hadan.jsp" %>

</body>
</html>
<!-- 1�� ��� : ����ȭ�� �� -->