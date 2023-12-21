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

int num=Integer.parseInt(request.getParameter("num"));
int i=0;
%>
<h1>--2단--</h1>
<%

	for(i=1; i<10; i++){
		
%>                                
	<p><%=num + " * " + i +" = " + num * i %></p>
<%
	
	}
%>
</body>
</html>