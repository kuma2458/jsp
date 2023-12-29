<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>application scope</title>
</head>
<body>
<%
	application.setAttribute("d1", "jsp에서 넣은 데이터");
%>
 <a href='application_scope'>application</a>
</body>
</html>