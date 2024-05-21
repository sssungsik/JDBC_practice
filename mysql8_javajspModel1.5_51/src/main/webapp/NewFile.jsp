<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>

<%@ page import = "kr.or.ksmart.dao.Mdao" %>
<%@ page import = "kr.or.ksmart.dto.Member" %>
<%@ page import = "java.util.List"%>


회원 리스트<br>

<%
Mdao mdao = new Mdao();
List<Member> lm = mdao.mAllSelect();
System.out.println(lm + "<=====m!!!");
System.out.println(lm.size() + "<=====m.size!!!");
%>

<!--  
 올셀렉트
[kr.or.ksmart.dto.Member@44bd1d4, kr.or.ksmart.dto.Member@7ce04d66] <_______lm
[kr.or.ksmart.dto.Member@44bd1d4, kr.or.ksmart.dto.Member@7ce04d66]<=====m!!!
2<=====m.size!!! 
-->
