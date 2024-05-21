<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import = "kr.or.ksmart.dao.Mdao" %>
<%@ page import = "kr.or.ksmart.dto.Member" %>
<%@ page import = "java.util.List"%>


회원 리스트 <br>
<table width="100%" border="1">
<tr>
	<td>아이디</td><td>비번</td><td>권한</td><td>이름</td><td>이메일</td><td>수정</td><td>삭제</td>
</tr>
<%
Mdao mdao = new Mdao();
List<Member> lm = mdao.mAllSelect();
System.out.println(lm + "<=====m!!!");
System.out.println(lm.size() + "<=====m.size!!!");

for(int i=0; i<lm.size();i++) {
	Member m = lm.get(i);

%>
<tr>
			<td><%= m.getM_id()%></td>
			<td><%= m.getM_pw()%></td>
			<td><%= m.getM_level()%></td>
			<td><%= m.getM_name()%></td>
			<td><%= m.getM_email()%></td>
			<td>
<a href="<%= request.getContextPath() %>/mupdate/m_update_form.jsp?send_id=<%= m.getM_id()%>">수정버튼</a>			
			</td>
			<td>
<a href="<%= request.getContextPath() %>/mdelete/m_delete_action.jsp?send_id=<%= m.getM_id()%>">삭제버튼</a>			
			</td>
			
		</tr>
<%
}
%>		

</table>












