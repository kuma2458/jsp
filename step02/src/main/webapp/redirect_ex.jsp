<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
 
<%
	String param = request.getParameter("data");
	request.setAttribute("result", "request_"+param);
	
	//redirect 방식으로 페이지 이동
	//redirect는 새로운 경로를 요청하는 것이므로 기존의 request가 사라진다
	//그래서 주소창에 url이 바뀐것을 볼 수 있음
	response.sendRedirect("redirect_result.jsp");

%>