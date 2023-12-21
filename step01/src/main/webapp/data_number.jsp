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
	/* 
		사용자가 보낸 데이터는 request 객체가 저장
		사용자가 보낸 데이터는 getParrequest.getParameter("num")ameter("name속성값") 뽑음
	*/
	int num =Integer.parseInt(request.getParameter("num")) ;
%>
<%=num %>

<%
	for(int i=1; i<num; i++){
%>
	<p><%=i %><p/>
<%
}
%>
</body>
</html>