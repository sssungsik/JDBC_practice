<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="/msearch/m_search_form.jsp" %>
<%
request.setCharacterEncoding("euc-kr");
String sk = request.getParameter("sk");
String sv = request.getParameter("sv");
System.out.println(sk + "<-- sk ");
System.out.println(sv + "<-- sv ");
//3�ܰ� : ���� ���� �غ� �ܰ�
if(sk == null && sv == null){
	System.out.println("1. sk,sv ������ ��� �� null ����");	
	//SELECT * FROM tb_member
}else if(sk != null && sv.equals("")){
	System.out.println("2. sk��null�ƴϰ� sv�� ���� ����");
	//SELECT * FROM tb_member
}else if(sk != null && sv != null){
	System.out.println("3. sk,sv�� null �ƴ� ����");
	if(sk.equals("m_id")){
		System.out.println("3-1. m_id ����");
		//SELECT * FROM tb_member WHERE m_id='id003'
	}else if(sk.equals("m_level")){
		System.out.println("3-2. m_level ����");
		//SELECT * FROM tb_member WHERE m_level='������'
	}else if(sk.equals("m_name")){
		System.out.println("3-3. m_name ����");
		//SELECT * FROM tb_member WHERE m_name='ȫ05'
	}else if(sk.equals("m_email")){
		System.out.println("3-4. m_email ����");
		//SELECT * FROM tb_member WHERE m_email='test02'
	}
}
%>





