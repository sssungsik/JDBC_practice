<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%@ page import = "kr.or.ksmart.driverdb.DriverDB" %>
<%@ page import = "java.sql.Connection" %>
<%
Connection conn = null;
DriverDB db = new DriverDB();
conn = db.driverDbcon();
System.out.println(conn + "<-- conn ");
out.println(conn + "<-- conn <br/>");
%>
표현식 리턴값 : <%= conn %>
<!-- 
driverDbcon 메서드 호출 하세요!
driverDbcon 메서드 호출 후 리턴값을 새로운 변수에 담아서
콘솔창과 화면에 출력하세요! (지금은 리턴값 null)
-->