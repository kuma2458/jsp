<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String hak=request.getParameter("hak");
	String name=request.getParameter("name");
	String major=request.getParameter("major");

%>
<p>학번: <%=hak %></p>
<p>이름: <%=name %></p>
<p>전공: <%=major %></p>
</body>
</html>