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
				url:'02_ajax_json.jsp',
				type:'get',
				datatype:'json',
				success:function(r){
					var str=r.year+"/";
					str+=r.month+"/"+r.date+" ";
					str+=r.hour + ":" + r.minute + ":"+r.second;
					$("#result").html(str);
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