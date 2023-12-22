<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script>
	$(function(){
		$('button').click(function(){
			$.ajax({
				url:'01_ajax_text.jsp',
				type:'get',
				datatype:'text',
				success:function(r){
					$("#result").html(r);
				}
			})
		})
	})


</script>
<body>
	<button>ajax 요청</button>
	<div id="result"></div>
</body>
</html>