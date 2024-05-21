<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<!-- DB결과물 보이는 것 (select 등) 에만 사용 -->
<%@ page import="java.sql.SQLException"%>
<html>
<head>
<meta charset="UTF-8">
<title>SSSUNGSIKTEL</title>

<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/main.css" />
<link
	href="https://fonts.googleapis.com/css2?family=Raleway:wght@700&family=Oleo+Script:wght@700&family=Quicksand:wght@300;500;700&display=swap"
	rel="stylesheet" />
</head>

<body>
	<header>
		<%@ include file="/module/top.jsp"%>
	</header>
	<main>
		<section class="main">
		</section>
	</main>
	<footer>
		<div class="footerlogo">
	<ul>
		<li><img src="./images/insta.png" alt="insta"></li>
		<li><img src="./images/facebook.png" alt="facebook"></li>
	</ul>
</div>
	</footer>
</body>
</html>













