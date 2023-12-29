<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
	<div class="container">
		<h2>학생 관리 시스템</h2>
		<form action="login.do" method="post">
			<input type="text" name="id" placeholder="아이디를 입력하세요">
			<input type="password" name="passwd" placeholder="비밀번호를 입력하세요">
			<button>로그인</button>
		
		</form>
	</div>
	
</body>
</html>