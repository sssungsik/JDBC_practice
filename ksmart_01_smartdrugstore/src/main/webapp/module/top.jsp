<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
String S_ID = (String)session.getAttribute("S_ID");
String S_LEVEL = (String)session.getAttribute("S_LEVEL");
String S_NAME = (String)session.getAttribute("S_NAME");
System.out.println(S_ID + "<-- S_ID top.jsp");
System.out.println(S_LEVEL + "<-- S_LEVEL top.jsp");
System.out.println(S_NAME + "<-- S_NAME top.jsp");
%>
   <!-- Begin Wrapper -->
   <div id="wrapper">
   
         <!-- Begin Header -->
         <div id="header">
      

<%
if(S_LEVEL == null){
%>
	<!-- 1-1 로그인 전화면 시작 -->

	<form action="<%= request.getContextPath() %>/login/login_action.jsp" method="post">
		아이디 : <input type="text" name="mid">
		비번 : <input type="password" name="mpw">
		<input type="submit" value="로그인버튼">
	</form>
	<!-- 1-1 로그인 전화면 끝 -->
<%
}else{
	if(S_LEVEL.equals("구매자")){
%>
<a href="<%= request.getContextPath() %>/msearch/medicine_search_list.jsp">약품검색</a>					 
	
<%
	}else if(S_LEVEL.equals("판매자")){
%>
<a href="<%= request.getContextPath() %>/msearch/medicine_search_list.jsp">약품검색</a>					 
<a href="<%= request.getContextPath() %>/minsert/medicine_insert_form.jsp">약품등록</a>					 

<%
	}else if(S_LEVEL.equals("관리자")){
%>
<a href="<%= request.getContextPath() %>/msearch/medicine_search_list.jsp">약품검색</a>					 
<a href="<%= request.getContextPath() %>/minsert/medicine_insert_form.jsp">약품등록</a>	
<%
	}
%>
	<!-- 1-2 로그인 후 화면 시작 -->
	<%= S_NAME %> 님 <%= S_LEVEL %> 권한으로 로그인 중
	<a href="<%= request.getContextPath() %>/login/logout.jsp">로그아웃</a>
	<!-- 1-2 로그인 후 화면 끝 -->
<%} %>
		 
			   
		 </div>
		 <!-- End Header -->
		 
		 
		 
		 