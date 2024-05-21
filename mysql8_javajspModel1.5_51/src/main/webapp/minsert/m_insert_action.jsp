<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%@ page import = "kr.or.ksmart.dao.Mdao" %>
<% request.setCharacterEncoding("euc-kr"); %>
<jsp:useBean id="m" class="kr.or.ksmart.dto.Member"/>
<jsp:setProperty name="m" property="*"/>
<%
Mdao mdao = new Mdao();
mdao.mInsert(m);
response.sendRedirect(request.getContextPath()+"/msearch/m_search_list.jsp");
%>





















