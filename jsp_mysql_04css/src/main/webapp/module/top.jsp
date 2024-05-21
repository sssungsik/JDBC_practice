<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
String S_ID = (String) session.getAttribute("S_ID");
String S_LEVEL = (String) session.getAttribute("S_LEVEL");
String S_NAME = (String) session.getAttribute("S_NAME");
System.out.println(S_ID + "    < --- sid");
System.out.println(S_LEVEL + "    < --- sle");
System.out.println(S_NAME + "    < --- sname");
%>



<%
if (S_LEVEL == null) {
%>

<header>
	<div id="menu">
		<ul>
			<li><a href="<%@ include file="/u_login/login.jsp"%>">LOGIN</a>
				<ul>
					<li><a
						href="<%=request.getContextPath()%>/minsert/user_insert_form.jsp">회원가입</a></li>

				</ul></li>
			<li><a href="#">ROOMS & SUITES</a>
				<ul>
					<li><a href="#">럭셔리</a></li>
					<li><a href="#">스위트</a></li>
				</ul></li>
			<li><a href="#">PROGRAMS</a>
				<ul>
					<li><a href="#">투어</a></li>
					<li><a href="#">박물관, 예술, 문화</a></li>
					<li><a href="#">엔터테인먼트, 티켓</a></li>
				</ul></li>
		</ul>
		<div id="headerlogo">
			<a href="travel.html">Sungsik</a>
		</div>
	</div>
</header>
<!--1-1 로그인 전화면 -->
<div class="login">
	<form action="<%=request.getContextPath()%>/u_login/login_action.jsp"
		method="post">
		<input type="text" name="uid"> <input type="password"
			name="upw"> <input type="submit" value="로그인">
	</form>
</div>
<%
} else {
if (S_LEVEL.equals("사용자")) {
%>
<header>
	<div id="menu">
		<ul>
			<li><a href="<%=request.getContextPath()%>/u_login/logout.jsp">LOGOUT</a>
				<ul>
					<li><a
						href="<%=request.getContextPath()%>/minsert/user_insert_form.jsp">마이페이지</a></li>
				</ul></li>
			<li><a href="#">ROOMS & SUITES</a>
				<ul>
					<li><a href="#">럭셔리</a></li>
					<li><a href="#">스위트</a></li>
				</ul></li>
			<li><a href="#">PROGRAMS</a>
				<ul>
					<li><a href="#">투어</a></li>
					<li><a href="#">박물관, 예술, 문화</a></li>
					<li><a href="#">엔터테인먼트, 티켓</a></li>
				</ul></li>
		</ul>
		<div id="headerlogo">
			<a href="travel.html">Sungsik</a>
		</div>
	</div>
</header>
<%
} else if (S_LEVEL.equals("관리자")) {
%>
<header>
	<div id="menu">
		<ul>
			<li><a href="<%=request.getContextPath()%>/u_login/logout.jsp">LOGOUT</a>
				<ul>
					<li><a
						href="<%=request.getContextPath()%>/minsert/user_insert_form.jsp">마이페이지</a></li>

					<li><a
						href="<%=request.getContextPath()%>/minsert/user_list.jsp">회원검색</a>
					</li>


				</ul></li>
			<li><a href="#">ROOMS & SUITES</a>
				<ul>
					<li><a href="#">럭셔리</a></li>
					<li><a href="#">스위트</a></li>
				</ul></li>
			<li><a href="#">PROGRAMS</a>
				<ul>
					<li><a href="#">투어</a></li>
					<li><a href="#">박물관, 예술, 문화</a></li>
					<li><a href="#">엔터테인먼트, 티켓</a></li>
				</ul></li>
		</ul>
		<div id="headerlogo">
			<a href="travel.html">Sungsik</a>
		</div>
	</div>
</header>
<%
}
%>
<!-- 1-2로그인 후 화면 -->

<%=S_LEVEL%>
<%=S_NAME%>
님
<a href="<%=request.getContextPath()%>/u_login/logout.jsp">로그아웃</a>
<%
}
%>