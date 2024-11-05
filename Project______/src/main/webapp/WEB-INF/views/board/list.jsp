<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
    <title>Board List</title>
    <!-- CSS와 스타일시트 링크 등 추가 -->
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
        
		#center {
			text-align : center;
			margin-left: auto;
			margin-right: auto;
			margin:80px;
			}
			
		.attend-buttons {
			margin-right: 180px;
   			text-decoration-line: none;
  			 color: inherit; 
   }

   			
   			 
table {
        width: 80%;
        border-top: 1px solid #444444;
        border-collapse: collapse;
        margin-left:auto; 
        margin-right:auto;
        
      }
      
      td {
  padding: 8px;
  text-align: left;
  border-bottom: 1px solid #ddd;
  text-align: center;
}

th {
  padding: 8px;
  text-align: left;
  text-align: center;
  border-top: 2px solid #000;
  border-bottom: 2px solid #000;
  color: #000;
}
      

#page {
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
	<div id="center">
		<h1>게시판</h1>
		<hr style="width: 4% "></hr><br>
		
		<div id="search" align="center">
	<form action = "search">
		<select name="searchn">
			<option value="0">제목</option>
			<option value="1">내용</option>
			<option value="2">작성자</option>
		</select>
		<input type="text" name="search" size="30" maxlengh="70"/>
		<input type="submit" value="검색" />
		</form></div>
		
			<div   align="right">
			<div class="attend-buttons">
			<p><button><a href="/main"  target='_blank'></a><a href="write">글 등록</a></button></p>
		
		</div>
            </div>
	

		<c:if test="${count != 0 }">
			<table>
				<tr>
					<th>No.1</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>조회수</th>
				</tr>
				<c:forEach items="${bList}" var="b">
					<tr>
						<td>${b.num}</td>
						<td><a href ="content/${b.num}">${b.title}</a></td>
						<td>${b.userid }</td>
						<td><fmt:formatDate value="${b.regdate}" dateStyle="short"/> </td>
						<td>${b.readcount }</td>
					</tr>
				</c:forEach>
			</table>
			<div id="page"><br>
				<c:if test="${begin > pageNum }">
					<a href="list?p=${begin-1 }"> [이전]</a>
				</c:if>
				<c:forEach begin="${begin }" end="${end}" var="i">
					<a href="list?p=${i}">${i}</a>
				</c:forEach>
				<c:if test="${end < totalPages }">
					<a href="list?p=${end+1}">[다음]</a>
				</c:if>
			</div>

		</c:if>
		<c:if test="${count == 0 }">
	아직 입력한 글이 없습니다.
</c:if>
	</div></main>
</body>
</html>