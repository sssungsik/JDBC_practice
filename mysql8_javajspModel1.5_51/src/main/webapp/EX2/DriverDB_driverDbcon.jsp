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
ǥ���� ���ϰ� : <%= conn %>
<!-- 
driverDbcon �޼��� ȣ�� �ϼ���!
driverDbcon �޼��� ȣ�� �� ���ϰ��� ���ο� ������ ��Ƽ�
�ܼ�â�� ȭ�鿡 ����ϼ���! (������ ���ϰ� null)
-->