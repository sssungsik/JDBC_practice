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
<title>Insert title here</title>

<%
String uid = request.getParameter("uid");
String upw = request.getParameter("upw");
System.out.println(uid + "   <----- 아이디");
System.out.println(upw + "   <----- 비번");

String dbid = "id001";
String dbpw = "pw001";
String dblevel = "사용자";
String dbname = "최성식";
String dbemail = "test01";

if (uid.equals(dbid)) {
	System.out.println("1-1 아이디일치");

	if (upw.equals(dbpw)) {
		System.out.println("2-1 비번일치");
		session.setAttribute("S_ID", dbid);
		session.setAttribute("S_LEVEL", dblevel);
		session.setAttribute("S_NAME", dbname);
%>
<script type="text/javascript">
alert('로그인 성공');
location.href='<%=request.getContextPath()%>/index.jsp';
</script>
<%
} else {
System.out.println("2-1 비번불일치");
%>
<script type="text/javascript">
			alert('비번오류');
			location.href='<%=request.getContextPath()%>/index.jsp';
</script>
<%
}
} else {
System.out.println("1-2 아이디불일치");
%>
<script type="text/javascript">
			alert('아이디오류');
			location.href='<%=request.getContextPath()%>/index.jsp';
</script>
<%
}


%>

</head>
<body>







</body>
</html>