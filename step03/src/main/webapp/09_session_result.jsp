<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%session.getAttribute("name"); %>
	<%session.getAttribute("age"); %>
	<a href='session_invalidate'>세션초기화</a>
</body>
</html>