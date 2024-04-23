<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>

<%
request.setCharacterEncoding("euc-kr");
String mid = request.getParameter("mid");
String mpw = request.getParameter("mpw");
System.out.println(mid + "<-- mid login_action.jsp");
System.out.println(mpw + "<-- mpw login_action.jsp");

Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;
Class.forName("com.mysql.jdbc.Driver");

String dbid = null;
String dbpw = null;
String dblevel = null;
String dbname = null;
String dbemail = null;
String msg = null;
try{
	String jdbcDriver = "jdbc:mysql://192.168.10.17:3306/dev51db?" +
			"useUnicode=true&characterEncoding=euckr";
	String dbUser = "dev51id";
	String dbPass = "dev51pw";
	conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
	System.out.println(conn + "<-- conn login_action.jsp");
	pstmt = conn.prepareStatement("SELECT * FROM tb_member WHERE m_id=?");
	pstmt.setString(1, mid);
	System.out.println(pstmt + "<-- pstmt login_action.jsp");
	rs = pstmt.executeQuery();
	System.out.println(rs + "<-- rs login_action.jsp");
	//System.out.println(rs.next() + "<-- rs.next() m_update_form.jsp");
	if(rs.next()){			//<---------- ���̵� ��ġ ����
		System.out.println("1-1 ���̵� ��ġ ����");
		dbid = rs.getString("m_id");
		dbpw = rs.getString("m_pw");
		dblevel = rs.getString("m_level");
		dbname = rs.getString("m_name");
		dbemail = rs.getString("m_email");	
		System.out.println(dbid + "<-- dbid login_action.jsp");
		System.out.println(dbpw + "<-- dbpw login_action.jsp");
		System.out.println(dblevel + "<-- dblevel login_action.jsp");
		System.out.println(dbname + "<-- dbname login_action.jsp");
		System.out.println(dbemail + "<-- dbemail login_action.jsp");
		if(mpw.equals(dbpw)){
			System.out.println("2-1 �α��� ���� ����");	
			session.setAttribute("S_ID", dbid);
			session.setAttribute("S_LEVEL", dblevel);
			session.setAttribute("S_NAME", dbname);
			msg = "�α��� ����";
		}else{
			System.out.println("2-2 ��� ����ġ ����");
			msg = "��� ����ġ";
		}
	}else{
		System.out.println("1-2 ���̵� ����ġ ����");
		msg = "���̵� ����ġ";
	}
} catch(SQLException ex) {
	out.println(ex.getMessage());
	ex.printStackTrace();
} finally {
	if (rs != null) try { rs.close(); } catch(SQLException ex) {}
	if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
	if (conn != null) try { conn.close(); } catch(SQLException ex) {}
}
%>
<script type="text/javascript">
	alert('<%= msg %>');
	location.href='<%= request.getContextPath()%>/index.jsp';
</script>







