<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
	String user_id = request.getParameter("user_id");
	String user_pw = request.getParameter("user_pw");
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String msg = null;
	
	try{
		// 드라이버 로딩
		Class.forName("com.mysql.jdbc.Driver");
		
		// 커낵션 생성
		String jdbcDriver = "jdbc:mysql://192.168.10.6:3306/dev51db?" +
				"useUnicode=true&characterEncoding=euckr";
		String dbUser = "dev51id";
		String dbPass = "dev51pw";
		conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		
		pstmt = conn.prepareStatement("SELECT u.* " +
				"FROM tb01_user AS u " +
				"WHERE u.user_id = ? AND u.user_pw = ?");
		pstmt.setString(1, user_id);
		pstmt.setString(2, user_pw);
		
		rs = pstmt.executeQuery();
		
		
		if(rs.next()){
			session.setAttribute("S_ID", rs.getString("user_id"));
			session.setAttribute("S_PW", rs.getString("user_pw"));
			session.setAttribute("S_NAME", rs.getString("user_name"));
			session.setAttribute("S_LEVEL", rs.getString("user_level"));
			msg = "로그인 성공";
		}else{
			msg = "로그인에 실패했습니다. 아이디와 비밀번호를 확인해주세요";
		}
	}catch(SQLException e){
		out.println(e.getMessage());
		e.printStackTrace();
	}finally{
		try{rs.close();}catch(SQLException e){}
		try{pstmt.close();}catch(SQLException e){}
		try{conn.close();}catch(SQLException e){}
	}
%>
</head>
<body>
	<script>
		alert('<%= msg %>');
		location.replace('../index.jsp');
	</script>
</body>
</html>