<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%
request.setCharacterEncoding("euc-kr");
String mid = request.getParameter("mid");
String mpw = request.getParameter("mpw");
System.out.println(mid + "<-- mid login_action.jsp");
System.out.println(mpw + "<-- mpw login_action.jsp");
//사용자가 입력한 아이디와 비번
//1명 회원 가정(향후에는 DB에 저장된 회원)
String dbid = "id001";
String dbpw = "pw001";
String dblevel = "관리자";	//테스트 권한 : 구매자 or 판매자 or 관리자
String dbname = "홍01";
String dbemail = "test01";
String msg = null;
if(mid.equals(dbid)){
	System.out.println("1-1 아이디 일치 조건");
	if(mpw.equals(dbpw)){
		System.out.println("2-1 로그인 성공 조건");	
		//session 에 셋팅(아이디,권한,이름)
		session.setAttribute("S_ID", dbid);
		session.setAttribute("S_LEVEL", dblevel);
		session.setAttribute("S_NAME", dbname);
		//response.sendRedirect(request.getContextPath()+"/index.jsp");
		msg = "로그인 성공";
	}else{
		System.out.println("2-2 비번 불일치 조건");
		msg = "비번 불일치";
	}
}else{
	System.out.println("1-2 아이디 불일치 조건");
	msg = "아이디 불일치";
}
%>
<script type="text/javascript">
	alert('<%= msg %>');
	location.href='<%= request.getContextPath()%>/index.jsp';
</script>

