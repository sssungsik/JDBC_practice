<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%@ page import = "kr.or.ksmart.dto.Member" %>
<%
Member m  = new Member();
//화면에 입력한 값들을 새로운 변수에 담는다.
m.setM_id("id007");
m.setM_pw("pw007");
m.setM_level("판매자");
m.setM_name("칠길동");
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
표현식 아이디 출력 : <%= m_id %>
<!-- 
1. set메서드 5개 호출 하세요

2. get메서드 5개 호출 후 리턴값을 새로운 변수에 담아
콘솔창,화면출력방법1,화면출력방법2 로 출력하세요!

 -->