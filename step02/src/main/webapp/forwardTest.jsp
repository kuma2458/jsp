<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!-- 

	자바로 출력한 내용(html,css,js)들은 실행되는 시점이 사용자가 받아야 실행이 된다.
	서버쪽에서는 실행이 되지않음
	이 때 액션 태그 및 자바 코드가 서버단에서 실행되기 때문에 
	액션태그와 자바코드가 우선적으로 실행이 됨, 페이지 이동하는 forward가 실행되기 때문에
	현재 밑에 작성한 자바스크립트 및 내용 출력은 사용자가 읽기 전에 페이지 이동이 처리된다
	

 -->

<%=request.getParameter("name") %>
<%=request.getParameter("hobby") %>
<%

	out.write("<script>alert('안녕하세요');</script>");
%>
<!-- 사용자의 최초 요청사항이 그대로 전달됨(최초 호출된 url이 유지, request 객체도 유지됨) -->
 <jsp:forward page="forwardResult.jsp"></jsp:forward>