<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>근태 확인</title>
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
   justify-content: center;
    align-items: flex-start;
    display:flex;
    gap: 20px;
}
.search {
	width: 300px;
	margin-top: 30px;
	background: #fff;
	padding: 20px;
	border-radius: 5px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}
.search input[type="text"], .search input[type="date"] {
	width: 250px;
	padding: 10px;
	margin-top: 5px;
	margin-bottom: 10px;
	border: 1px solid #ccc;
	border-radius: 5px;
}
.search input[type="submit"] {
	width: 100px;
	padding: 10px;
	margin-bottom: 5px;
	border-radius: 5px;
	background: #333;
	color: #fff;
	border: none;
	cursor: pointer;
}
.check {
	width: 500px;
	margin-top: 30px;
	padding: 20px;
	background: #fff;
	border-radius: 5px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

table {
border: 3px solid;
border-spacing: 0px;
    border-color: #2E2E2E;
    border-radius: 5px;
text-align: center;
}
th, td {
border: 1px solid;
padding: 5px;
border-color: #2E2E2E;
}
th {
background: #A4A4A4;
}
tr:nth-child(2n+1) {
background: #E6E6E6;
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
    <div class="search">
    <h2>근태 확인</h2>
    <form action="/attendance/deptread" method="post">
    
    
        <span>직원 ID:</span>
        <select name="userid">
    	<c:forEach items="${name}" var="n">
		<option value="${n.userid}">${n.em_name}</option>
		</c:forEach>
		</select><br><br>
        
        <label for="startDate">시작 날짜:</label>
        <input type="date" id="startDate" name="startDate"><br><br>
        
        
        <label for="endDate">종료 날짜:</label>
        <input type="date" id="endDate" name="endDate"><br><br>
        
        <input type="submit" value="근태 조회">
        </form></div>
        <div class="check">
        <h3>근무 내역</h3>
        <table>
        	<colgroup>
        		<col style="width:140px;">
        		<col style="width:220px;">
        		<col style="width:50px;">
        	</colgroup>
        	<thead>
        		<tr>
        	 		<th>이름 [사원번호]</th>
        		 	<th>날짜</th>
        		 	<th>상태</th>
        		 </tr>
        	</thead>
        	<tbody>
        		<c:forEach items="${view}" var="v">
				<tr>
					<td>${v.em_name} [${v.userid}]</td> 
					<td><fmt:formatDate value="${v.checktime}" pattern="yyyy년 MM월 dd일 HH:mm:ss" /></td>
					<td>${v.commit}</td>
				</tr>
				</c:forEach>
        	</tbody>
        </table>
        	 
        </div>
    </main>
</body>
</html>
