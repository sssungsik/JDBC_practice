<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%
request.setCharacterEncoding("euc-kr");
String mid = request.getParameter("mid");
String mpw = request.getParameter("mpw");
System.out.println(mid + "<-- mid login_action.jsp");
System.out.println(mpw + "<-- mpw login_action.jsp");
//����ڰ� �Է��� ���̵�� ���
//1�� ȸ�� ����(���Ŀ��� DB�� ����� ȸ��)
String dbid = "id001";
String dbpw = "pw001";
String dblevel = "������";	//�׽�Ʈ ���� : ������ or �Ǹ��� or ������
String dbname = "ȫ01";
String dbemail = "test01";
String msg = null;
if(mid.equals(dbid)){
	System.out.println("1-1 ���̵� ��ġ ����");
	if(mpw.equals(dbpw)){
		System.out.println("2-1 �α��� ���� ����");	
		//session �� ����(���̵�,����,�̸�)
		session.setAttribute("S_ID", dbid);
		session.setAttribute("S_LEVEL", dblevel);
		session.setAttribute("S_NAME", dbname);
		//response.sendRedirect(request.getContextPath()+"/index.jsp");
		msg = "�α��� ����";
	}else{
		System.out.println("2-2 ��� ����ġ ����");
		msg = "��� ����ġ";
	}
}else{
	System.out.println("1-2 ���̵� ����ġ ����");
	msg = "���̵� ����ġ";
}
%>
<script type="text/javascript">
	alert('<%= msg %>');
	location.href='<%= request.getContextPath()%>/index.jsp';
</script>

