<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<title>글쓰기</title>
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
        font-weight:bold;
        
	}
	th{
	
  	text-align: left;
  	text-align: center;
	}
	
	td{
	text-align: right;
  	text-align: center;
	}
	
	.content{
	
		text-align: center;
		resize: none;
		
	}
	.button-container{
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

	<h1 style="text-align: center;">새 글 작성</h1>
	<h5 style="text-align: center;">게시판에 남기고 싶은 글이 있으시다면 남겨주세요!</h5>
	<form method="post" id="writeform">

	<hr style=" width: 38%">
	
	<table>
	<tr><th>제목</th><th><input type="text" name="title" placeholder="제목 입력" size="30"></th></tr>
		
	<tr><td>작성자</td><td><input name="userid" value="${user.userid}" readonly size="30" ></td></tr>
			
		</table>
		
		</hr>

		
		<div class="content">
		<hr  style="width: 38%"></hr>
			<p><textarea name="content" type="text" placeholder="내용을 입력하세요" rows="20" cols="100" style= "resize: none;"></textarea></p>
			
		</div>
		<hr style="width: 38%"></hr>
		
		
		<div class="button-container">
		
			<tr>
				<th><input type="submit" value="등록"></th>
				<th><input type="submit" value="취소"></th>
			
			</tr>
			
	</div>
	
		</form></main>
	
</body>
</html>