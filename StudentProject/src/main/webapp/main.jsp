<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
*{
	margin:0;
	padding:0;
}

table{
	border-collapse: collapse;
	box-sizing: border-box;

	margin:0 auto;
}

tr,td{
	border:1px solid black;
	padding:10px;
}

nav{
	margin:0 auto;
	width: 700px;
	
}
ul{
	width: 100%;
	list-style-type:none;
	display: flex;
	justify-content: space-between;
		padding: 20px 0px;

}
nav a{
	text-decoration: none;
	color:black;
	padding: 20px 0px;
}
nav a:hover{
	border-bottom: 2px solid black;
}
</style>
</head>
<body>
<!-- 로그인 세션이 풀려있으면 index.jsp로 이동 -->
<c:if test="${sessionScope.login==null ||sessionScope.login==false  }">
	<script type="text/javascript">
		alert("로그인하셔야 이용하실수 있습니다");
		location.href='index.jsp';
	</script>
</c:if>
	<nav>
		<ul>
			<li><a href="main.do">홈</a></li>
			<li><a href="registerStudentView.do">학생정보 등록</a></li>
			<li><a href="majorMain.do">학과관리</a></li>
			<li><a href="scholarshipMain.do">장학생관리</a></li>
			<li><a href="logout.do">로그아웃</a></li>

		</ul>
	</nav>
	<table>
		<thead>
			<tr>
			<td>학번</td>
			<td>이름</td>
			<td>평점</td>
			<td>성별</td>
			<td>학과명</td>
			<td>비고</td>
			</tr>
		</thead>
		<tbody>
			 <!-- 세션에 저장한 studentList를 출력 -->
			 <c:forEach var="std" items="${requestScope.studentList }">
			 	<tr>
			 		<td>${std.studentNo }</td>
			 		<td>${std.studentName }</td>
			 		<td>${std.score }</td>
			 		<td>${std.gender }</td>
			 		<td>
			 		<!-- 학과번호를 이용해서 해당 학과명을 출력 -->
			 		<c:forEach var="m" items="${sessionScope.majorList }">
						<c:if test="${std.majorNo == m.majorNo}">
							${m.majorName }						
						</c:if>	 		
			 		</c:forEach>
			 		</td>
			 		<td>
			 			<a href='updateView.do?studentNo=${std.studentNo }'>수정</a>
			 			/
			 			<a href='deleteStudent.do?studentNo=${std.studentNo }'>삭제</a>
			 			
			 		</td>
			 	</tr>
			 </c:forEach>
		</tbody>
	</table>

</body>
</html>