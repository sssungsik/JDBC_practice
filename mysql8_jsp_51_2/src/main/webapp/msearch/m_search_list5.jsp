<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>
<%@ include file="/msearch/m_search_form.jsp" %>
ȸ�� �˻� <br>
<table width="100%" border="1">
<tr>
	<td>���̵�</td><td>���</td><td>����</td><td>�̸�</td><td>�̸���</td><td>����</td><td>����</td>
</tr>
<%
request.setCharacterEncoding("euc-kr");
String sk = request.getParameter("sk");
String sv = request.getParameter("sv");
System.out.println(sk + "<-- sk m_search_list.jsp");
System.out.println(sv + "<-- sv m_search_list.jsp");

Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;
Class.forName("com.mysql.jdbc.Driver");

try{
	String jdbcDriver = "jdbc:mysql://192.168.10.17:3306/dev51db?" +
			"useUnicode=true&characterEncoding=euckr";
	String dbUser = "dev51id";
	String dbPass = "dev51pw";
	conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
	System.out.println(conn + "<-- conn m_search_list.jsp");
	if(sk == null && sv == null){
		System.out.println("1. sk,sv ������ ��� �� null ����");	
		pstmt = conn.prepareStatement("select * from tb_member");
	}else if(sk != null && sv.equals("")){
		System.out.println("2. sk��null�ƴϰ� sv�� ���� ����");
		pstmt = conn.prepareStatement("select * from tb_member");
	}else if(sk != null && sv != null){
		System.out.println("3-1. m_id ����");
		pstmt = conn.prepareStatement("SELECT * FROM tb_member WHERE "+ sk + "=?");
		pstmt.setString(1, sv);
	}
	//System.out.println(pstmt + "<-- pstmt m_search_list.jsp");
	out.println(pstmt + "<-- pstmt m_search_list.jsp");
	
	rs = pstmt.executeQuery();
	System.out.println(rs + "<-- rs m_list.jsp");
//com.mysql.cj.jdbc.result.ResultSetImpl@5043c656<-- rs m_list.jsp
	while(rs.next()){
		//System.out.println("select ���� ���� ��� �� �� ���ñ�?");
%>
<!-- ȭ�� ��ġ ���� -->
		<tr>
			<td><%= rs.getString("m_id")%></td>
			<td><%= rs.getString("m_pw")%></td>
			<td><%= rs.getString("m_level")%></td>
			<td><%= rs.getString("m_name")%></td>
			<td><%= rs.getString("m_email")%></td>
			<td>
<a href="<%= request.getContextPath() %>/mupdate/m_update_form.jsp?send_id=<%= rs.getString("m_id")%>">������ư</a>			
			</td>
			<td>
<a href="<%= request.getContextPath() %>/mdelete/m_delete_action.jsp?send_id=<%= rs.getString("m_id")%>">������ư</a>			
			</td>
			
		</tr>
<!-- ȭ�� ��ġ �� -->		
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

//m_list.jsp ����
//1�ܰ� : 
//2�ܰ� : 
//3�ܰ� : ���� ���� �غ� �ܰ� ( ���Ǻ��� ���� �غ� �ϼ� )
//--------------------------------------------
//4�ܰ� : ���� ����
//5�ܰ� : ���� ���� �� ��� ���
//6,7�ܰ� : ��ü ����
%>
</table>




