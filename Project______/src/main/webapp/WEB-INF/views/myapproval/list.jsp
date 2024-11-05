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
             padding-left: 20px;
            min-height: 90px;
            border-bottom: #e8491d 3px solid;
        }
        
        .attendance-buttons {
        	padding-left: 85%;
        }
        nav {
        background: #333;
            float: left;
            width: 150px;
            text-align: center;
            margin-top: 20px;
        }
        nav ul {
            list-style-type: none;
            padding: 0;
        }
        nav ul li {
            display: inline;
            margin-left: 0px;
        }
        nav ul li a {
            color: #fff;
            text-decoration: none;
            font-size: 1.2em;
        }
        main {
        margin-left: 150px;
        padding: 10px;
        }
		#center {
			width: 700px;
			margin-left: auto;
			margin-right: auto;
			text-align : center;
		
			
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
  
}
aside div a {
	color: #fff;
	text-decoration: none;
	font-size: 1.2em;
	}

table {
        width: 100%;
        border-top: 1px solid #444444;
        border-collapse: collapse;
        margin-left:auto; 
        margin-right:auto;
        
      }
      

      td {
  padding: 10px;
  text-align: left;
  border-bottom: 1px solid #ddd;
  text-align: center;
}

th {
  padding: 10px;
  text-align: left;
  text-align: center;
  border-top: 2px solid #000;
  border-bottom: 2px solid #000;
  color: #000;
}
a {
	margin: 10px auto;
}

#page {
			text-align: center;
		}
		</style>
	</head>
<body>
    <header>
         <div class="user-info">
                    <span>[${user.em_name}님 접속하셨습니다]</span><br>
                    <span>[${user.dept_name}]</span> 
                    <a href="/login/logout"><button style="cursor: pointer;">로그아웃</button></a>
   </div>
         <div class="attendance-buttons" style="float: right; padding-right: 10%;">		 		
		
			<a href="/attendance/check?commit=출근"><button style="cursor: pointer;">출근</button></a> 
			<a href="/attendance/check?commit=퇴근"><button style="cursor: pointer;">퇴근</button></a>
			
		</div>
        <!-- 다른 메뉴 항목 -->
    </header>

  
            <!-- 왼쪽 메뉴 항목 -->
           <aside>
           <div><a href="/board/list">게시판</a></div>
           <div> <a href="/attendance/deptread">근태 확인</a></div>
          <div>  <a href="/emp/list">사원 목록</a></div>
           <div> <a href="/dept/list">부서 목록</a></div>
           <div><a href="/approval/list">전자 결재 시스템</a></div>
           <div> <a href="/emp/insert">사원추가</a></div>
          <div> <a href="/info/profile">마이페이지</a></div>
            </aside>	
            
            <!-- ... -->
  
	<div id="center">
		<h1>내 결재 문서</h1>
		<hr  style="width: 20% "></hr><br>
		
		<div id="list" colspan="2" align="right">
		<form action = "/approval/list">
				<input type="submit" value="기안 목록"><br>
				
		</form>
		</div>
		
		<h2 margin-left=" 120px" align= "left">미처리 결재</h2><br>
		

		<c:if test="${count != 0 }">
			<table>
				<tr>
					<th>기안 종류</th>
					<th>작성자</th>
					<th>기간 일수</th>
					<th>결재 상태</th>
				</tr>
				
				<c:forEach items="${sList}" var="a">
				<tr>
					<td><button><a href ="content/${a.appnum}">${a.atype}</a></button></td>
					<td>${a.userid }</td>
					<td><fmt:formatDate value="${a.startdate}" pattern="yyyy/MM/dd"/> ~ <fmt:formatDate value="${a.enddate}" pattern="yyyy/MM/dd"/></td>
					<td>
					<c:choose>
						<c:when test="${a.status_1 == 0 }">
							<input type="button" value="승인" onclick="location.href='/myapproval/update?appnum=${a.appnum}&status=1&no=1'">
							<input type="button" value="반려" onclick="location.href='/myapproval/update?appnum=${a.appnum}&status=2&no=1'"> 
						</c:when>
						<c:when test="${a.status_1 !=0 and a.status_2 == 0 }">
							<input type="button" value="승인" onclick="location.href='/myapproval/update?appnum=${a.appnum}&status=1&no=2'">
							<input type="button" value="반려" onclick="location.href='/myapproval/update?appnum=${a.appnum}&status=2&no=2'"> 
						</c:when>
						<c:when test="${a.status_1 !=0 and a.status_2 != 0 and a.status_3 == 0 }">
							<input type="button" value="승인" onclick="location.href='/myapproval/update?appnum=${a.appnum}&status=1&no=3'">
							<input type="button" value="반려" onclick="location.href='/myapproval/update?appnum=${a.appnum}&status=2&no=3'"> 
						</c:when>
					</c:choose>
					
				
				</td>
			</c:forEach>
			
				</tr>
				
			</table>
			
			<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
			<script>
				$(function(){
					$("a[id]").click(function(){
						let appnum = $(this).attr("id");
						$.ajax({url:"/myapproval/update", data:"statuts_1="+statuts_1, method:"PUT"}
						).done(function(){
							location.href="/myapproval/list";
						})
						return false;
					})//click
				})//ready
			
			</script>
			
			
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
</div>
</body>
</html>
