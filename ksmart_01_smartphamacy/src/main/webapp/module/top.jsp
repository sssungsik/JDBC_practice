<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
String S_ID = (String)session.getAttribute("S_ID");
String S_LEVEL = (String)session.getAttribute("S_LEVEL");
String S_NAME = (String)session.getAttribute("S_NAME");
String S_PW = (String)session.getAttribute("S_PW");
System.out.println(S_ID + "<-- S_ID top.jsp");
System.out.println(S_LEVEL + "<-- S_LEVEL top.jsp");
System.out.println(S_NAME + "<-- S_NAME top.jsp");
System.out.println(S_PW + "<-- S_PW top.jsp");
%>
   <!-- Begin Wrapper -->
   <div id="wrapper">
         <!-- Begin Header -->
         <div id="header">
<%
if(S_LEVEL == null){
%>
	<!-- 1-1 로그인 전화면 시작 -->
	<a href="<%= request.getContextPath() %>/user_insert/user_insert_form.jsp">회원가입</a>
	<%@ include file="/drug_login/login_form.jsp" %>
	<!-- 1-1 로그인 전화면 끝 -->
<%
}else{
	if(S_LEVEL.equals("약국")){
%>
	<a href="<%= request.getContextPath() %>/msearch/medicine_search_list.jsp">상품검색</a>
<%
	}else if(S_LEVEL.equals("납품업체")){
%>
<a href="<%= request.getContextPath() %>/minsert/medicine_insert_form.jsp">상품등록</a> |
<a href="<%= request.getContextPath() %>/msearch/medicine_search_list.jsp">상품검색</a>
<%
	}else if(S_LEVEL.equals("관리자")){
%>
<a href="<%= request.getContextPath() %>/user_insert/user_insert_form.jsp">회원등록</a> |
<a href="<%= request.getContextPath() %>/user_search/user_search_list.jsp">회원검색</a> |
<a href="<%= request.getContextPath() %>/minsert/medicine_insert_form.jsp">상품등록</a> |
<a href="<%= request.getContextPath() %>/msearch/medicine_search_list.jsp">상품검색</a> |
<a href="<%= request.getContextPath() %>/order/o_insert_form.jsp">주문등록</a> |
<a href="<%= request.getContextPath() %>/osearch/o_search_list.jsp">주문검색</a>
<%
	}
%>
	<!-- 1-2 로그인 후 화면 시작 -->
	<div style="float : right">
		<%= S_NAME %> 님 <%= S_LEVEL %> 권한으로 로그인 중<br>
		<a href="<%= request.getContextPath() %>/drug_login/logout.jsp" style="text-align : right">로그아웃</a>
	</div>
	<!-- 1-2 로그인 후 화면 끝 -->
<%} %>
		 </div>
		 <!-- End Header -->