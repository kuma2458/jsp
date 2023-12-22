<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ page isErrorPage="true" %>
<head>
<meta charset="UTF-8">
<title>에러 페이지</title>
</head>
<body>
	페이지 처리 중 에러가 났습니다.<br>
	Exception Class= <%=exception.getClass().getName() %><br>
	Exception Message= <%=exception.getMessage() %><br>
	<a href="javascript:history.back();">뒤로가기</a>
</body>
</html>