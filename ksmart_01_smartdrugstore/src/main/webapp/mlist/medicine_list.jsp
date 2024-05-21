<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>

<%-- <%@ include file="/minsert/m_insert_form.jsp" %> --%>

약품 리스트 <br>
<table width="100%" border="1">
<tr>
	<td>약품코드</td><td>약품명</td><td>가격</td><td>제조사</td><td>제형</td><td>재고</td><td>수정</td><td>삭제</td>
</tr>
<%
Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;
Class.forName("com.mysql.jdbc.Driver");
try{
	String jdbcDriver = "jdbc:mysql://192.168.10.6:3306/dev51db?" +
			"useUnicode=true&characterEncoding=euckr";
	String dbUser = "dev51id";
	String dbPass = "dev51pw";
	conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
	System.out.println(conn + "<-- conn ");
//com.mysql.cj.jdbc.ConnectionImpl@c057197<-- conn m_list.jsp
	pstmt = conn.prepareStatement("select * from tb01_medicine");
	rs = pstmt.executeQuery();
	System.out.println(rs + "<-- rs");
//com.mysql.cj.jdbc.result.ResultSetImpl@5043c656<-- rs m_list.jsp
	while(rs.next()){
		//System.out.println("select 쿼리 실행 결과 몇 줄 나올까?");
%>
<!-- 화면 위치 시작 -->
		<tr>
			<td><%= rs.getString("m_code")%></td>
			<td><%= rs.getString("m_name")%></td>
			<td><%= rs.getString("m_price")%></td>
			<td><%= rs.getString("m_comp")%></td>
			<td><%= rs.getString("m_formul")%></td>
			<td><%= rs.getString("m_stock")%></td>
			<td>
<a href="<%= request.getContextPath() %>/mupdate/medicine_update_form.jsp?send_code=<%= rs.getString("m_code")%>">수정버튼</a>			
			</td>
			<td>
<a href="<%= request.getContextPath() %>/mdelete/medicine_delete_action.jsp?send_code=<%= rs.getString("m_code")%>">삭제버튼</a>			
			</td>
			
		</tr>
<!-- 화면 위치 끝 -->		
<%
	}
} catch(SQLException ex) {
	out.println(ex.getMessage());
	ex.printStackTrace();
} finally {
	if (rs != null) try { rs.close(); } catch(SQLException ex) {}
	if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
	if (conn != null) try { conn.close(); } catch(SQLException ex) {}
}
%>
</table>












