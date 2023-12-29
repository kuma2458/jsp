<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jstl, el</title>
</head>
<body>
	<h2>el 태그 테스트</h2>
	<p>request영역에 저장된 내용은 requestScope를 사용해서 뽑음</p>
	<p>age: ${requestScope.list}, ${requestScope.age+10}</p>
	<p>session영역에 저장된 내용은 sessionScope를 사용해서 뽑음</p>
	<p>msg: ${sessionScope.msg }</p>
	<p>dto: ${sessionScope.dto.id },${sessionScope.dto.pass },${sessionScope.dto.name },
	${sessionScope.dto.grade },${sessionScope.dto.grade=="VIP" }</p>
	<p>${sessionScope.dto.toString() }</p>
	<h2>jstl 태그 테스트</h2>
	<!-- set: 변수를 만들어서 데이터 초기화 -->
	<c:set var="tnum" value="10000"/>
	<!-- out: 해당 데이터를 출력 -->
	<p><c:out value="${tnum}"></c:out>,${tnum }</p>
	
	
	<!-- if문 test가 조건식, jstl에는 elseif, else가 없음 -->
	<p>if문</p>
	<c:if test="${requestScope.age<20 }">
		<p>미성년자 입니다</p>
	</c:if>
	<c:if test="${requestScope.age>=20 }">
		<p>성인 입니다</p>
	</c:if>
	
	<p>여러개 조건문</p>
	<c:choose>
		<c:when test="${requestScope.age >=20&& requestScope.age<30}">
			<p>20대입니다</p>
		</c:when>
				<c:when test="${requestScope.age >=30&& requestScope.age<40}">
			<p>30대입니다</p>
		</c:when>
		<c:otherwise>
			<p>40대 이상입니다</p>
		</c:otherwise>
	</c:choose>
	
	
	<p>반복문</p>
	<ul>
		<c:forEach var="i" begin="1" end="10">
			<li>${i }</li>
		</c:forEach>
	</ul>
	<p>반복문 - 시작값,종료값, 증감값 설정해서 반복</p>
	<ul>
		<c:forEach var="i" begin="1" end="10" step="2">
			<li>${i }</li>
		</c:forEach>
	</ul>
	
	<!-- 저장해놓은 list 속 객체들 꺼내보기 -->
	<ul>
	<!-- 
		상태변수
			current: 현재 아이템 값
			index : 인덱스번호
			count : 1부터 순서값 시작
			first : 해당 순서가 첫번째인지 확인
			last : 해당 순서가 마지막인지 확인
			begin : 시작값
			end :  마지막값
			step : 증가값
		
	 -->
	<c:forEach var="m" items="${requestScope.list }" varStatus="status">
		<li>${m.toString() },${status.count }</li>
	</c:forEach>
	</ul>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
</body>
</html>