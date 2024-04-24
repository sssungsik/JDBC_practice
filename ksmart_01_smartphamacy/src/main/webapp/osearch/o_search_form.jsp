<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<form action="<%=request.getContextPath()%>/osearch/o_search_list.jsp" method="post">
<select name="sk">
    <option value="o_code">주문코드</option>
    <option value="o_seller_id">판매자id</option>
    <option value="o_m_code">의약품코드</option>
    <option value="o_m_name">의약품이름</option>
</select>
<input type="text" name="sv">
<input type="submit" value="검색버튼">
</form>