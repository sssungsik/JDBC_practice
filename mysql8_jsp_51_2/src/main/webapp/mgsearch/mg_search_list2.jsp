<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<!-- <link rel="stylesheet" type="text/css" href="/layoutMG/css/main.css" /> -->
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/main.css" />
<style>
table {
  font-family: arial, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

td, th {
  border: 1px solid #dddddd;
  text-align: left;
  padding: 8px;
}

tr:nth-child(even) {
  background-color: #dddddd;
}
</style>
</head>

<body>
<%@ include file="/module/top.jsp" %>
<%@ include file="/module/left.jsp" %>
<%@ include file="/mgsearch/mg_search_form2.jsp" %>
��ǰ ����Ʈ(ȸ�����̺�� join�˻�1) <br>
<table width="100%" border="1">
<tr>
	<td>���̵�</td><td>�̸�</td><td>��ǰ�ڵ�</td><td>��ǰ��</td><td>�з�</td><td>����</td><td>����</td><td>������</td><td>�����</td><td>��</td><td>����</td><td>����</td>
</tr>
<%
request.setCharacterEncoding("euc-kr");	//post�ѱ�ó��

String searchName = request.getParameter("userName");
System.out.println(searchName + "�Է��� �̸�");

Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;
Class.forName("com.mysql.jdbc.Driver");
String selectQuery1="select tb_member.*, tb_goods.* " + "from tb_member inner join tb_goods on tb_member.m_id = tb_goods.m_id " + "order by g_date desc";
System.out.println(selectQuery1 + "<- selectQuery1 ");

String selectQuery2="select tb_member.*, tb_goods.* " + "from tb_member inner join tb_goods on tb_member.m_id = tb_goods.m_id " + "where m_name = ? " + "order by g_date desc";
System.out.println(selectQuery2 + "<- selectQuery2 ");
try{
	String jdbcDriver = "jdbc:mysql://192.168.10.17:3306/dev51db?" +
			"useUnicode=true&characterEncoding=euckr";
	String dbUser = "dev51id";
	String dbPass = "dev51pw";
	conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
//02�ܰ� :DB����(Connection)��
	System.out.println(conn + "<-- conn ");
//�������� �غ� �ܰ� : �پ��� ���ǹ��� �ۼ� �ϸ� ��!~~~~~~~~~~~	
	if(searchName==""){
		pstmt = conn.prepareStatement(selectQuery1);
		System.out.println("���� 1 ���� �� �Էµ�. ��ü�˻�.");
	}else{
		pstmt = conn.prepareStatement(selectQuery2);
		pstmt.setString(1, searchName);
		System.out.println("���� 2 ���� �� ����.");
		
	}
	
//�������� �غ� �ܰ� : �پ��� ���ǹ��� �ۼ� �ϸ� ��!~~~~~~~~~~~	

	rs = pstmt.executeQuery();
	System.out.println(rs + "<-- rs m_search_form.jsp");
	//System.out.println(rs.next() + "<-- rs.next() m_search_form.jsp");
	while(rs.next()){
		System.out.println("while �ݺ� Ƚ��");
%>		
		
		<tr>
		<td><%= rs.getString("m_id")%></td>
		<td><%= rs.getString("m_name")%></td>
		
		<td><%= rs.getString("g_code")%></td>
		<td><%= rs.getString("g_name")%></td>
		<td><%= rs.getString("g_cate")%></td>
		<td><%= rs.getString("g_price")%></td>
		<td><%= rs.getString("g_color")%></td>
		<td><%= rs.getString("g_size")%></td>
		<td><%= rs.getString("g_date")%></td>
		<td><%= rs.getString("g_desc")%></td>
		<td>
<a href="<%= request.getContextPath() %>/goods/goods_update_form.jsp?send_id=<%= rs.getString("g_code")%>">������ư</a>			
		</td>
		<td>
<a href="<%= request.getContextPath() %>/goods/goods_update_form.jsp?send_id=<%= rs.getString("g_code")%>">������ư</a>			
		</td>
	</tr>			
<%		
	}		
		
} catch(SQLException ex) {
	out.println(ex.getMessage());
	ex.printStackTrace();
} finally {
	// 6. ����� Statement ����
	if (rs != null) try { rs.close(); } catch(SQLException ex) {}
	if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
	
	// 7. Ŀ�ؼ� ����
	if (conn != null) try { conn.close(); } catch(SQLException ex) {}
}
%>
</table>			 
<%@ include file="/module/hadan.jsp" %>

</body>
</html>
