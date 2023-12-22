<%@page import="java.util.HashSet"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isErrorPage="error.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
*{
	margin:0;
	padding:0;
}
table{
border-collapse: collapse;
box-sizing: border-box;
}
td{
border: 1px solid black;
padding: 30px;
}
</style>
<body>
<%
	ArrayList<HashSet<Integer>> list=(ArrayList<HashSet<Integer>>)request.getAttribute("lotto");
	
%>
<table>
<%
	for(int i=0; i<list.size(); i++){
		%>
		<tr>
		<%
		for(int n : list.get(i)){
			%>
			<td>
			<%=n %>
			</td>
			<%
		}
		%>
		</tr>
		<%
	}
	
%>


</table>
</body>
</html>