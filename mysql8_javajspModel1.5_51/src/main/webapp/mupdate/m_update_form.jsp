<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>
<%@ page import = "kr.or.ksmart.driverdb.DriverDB" %>
<%@ page import = "kr.or.ksmart.dao.Mdao" %>
<%@ page import = "kr.or.ksmart.dto.Member" %>
<%
String send_id = request.getParameter("send_id");	//��)String send_id="id004"
System.out.println(send_id + "<-- send_id m_update_form.jsp");


Mdao mdao = new Mdao();
Member m = mdao.mSelectforUpdate(send_id);
System.out.println(m + " !!!m!!!");
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
<form action="<%= request.getContextPath() %>/mupdate/m_update_action.jsp" method="post">
<table border="1">
<tr>
	<td>���̵�</td>
	<td><input type="text" name="m_id" size="20" readonly value="<%= m.getM_id() %>"></td>
<tr>
<tr>
	<td>��ȣ</td>
	<td><input type="text" name="m_pw" size="20" value="<%= m.getM_pw() %>"></td>
<tr>
<tr>
	<td>����</td>
	<td><input type="text" name="m_level" size="20" value="<%= m.getM_level() %>"></td>
<tr>
<tr>
	<td>�̸�</td>
	<td><input type="text" name="m_name" size="20" value="<%= m.getM_name() %>"></td>
<tr>
<tr>
	<td>�̸���</td>
	<td><input type="text" name="m_email" size="20" value="<%= m.getM_email() %>"></td>
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