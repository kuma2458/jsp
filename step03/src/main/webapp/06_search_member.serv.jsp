<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
    $(function(){
    	//검색 버튼 클릭을 했을때
    	//search.do 경로로 kind 값과, search 값을 ajax로 보내는 부분을 작성
    	//결과는 로그로 출력
    	$('button').click(function() {
            let d = $('form').serialize();
			$.ajax({
                url : 'search.do',
                data : d,
                type : 'get',
                dataType : 'json',
                success : function(r){
                    console.log(r);
                    $('tbody').html('');
                    for(i=0;i<r.length;i++){
                    	let tag='<tr>';
                    	tag+='<td>'+r[i].id+'</td>';
                    	tag+='<td>'+r[i].passwd+'</td>';
                    	tag+='<td>'+r[i].name+'</td>';
                    	tag+='<td>'+r[i].age+'</td>';
                    	tag+='<td>'+r[i].gender+'</td>';
                    	$('tbody').append(tag);
                    }
                }
            })
		});
    });
</script>
</head>
<body>
    <form>
        <select name="kind">
            <option value="m_id">아이디</option>
            <option value="m_name">이름</option>
            <option value="m_gender">성별</option>
        </select>
        <input type="text" name="search" placeholder="검색어를 입력하세요"> 
        <button type="button">검색</button>
    </form>
    <table>	
        <thead>
            <tr>
                <th>아이디</th>
                <th>암호</th>
                <th>이름</th>
                <th>나이</th>
                <th>성별</th>
            </tr>
        </thead>
        <tbody>
        <!-- ajax 결과가 추가될 영역     -->
        </tbody>
    </table>
</body>
</html>