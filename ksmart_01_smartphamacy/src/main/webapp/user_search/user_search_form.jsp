<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<form action="<%=request.getContextPath()%>/user_search/user_search_list.jsp" method="post">
<select name="sk">
    <option value="user_id">아이디</option>
    <option value="user_pw">비밀번호</option>
    <option value="user_name">이름</option>
    <option value="user_level">권한</option>
   
</select>
<input type="text" name="sv">
<input type="submit" value="검색버튼">
</form>
