<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<form action="<%=request.getContextPath()%>/msearch/medicine_search_list.jsp" method="post">
<select name="sk">
	<%
	if(S_LEVEL.equals("관리자")){
	%>
    <option value="m_code">약품코드</option>
    <option value="m_name">약품명</option>
    <option value="user_name">판매처</option>
    <option value="m_formul">제형</option>
    <%
	}else{
	%>
	<option value="m_name">약품명</option>
    <option value="user_name">판매처</option>
    <option value="m_formul">제형</option>
	<%
	}
    %>
    </select>
<input type="text" name="sv" placeholder = "검색어를 입력해라.">
<input type="submit" value="검색">
    
</form>
