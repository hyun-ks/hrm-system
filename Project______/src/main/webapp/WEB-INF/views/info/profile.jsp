<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>

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

.profile {
	width: 400px;
	margin: auto;
	margin-top: 30px;
	background: #fff;
	padding: 20px;
	border-radius: 5px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}
main div div div{
width: 350px;
height: 30px;
margin: auto;
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
		<div class="profile">
			<h1>마이페이지</h1>
<div>
			<h2>내 정보</h2>
			
				<div><strong>사원번호:</strong> ${user.userid}</div> 
				<div><strong>이름:</strong> ${user.em_name}</div>
				<div><strong>생년월일:</strong> <fmt:formatDate value="${user.em_birth}" pattern="yyyy년 MM월 dd일"/></div>
				<div><strong>입사일:</strong> <fmt:formatDate value="${user.em_hiredate}" pattern="yyyy년 MM월 dd일"/></div>
				<div><strong>부서명:</strong> ${user.dept_name}</div>
				<div><strong>연봉:</strong> ${user.em_salary}</div>
				<div><strong>전화번호:</strong> ${user.em_phone}</div>
				<div><strong>주소:</strong> ${user.em_address}</div>
				<div><strong>e-mail:</strong> ${user.em_email}</div>
			</div>
			<div style="height:45px;">
			<button type="button"
				onclick="location.href=('http://localhost:8081/info/edit');" style="width: 100px;
	padding: 10px;
	margin-bottom: 5px;
	border-radius: 5px;
	background: #333;
	color: #fff;
	border: none;
	cursor: pointer; float: right;">
				정보수정</button>
			</div>
		</div>
		
	</main>
</body>
</html>