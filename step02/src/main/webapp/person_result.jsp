<%@ page import="step02.PersonVO" %>

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
	PersonVO p=(PersonVO)request.getAttribute("person");
%>
<p>이름 : <%=p.getName() %></p>
<p>나이 : <%=p.getAge() %></p>
</body>
</html>