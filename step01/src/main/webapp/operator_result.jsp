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
	int num1 = Integer.parseInt(request.getParameter("num1"));
	String a = request.getParameter("a");
	int num2 = Integer.parseInt(request.getParameter("num2"));
	int result = 0;
	switch(a){
	case"+":
		result=num1+num2;
		break;
	case"-":
		result=num1-num2;
		break;
	case"*":
		result=num1*num2;
		break;
	case"/":
		result=num1/num2;
		break;
	}
%>
<%=num1 %> <%=a %> <%=num2 %> = <%=result %>






</body>
</html>