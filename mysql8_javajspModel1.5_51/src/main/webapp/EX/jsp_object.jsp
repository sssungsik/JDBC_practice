<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%
//jsp ���� ��ü
//�ڹ��ڵ� ��ġ : �ܼ�â ���
//��) request ��ü������������ � ���� �Ҵ� �Ǿ� ������? 
//	00�������̽��� ���� ���� ��� ���� RequestFacade Ŭ���� ���� ������ ��ü�� �ּҰ�
// ���� ���� ���� �ʾ����� �̸�
System.out.println(request + "<-- request");
System.out.println(response + "<-- response");
System.out.println(out + "<-- out");
System.out.println(session + "<-- session");
System.out.println(pageContext + "<-- pageContext");
System.out.println(application + "<-- application");
System.out.println(config  + "<-- config ");
System.out.println(page + "<-- page");
/* 
org.apache.catalina.connector.RequestFacade@2b493a3a<-- request
org.apache.catalina.connector.ResponseFacade@76a41249<-- response
org.apache.jasper.runtime.JspWriterImpl@4f5116bb<-- out
org.apache.catalina.session.StandardSessionFacade@5dc0849<-- session
org.apache.jasper.runtime.PageContextImpl@4196e121<-- pageContext
org.apache.catalina.core.ApplicationContextFacade@66162998<-- application
org.apache.catalina.core.StandardWrapperFacade@30764949<-- config 
org.apache.jsp.EX.jsp_005fobject_jsp@2f0dde81<-- page
*/
 
%>