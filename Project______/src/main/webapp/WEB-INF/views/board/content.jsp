<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>글 상세보기</title>

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

table {
	width: 70%;
	text-align: center;
	margin: auto;
	border-collapse: collapse;
}

th, td {
	border: 1px solid #ddd;
	padding: 8px;
	text-align: center;
	font-weight: bold;
}

.abuttons {
	margin-right: 15%;
	text-decoration-line: none;
	color: inherit;
}

.bbuttons {
	margin-right: 15%;
	text-decoration-line: none;
	color: inherit;
}
</style>
</head>
<body>
	<header>
		<div class="user-info" style="float: left; padding-left: 10%;">
			<span>[${user.dept_name}]</span><span>[${user.em_name}님
				접속하셨습니다]</span> <a href="/login/logout"><button
					style="cursor: pointer;">로그아웃</button></a>

		</div>
		<div class="attendance-buttons"
			style="float: right; padding-right: 10%;">
			<a href="/attendance/check?commit=출근"><button
					style="cursor: pointer;">출근</button></a> <a
				href="/attendance/check?commit=퇴근"><button
					style="cursor: pointer;">퇴근</button></a>

		</div>
	</header>
	<aside>
		<div>
			<a href="/main">메인 화면</a>
		</div>
		<div>
			<a href="/board/list">게시판</a>
		</div>
		<div>
			<a href="/file/list">자료실</a>
		</div>
		<div>
			<a href="/attendance/deptread">근태 확인</a>
		</div>
		<div>
			<a href="/emp/list">사원 목록</a>
		</div>
		<div>
			<a href="/dept/list">부서 목록</a>
		</div>
		<div>
			<a href="/emp/insert">사원추가</a>
		</div>
		<div>
			<a href="/approval/list">전자 결재 시스템</a>
		</div>
		<div style="border: 0px;">
			<a href="/info/profile">마이페이지</a>
		</div>
	</aside>
	<main>
		>
		<h1 align="center">글 수정</h1>
		<hr style="width: 5%"></hr>
		<br>
		<table border="1">
			<tr>
				<td>제목</td>
				<td>${dto.title}</td>
				<th>등록일</th>
				<th><fmt:formatDate value="${dto.regdate }" dateStyle="long" /></th>
				<td>작성자</td>
				<td>${dto.userid}</td>
				<th>조회수</th>
				<th>${dto.readcount}
			</tr>


		</table>
		<c:if test="${ user.userid == dto.userid }">
		</c:if>
		<div class="abuttons" align="right">
			<button>
				<a href="/board/update/${dto.num}"> 수정</a>
			</button>
		</div>


		<hr style="width: 70%"></hr>

		<hr style="width: 70%"></hr>

		<table style="align: left">

			<tr>
				<td>내용</td>
			</tr>
			<tr>
				<td>${dto.content}</td>
			</tr>

		</table>
		<hr style="width: 70%"></hr>
		<br>

		<div class="bbuttons" align="right">
			<button>
				<a id="${dto.num}" href="#"> 삭제</a>
			</button>
			<button>
				<a href="../list"> 이동</a>
			</button>

		</div>


		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
		<script>
			$(function() {
				$("a[id]").click(function() {
					let num = $(this).attr("id");
					$.ajax({
						url : "/board/delete",
						data : "no=" + num,
						method : "delete"
					}).done(function() {
						location.href = "/board/list";
					})
					return false;
				})//click
			})//ready
		</script>
	</main>
</body>
</html>
