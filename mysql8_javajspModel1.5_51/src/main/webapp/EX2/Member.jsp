<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%@ page import = "kr.or.ksmart.dto.Member" %>
<%
Member m  = new Member();
//ȭ�鿡 �Է��� ������ ���ο� ������ ��´�.
m.setM_id("id007");
m.setM_pw("pw007");
m.setM_level("�Ǹ���");
m.setM_name("ĥ�浿");
m.setM_email("7@naver.com");
System.out.println(m + "<- m ");

String m_id = m.getM_id();
String m_pw = m.getM_pw();
String m_level = m.getM_level();
String m_name = m.getM_name();
String m_email = m.getM_email();
System.out.println(m_id + "<- m_id ");
System.out.println(m_pw + "<- m_pw ");
System.out.println(m_level + "<- m_level ");
System.out.println(m_name + "<- m_name ");
System.out.println(m_email + "<- m_email ");
out.println(m_id + "<- m_id <br/>");
%>
ǥ���� ���̵� ��� : <%= m_id %>
<!-- 
1. set�޼��� 5�� ȣ�� �ϼ���

2. get�޼��� 5�� ȣ�� �� ���ϰ��� ���ο� ������ ���
�ܼ�â,ȭ����¹��1,ȭ����¹��2 �� ����ϼ���!

 -->