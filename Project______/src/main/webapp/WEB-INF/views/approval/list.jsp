<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
    <title>결재 목록</title>
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
td a {
	margin: 10px auto;
}

.abutton{
			margin-left: 200px;
   			text-decoration-line: none;
  			 color: inherit; 
}
#list{
			margin-right: 140px;
   			text-decoration-line: none;
  			 color: inherit; 
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
  
            <!-- ... -->

    
	<div align= "center" id="center">
		<h1>전자 결재 시스템</h1>
		<hr style="width: 10% "></hr><br>
		
		
		<div  class="abutton">
		<h2 align= "left" style=" ">기안 목록</h2>
		</div>
		
			<div id="list" colspan="2" align="right">
		<form action = "/myapproval/list	">
				<p><input type="submit" value="결재 문서"></p>
		</form>
		</div>
		
		<div id="list" colspan="2" align="right">
    <form action="write">
        <button type="submit">등록</button>
    </form>
</div>
		

		<c:if test="${count != 0 }">
			<table>
				<tr>
					<th>기안 종류</th>
					<th>작성자</th>
					<th>기안 시작</th>
					<th>기안 끝</th>
					<th>결제자</th>
					<th>진행상태</th>
						
				</tr>
				<c:forEach items="${app1}" var="a">
				<tr>
					<td><button><a href ="content/${a.appnum}">${a.at}</a></button></td>
					<td>${a.em}</td>
					<td><fmt:formatDate value="${a.startdate}" pattern="yyyy.MM.dd"/></td>
					<td><fmt:formatDate value="${a.enddate}" pattern="yyyy.MM.dd"/></td>
				<td>
				${a.em2}[${a.pos2}], ${a.em3}[${a.pos3}], ${a.em4}[${a.pos4}]
				</td>
				<td>
				${a.status_result}
				</td>
     			</c:forEach>
				
				
				
				
				
				
				
				
				
				
				
		
			</table><br>
			
		
			
			
			<div id="page"><br>
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
			

		</c:if>
		<c:if test="${count == 0 }">
	아직 입력한 글이 없습니다.
</c:if>
</main>
</body>
</html>

