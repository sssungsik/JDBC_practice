<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
Class.forName("com.mysql.jdbc.Driver");
		
		// 커낵션 생성
		String jdbcDriver = "jdbc:mysql://192.168.10.17:3306/dev51db?" +
				"useUnicode=true&characterEncoding=euckr";
		String dbUser = "dev51id";
		String dbPass = "dev51pw";
		conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);