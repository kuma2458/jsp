_s<%@page import="java.lang.ProcessBuilder.Redirect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%=session.getId() %>
<%
	request.setAttribute("req", "request value");


	//서버가 연결되는동안 저장할 데이터는 세션 영역에 저장해야됨
	//세션 설정
	//세션 만료 시간 설정
	session.setMaxInactiveInterval(30);
	session.setAttribute("session", "session.value");

	//페이지 이동
	//forward는 계속 남아있음
	//request.getRequestDispatcher("session_result.jsp").forward(request, response);
	
	//새로고침하면 다시 요청하는거니 이전값이 날라감
	response.sendRedirect("session_result.jsp");

%>
</body>
</html>