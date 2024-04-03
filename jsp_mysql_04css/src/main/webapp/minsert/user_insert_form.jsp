<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>최성식도박사이트 회원가입</title>
<link href="../css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div class=user-insert>
		<form action="<%=request.getContextPath()%>/minsert/user_insert_pro.jsp" method="post">
			<input type="text" placeholder="아이디" name="u_id">	
			<input type="password" placeholder="비밀번호" name="u_pw">
 		 	<select id="userGrade"  name="u_level">
 			 <option value="판매자">판매자</option>
 			 <option value="구매자">구매자</option>
 			 <option value="관리자">관리자</option></select>
		 	<input type="text" placeholder="이 름" name="u_name">
		 	<input type="email" placeholder="이메일" name="u_email">
		 	<input type="number"  placeholder="전화번호"name="u_phone">
			<input type="text"  placeholder="주 소"name="u_addr">
		
    <!-- 가입버튼 -->
	<div class=user-ok>
		<button type="submit" value="회원가입버튼">회원가입</button>
	</div>

	</form>
</div>


</body>
</html>