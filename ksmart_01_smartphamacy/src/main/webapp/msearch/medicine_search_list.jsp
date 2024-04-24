<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>

<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/main.css" />
</head>

<body>
<%@ include file="/module/top.jsp" %>
<%@ include file="/module/left.jsp" %>
<%@ include file="/msearch/medicine_search_form.jsp" %>
회원 검색 <br>
<table width="100%" border="1">
<%
request.setCharacterEncoding("UTF-8");
String sk = request.getParameter("sk");
String sv = request.getParameter("sv");
System.out.println(sk + "<-- sk");
System.out.println(sv + "<-- sv");

Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;
Class.forName("com.mysql.jdbc.Driver");
String selectQuery = "SELECT m.m_code, m.m_name, m.m_price, u.user_name, m.m_formul, m.m_stock " +
"FROM tb01_medicine AS m INNER join tb01_user AS u ON m.m_seller_id = u.user_id";
try{
	String jdbcDriver = "jdbc:mysql://192.168.10.6:3306/dev51db?" +
			"useUnicode=true&characterEncoding=euckr";
	String dbUser = "dev51id";
	String dbPass = "dev51pw";
	conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
	System.out.println(conn + "<-- conn");
	if(sk == null && sv == null){
		System.out.println("1. sk,sv 변수에 담긴 값 null 조건");	
		pstmt = conn.prepareStatement(selectQuery);
	}else if(sk != null && sv.equals("")){
		System.out.println("2. sk는null아니고 sv는 공백 조건");
		pstmt = conn.prepareStatement(selectQuery);
	}else if(sk != null && sv != null){
		System.out.println("3-1. m_id 조건");
		pstmt = conn.prepareStatement(selectQuery+" WHERE "+ sk + "= ?");
		pstmt.setString(1, sv);
	}

	System.out.println(pstmt + "<-- pstmt");
	
	rs = pstmt.executeQuery();
	System.out.println(rs + "<-- rs");
	if(S_LEVEL.equals("약국")){
		%>
		<tr>
			<td>약품명</td><td>가격</td><td>판매처</td><td>제형</td><td>재고</td><td>구매</td>
		</tr>
		<%
		while(rs.next()){
			%>
			<tr>
				<td><%= rs.getString("m_name")%></td>
				<td><%= rs.getString("m_price")%></td>
				<td><%= rs.getString("user_name")%></td>
				<td><%= rs.getString("m_formul")%></td>
				<td><%= rs.getString("m_stock")%></td>
				<td>
				<form action="<%= request.getContextPath()%>/ordero_insert_pro.jsp">
					<input type="number" name="send_amount">
					<input type="submit" value="구매">
				</form>			
			</td>
			</tr>
			<%
		}
	}else{
		%>
		<tr>
			<td>약품코드</td><td>약품명</td><td>가격</td><td>판매처</td><td>제형</td><td>재고</td><td>수정</td><td>삭제</td><td>구매</td>
		</tr>
		<%
		while(rs.next()){	
%>
		<tr>
			<td><%= rs.getString("m_code")%></td>
			<td><%= rs.getString("m_name")%></td>
			<td><%= rs.getString("m_price")%></td>
			<td><%= rs.getString("user_name")%></td>
			<td><%= rs.getString("m_formul")%></td>
			<td><%= rs.getString("m_stock")%></td>
			<td>
				<a href="<%= request.getContextPath() %>/mupdate/medicine_update_form.jsp?send_code=<%= rs.getString("m_code")%>">수정버튼</a>			
			</td>
			<td>
				<a href="<%= request.getContextPath() %>/mdelete/medicine_delete_action.jsp?send_code=<%= rs.getString("m_code")%>">삭제버튼</a>			
			</td>
			<td>
				<form action="<%= request.getContextPath()%>/order/order_insert_pro.jsp?send_code=<%= rs.getString("m_code")%>?send_stock=<%= rs.getString("m_stock")%>" method="post">
					<input type="number" name="send_amount">
					<input type="submit" value="구매">
				</form>			
			</td>
			
		</tr>

<!-- 화면 위치 끝 -->		
<%		
		}
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
<%@ include file="/module/hadan.jsp" %>

</body>
</html>





