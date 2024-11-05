<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
    <title>file List</title>
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
            
       
            
 
table{
 		width: 70%;
		text-align: center;
        margin:auto;
        border-collapse: collapse;
	
}

th, td {
  border: 1px solid #ddd; 
  padding: 8px; 
  text-align: center;
  font-weight: bold;
}


.bbuttons{
			margin-right: 15%;
   			text-decoration-line: none;
  			color: inherit;
}

.cbuttons{
			margin-right: 15%;
   			text-decoration-line: none;
  			color: inherit;
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
<h3>업로드한 파일 목록</h3>
<div align="right">
			<a href="/main"></a><a href="upload">자료	 등록</a>
		</div>
<table>
	<tr><th>번호</th><th>제목</th><th>작성자</th><th>작성일</th></tr>
	<c:forEach items="${fList}" var="file">
		<tr>
			<td>${num}
				<c:set var="num" value="${num + 1 }"/>
			</td>
			<td><a href ="content/${file.fileid}">${file.title}</a></td>
			<td>${file.userid}</a></td>
			<td><fmt:formatDate value="${file.regdate}" dateStyle="short"/> </td>
		</tr>
	</c:forEach>
</table>
<div id="page">
				<c:if test="${begin > pageNum }">
					<a href="list?p=${begin-1 }">[이전]</a>
				</c:if>
				<c:forEach begin="${begin }" end="${end}" var="i">
					<a href="list?p=${i}">${i}</a>
				</c:forEach>
				<c:if test="${end < totalPages }">
					<a href="list?p=${end+1}">[다음]</a>
				</c:if>
			</div>

		<c:if test="${count == 0 }">
	아직 입력한 글이 없습니다.
</c:if>
<div id="search" align="center">
	<form action = "search">
		<select name="searchn">
			<option value="0">제목</option>
			<option value="1">내용</option>
			<option value="2">작성자</option>
		</select>
		<input type="text" name="search" size="15" maxlengh="50"/>
		<input type="submit" value="검색" />
		</form></div>	
</div></main>
</body>
</html>