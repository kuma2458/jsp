<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script type="text/javascript">

function btnUpdateClick(){
	console.log($(this).parent().parent().find('input'));	
	let d={};
	$(this).parent().parent().find('input').each((idx,item)=>{
		d[$(item).attr('name')]=$(item).val();	
	});
		console.log(d);
		$.ajax({
			url:'majorUpdate.do',
			data:d,
			dataType:'json',
			success:function(r){
				console.log(r);
				//받아온 데이터를 tbody에 새로 태그를 만들어서 변경
				const tag = r.list.reduce((acc,cur,idx)=>{
					return acc+`<tr><td><input type='text' name='majorNo' value='\${cur.majorNo }' readonly></td><td><input type='text' name='majorName' value='\${cur.majorName }'></td><td><button class="btn_update">수정</button><button class="btn_delete">삭제</button></td></tr>`
				},'')
				console.log(tag);
				$('.container>table>tbody').html(tag);
				$('.btn_update').click(btnUpdateClick);
				$('.btn_delete').click(btnDeleteClick);
			}
		})
		
}
function btnDeleteClick(){
	console.log($(this).parent().parent().find('input').eq(0));	
	let d={
			majorNo : $(this).parent().parent().find('input').first().val()
	};

		console.log(d);
		$.ajax({
			url:'majorDelete.do',
			data:d,
			dataType:'json',
			success:function(r){
				console.log(r);
				//받아온 데이터를 tbody에 새로 태그를 만들어서 변경
				const tag = r.list.reduce((acc,cur,idx)=>{
					return acc+`<tr><td><input type='text' name='majorNo' value='\${cur.majorNo }' readonly></td><td><input type='text' name='majorName' value='\${cur.majorName }'></td><td><button class="btn_update">수정</button><button class="btn_delete">삭제</button></td></tr>`
				},'')
				console.log(tag);
				$('.container>table>tbody').html(tag);
				$('.btn_update').click(btnUpdateClick);
				$('.btn_delete').click(btnDeleteClick);
			}
		})
		
}
	$(()=>{
		$('.btn_major').click(function(){
			let queryString={
					majorNo: $('#txt_major_no').val(),
					majorName : $('#txt_major_name').val()
				}
			$.ajax({
				url:"majorInsert.do",
				data:queryString,
				type:"get",
				dataType:"json",
				success:function(r){
					console.log(r);
					//받아온 데이터를 tbody에 새로 태그를 만들어서 변경
					const tag = r.list.reduce((acc,cur,idx)=>{
						return acc+`<tr><td>\${cur.majorNo }</td><td>\${cur.majorName }</td><td><button class="btn_update">수정</button> <button class="btn_delete">삭제</button></td></tr>`
					},'')
					console.log(tag);
					$('.container>table>tbody').html(tag);
					$('.btn_update').click(btnUpdateClick);
					$('.btn_delete').click(btnDeleteClick);
				}

			});
		});
		
		$('.btn_update').click(btnUpdateClick);
		$('.btn_delete').click(btnDeleteClick);
		
		
		
		
		
	})	

</script>
<style type="text/css">
*{
	margin:0;
	padding:0;
}

table{
	margin-top: 30px;
	margin-right:30px;
	box-sizing: border-box;
	border-collapse: collapse;
}

tr,td,th{

	border:1px solid black;
	padding:10px;
}

nav{
	margin:0 auto;
	width: 1200px;
	
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

.container{
		width:1200px;
		display: flex;
		flex-flow:row nowrap;
		margin: 0 auto;
	}
.frm_major{
	margin-top: 30px;
	width:300px;
	display:flex;
	flex-flow:column nowrap;
}
.frm_major>*{
	height:70px;
	font-size:16px;
}
tbody input{

font-size:20px;
border:none;
}

</style>
</head>
<body>
	<nav>
		<ul>
			<li><a href="main.do">홈</a></li>
			<li><a href="registerStudentView.do">학생정보 등록</a></li>
			<li><a href="majorMain.do">학과관리</a></li>
			<li><a href="scholarshipMain.do">장학생관리</a></li>
			<li><a href="logout.do">로그아웃</a></li>

		</ul>
	</nav>
<div class="container">
	<table>
		<thead>
			<tr>
				<th>학과번호</th>
				<th>학과명</th>
				<th>수정/삭제</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="major" items="${sessionScope.majorList }">
				<tr>
					<td><input type='text' name='majorNo' value='${major.majorNo }' readonly></td>
					<td><input type='text' name='majorName' value='${major.majorName }'></td>
					<td>
					<button class="btn_update">수정</button>
					<button class="btn_delete">삭제</button>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	
	</table>
	<div class="frm_major">
		<input type="text" id="txt_major_no" placeholder="학과번호 입력">
		<input type="text" id="txt_major_name" placeholder="학과명 입력">
		
		
		<button type="button" class="btn_major">등록</button>
		
	</div>
	</div>
</body>
</html>