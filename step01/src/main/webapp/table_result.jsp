<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>table</title>
<style type="text/css">

	table{
		border-collapse :collapse;
		box-sizing:border-box;
	}
	td{
		padding: 30px;
		border: 1px solid black;
		
	}

</style>
</head>
<body>
<%
	int row=Integer.parseInt(request.getParameter("row"));
	int column=Integer.parseInt(request.getParameter("column"));
	int check=1;
%>
	<table>
<%
		for(int i=0;i<row;i++){
			%>
			<tr>
			<%		
			for(int j=0;j<column; j++){
				%>
					<td><%=check%></td>
				<%	
				check++;
			}
			%>
			</tr>
			<%
		}
%>



</table>
</body>
</html>