<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%@ page import = "kr.or.ksmart.dao.Mdao" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "kr.or.ksmart.dto.Member" %>

<%
Member m = null;
//Connection conn = null;
Mdao mdao = new Mdao();
//mdao.mInsert(m, conn);
mdao.mInsert(m);
%>
