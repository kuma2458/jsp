<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script >
	$(function(){
		$('button').click(function(){
		var numdata="num=" + $('input[name=num]').val();
		//var numdata=$('form').serialize();
		console.log(numdata);
		$.ajax({
			url:'client_ajax2.jsp',
			data:numdata,
			type:'get',
			dataType:'json',
			success:function(r){
				var tag="";
				for(i=0; i<r.length; i++)
					tag+="<span>"+r[i]+"</span>";
				$("#result").html(tag);
			}
		})
			
		})
	})
</script>
</head>
<body>
		<input type="number" name="num" id="num">
		<button>전송</button>
	<div id="result"></div>
</body>
</html>