<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 

	아이디와 비밀번호가 admin, 1234이면 로그인 성공 페이지(login_success.jsp)로 이동
	로그인 실패시 login_fail.jsp로 이동
 -->
 
 <%
 	String id=request.getParameter("id");
 	String pass=request.getParameter("pass");
 	if(id.equals("admin")&&pass.equals("1234")){
 		out.write("<script>location.href='login_success.jsp';</script>");
%>

<%
 	}
 	else{
 		//out.write("<script>location.href='login_fail.jsp';</script>");
 		%>
 		<jsp:forward page="login_fail.jsp"></jsp:forward>
 	<%		
 	}
 %>