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
//3단계 : 쿼리 실행 준비 단계
if(sk == null && sv == null){
	System.out.println("1. sk,sv 변수에 담긴 값 null 조건");	
	//SELECT * FROM tb_member
}else if(sk != null && sv.equals("")){
	System.out.println("2. sk는null아니고 sv는 공백 조건");
	//SELECT * FROM tb_member
}else if(sk != null && sv != null){
	System.out.println("3. sk,sv는 null 아닌 조건");
	if(sk.equals("m_id")){
		System.out.println("3-1. m_id 조건");
		//SELECT * FROM tb_member WHERE m_id='id003'
	}else if(sk.equals("m_level")){
		System.out.println("3-2. m_level 조건");
		//SELECT * FROM tb_member WHERE m_level='구매자'
	}else if(sk.equals("m_name")){
		System.out.println("3-3. m_name 조건");
		//SELECT * FROM tb_member WHERE m_name='홍05'
	}else if(sk.equals("m_email")){
		System.out.println("3-4. m_email 조건");
		//SELECT * FROM tb_member WHERE m_email='test02'
	}
}
%>





