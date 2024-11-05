<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>

<title>Insert title here</title>
<style>
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
	background-color: #f4f4f4;
}

.container {
	width: 80%;
	margin: auto;
	overflow: hidden;
}

header {
	background: #333;
	color: #fff;
	padding-top: 30px;
	min-height: 70px;
	border-bottom: #e8491d 3px solid;
}

aside {
	background: #333;
	float: left;
	width: 150px;
	margin-top: 50px;
	border-bottom-right-radius: 5px;
	border-top-right-radius: 5px;
}

aside div {
	display: flex;
	justify-content: center;
    align-items: center;
    border-bottom: 1px solid #fff;
    padding: 10px 2px;
}
aside div a {
	color: #fff;
	text-decoration: none;
	font-size: 1.2em;
}

main {
	margin-left: 150px;
	padding: 10px;
}
     table{
       text-align: center;
        margin-right:auto;
        margin-left: 580px;
        
        
	}
	th{
	
  	text-align: left;
  	text-align: center;
	}
	
	td{
	text-align: right;
  	text-align: center;
	}
	
.orange{
text-align: center;
}


</style>


</head>
<body>
<header>
		<div class="user-info" style="float: left; padding-left: 10%;">
			<span>[${user.dept_name}]</span><span>[${user.em_name}님 접속하셨습니다]</span>
			<a href="/login/logout"><button style="cursor: pointer;">로그아웃</button></a>

		</div>
		<div class="attendance-buttons" style="float: right; padding-right: 10%;">
			<a href="/attendance/check?commit=출근"><button style="cursor: pointer;">출근</button></a> 
			<a href="/attendance/check?commit=퇴근"><button style="cursor: pointer;">퇴근</button></a>
			
		</div>
	</header>
	<aside>
			<div><a href="/main">메인 화면</a></div>
			<div><a href="/board/list">게시판</a></div>
			<div><a href="/file/list">자료실</a></div>
     		<div><a href="/attendance/deptread">근태 확인</a></div>
			<div><a href="/emp/list">사원 목록</a></div>
			<div><a href="/dept/list">부서 목록</a></div>
			<div><a href="/emp/insert">사원추가</a></div>
			<div><a href="/approval/list">전자 결재 시스템</a></div>
			<div style="border: 0px;"><a href="/info/profile">마이페이지</a></div>
	</aside>
	<main>
<h1  style="text-align: center;" >글 수정</h1>
<h5 style="text-align: center;"">글  수정을 원하시면 수정해 주세요</h5><br>
<form method="post" id="updateform" action="/board/update" >


<hr style=" width: 38%">
<input type="hidden" name="_method" value="put">
</hr>

	<table>
		<tr>	
			<td class="orange">제목</td>
			<td><input name="title" value="${dto.title }"/>
				<input name="num" value="${dto.num}" type="hidden"> 
			</td>
		</tr>
		<tr>
			<td class="orange">작성자</td>
			<td><input name="id" value="${dto.userid}" readonly></td>
		</tr>
		
		</table>
		
		<hr style=" width: 38%"></hr>
			<div class="orange">
			<p><textarea name="content" type="text" placeholder="내용을 입력하세요" rows="20" cols="100" style= "resize: none;">${b.content}</textarea></p>
	<hr style=" width: 38%"></hr>
	
		<tr>
		
			<td colspan="2" align="center" ><input type="submit" value="수정 완료"> </td>
		</tr>
</div>

</form></main>
</body>
</html>