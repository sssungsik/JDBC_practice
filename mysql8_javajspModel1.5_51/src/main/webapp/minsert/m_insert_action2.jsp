<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.SQLException" %>
<%@ page import = "kr.or.ksmart.driverdb.DriverDB" %>
<%
//post��� �ѱ� ó�� ���
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

DriverDB db = new DriverDB();
conn = db.driverDbcon();
System.out.println(conn + "<-- conn");
//com.mysql.cj.jdbc.ConnectionImpl@568e730b<-- conn
pstmt = conn.prepareStatement("INSERT INTO tb_member VALUES (?, ?, ?, ?, ?)"); 
//DB���� insert���� �׽�Ʈ �� �ٿ��ֱ�
//INSERT INTO tb_member VALUES ('id007', 'pw007', '������', 'ĥ�浿', 'email7')
System.out.println(pstmt + "<-- pstmt-1");
//com.mysql.cj.jdbc.ClientPreparedStatement: 
//INSERT INTO tb_member VALUES (** NOT SPECIFIED **, ** NOT SPECIFIED **, ** NOT SPECIFIED **, ** NOT SPECIFIED **, ** NOT SPECIFIED **)<-- pstmt-1
pstmt.setString(1, m_id);
pstmt.setString(2, m_pw);
pstmt.setString(3, m_level);
pstmt.setString(4, m_name);
pstmt.setString(5, m_email);
System.out.println(pstmt + "<-- pstmt-2");
//com.mysql.cj.jdbc.ClientPreparedStatement: 
//	INSERT INTO tb_member VALUES ('1', '2', '������', '4', '5')<-- pstmt-2
//��������� 3�ܰ� : ���� ���� �غ� �Ϸ�!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
int result = pstmt.executeUpdate(); //4�ܰ� : ���� ����
System.out.println(result + "<-- result");
//1<-- result
pstmt.close();
conn.close();

response.sendRedirect(request.getContextPath()+"/msearch/m_search_list.jsp");

%>





















