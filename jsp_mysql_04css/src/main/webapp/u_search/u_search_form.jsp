<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>최성식도박사이트 회원검색</title>
<link href="../css/main.css" rel="stylesheet" type="text/css">
<link href="../css/main2.css" rel="stylesheet" type="text/css">
</head>
<body>

	<div class=user-search>
		<form action="<%=request.getContextPath()%>/u_search/u_search_list.jsp" method="post">
			<select name = "sk">
				<option value="u_id">아이디</option>
				<option value="u_name">이름</option>
				<option value="u_level">권한</option>
 			</select>
 			<input type="text" placeholder="검색어를 입력해 주세요. " name="sv">	
				
			<button type="submit" value="검색">검색</button>
					

	</form>
	
</div>


</body>
</html>