<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link href="../css/main.css" rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css2?family=Raleway:wght@700&family=Oleo+Script:wght@700&family=Quicksand:wght@300;500;700&display=swap"
	rel="stylesheet" />
</head>
<body>
	<header>
		<%@ include file="/module/top.jsp"%>
	</header>
	<main>
		<section class=main>
			<div class=user-insert>
				<form
					action="<%=request.getContextPath()%>/minsert/user_insert_pro.jsp"
					method="post">
					<input type="text" placeholder="아이디" name="u_id"> <input
						type="password" placeholder="비밀번호" name="u_pw"> <select
						id="userGrade" name="u_level">
						<option value="사용자">사용자</option>
						<option value="관리자">관리자</option>
					</select> <input type="text" placeholder="이 름" name="u_name"> <input
						type="email" placeholder="이메일" name="u_email"> <input
						type="number" placeholder="전화번호" name="u_phone"> <input
						type="text" placeholder="주 소" name="u_addr">


					<button type="submit" value="회원가입버튼">회원가입</button>

				</form>
			</div>
		</section>
	</main>
<footer>
	<div class="footerlogo">
	<ul>
		<li><img src="D:\chiosungsik\mysqlwork51\jsp_mysql_04css\src\main\webapp\images" alt="insta"></li>
		<li><img src="D:\chiosungsik\mysqlwork51\jsp_mysql_04css\src\main\webapp\images" alt="facebook"></li>
	</ul>
</div>
</footer>


</body>
</html>