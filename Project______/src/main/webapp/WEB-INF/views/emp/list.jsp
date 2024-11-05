<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<html>
<head>
    <title>사원 목록</title>
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
.list {
	width: auto;
	margin: auto;
	margin-top: 30px;
	background: #fff;
	padding: 20px;
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
height: 50px;
padding: 10px 5px;
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
    <div class="list"><div>
    <h1>사원 목록</h1>

    <table border="1">
        <tr>
        	<th>em_photo</th> 
            <th>userid</th>
            <th>dept_name</th> 
            <th>em_name</th>
            <th>em_birth</th>
            <th>em_hiredate</th>
            <th>em_gender</th>
            <th>em_phone</th>
            <th>em_address</th>
            <th>em_detailaddress</th>
            <th>em_email</th>  
            <th>em_salary</th>   
            <th>ranknum</th>
            <th>vac_no</th>
        </tr>
        
         <c:forEach items="${emp}" var="e">
         <tr>
         	<td style="padding:1px;"> <img src="/upload/${e.em_photo}" alt="사진없음" width="200"></td>
         	<td> ${e.userid}</td>
         	<td> ${e.dept_name}</td>
       		<td> ${e.em_name}</td>
       		<td><fmt:formatDate value="${e.em_birth}" pattern="yyyy년 MM월 dd일" /></td>
       		<td><fmt:formatDate value="${e.em_hiredate}" pattern="yyyy년 MM월 dd일" /></td> 
       		<td> ${e.em_gender}</td>
       		<td> ${e.em_phone}</td>
       		<td> ${e.em_address}</td>
       		<td> ${e.em_detailaddress}</td>
       		<td> ${e.em_email}</td>
       		<td> ${e.em_salary}</td>
       		<td> ${e.ranknum}</td>
       		<td> ${e.vac_no}</td>
       	 </tr>
         </c:forEach>
       
    </table>
    </div></div>
    </main>
</body>
</html>
