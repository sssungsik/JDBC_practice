<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%@ page import = "kr.or.ksmart.dao.Mdao" %>

<%
String send_id = request.getParameter("send_id");	//¿¹)String send_id="id004"
System.out.println(send_id + "<-- send_id m_delete_action.jsp");
Mdao mdao = new Mdao();
mdao.mDelete(send_id);
response.sendRedirect(request.getContextPath()+"/msearch/m_search_list.jsp");
%>
