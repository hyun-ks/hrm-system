<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>사원추가</title>
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
.insert {
	width: 500px;
	margin: auto;
	margin-top: 30px;
	background: #fff;
	padding: 20px;
	border-radius: 5px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}
.insert input[type="text"], .insert input[type="password"] {
	width: 250px;
	padding: 10px;
	margin-top: 5px;
	margin-bottom: 5px;
	border: 1px solid #ccc;
	border-radius: 5px;
}
.insert input[type="file"], .insert input[type="hidden"]{
padding-top:12px;
}
.insert button[type="button"]{
   float: right;
   margin-left: 180px;
   margin-top: 1px;
}
main form div div{
height: 48px;
}
main form div div label{
float:left;
padding-top:15px;
padding-left:15px;
}
main form div div input{
float:right;
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
		<form action="insert" method="post" enctype="multipart/form-data" class="insert">
		<h2>사원 추가</h2>
			<div>
			<div><label>userid</label> <input name="userid" type="text"></div> 
			<div><label>em_name</label> <input name="em_name" type="text"></div>
			<div><label>em_birth</label> <input name="em_birth" placeholder=" yyyy/MM/dd" type="text"></div>
			<div><label>em_hiredate</label> <input name="em_hiredate" placeholder=" yyyy/MM/dd" type="text"></div>
			<div><label>em_gender</label> <label style="float:right;"><input type="radio" name="em_gender" value="여">여</label>
			<label style="float:right;"><input type="radio" name="em_gender" value="남">남</label> </div> 
									 	 
			<div><label>em_phone</label> <input name="em_phone" type="text"></div>
			<div style="height:73px;"><label>em_address</label> <input name="em_address" id="em_address" type="text"><br>
            <button type="button" id="addressSearchBtn">주소찾기</button></div>
			<div><label>em_detailaddress</label> <input id="em_detailaddress" name="em_detailaddress" type="text"></div>
			<div><label>em_email</label> <input name="em_email" type="text"></div>
			<div><label>em_photo</label> <input name="photo" type="file"> 
										<input name="em_photo" type="hidden" value=""></div>
			<div><label>em_salary</label> <input name="em_salary" type="text"></div>
			<div><label>ranknum</label> <input name="ranknum" type="text"></div>
			<div><label>vac_no</label> <input name="vac_no" type="text"></div>
			<div><label>Password</label> <input name="Password" type="password"></div>

			<div style="height:40px;">
			<div style="float:right; width:220px;"><select name="dept_no" style="padding:5px; width:100px; height:38px;">
				<c:forEach items="${dept}" var="d">
					<option value="${d.dept_no}">${d.dept_name}</option>
				</c:forEach>
			</select> <input type="submit" value="추가" style="width: 100px;
	padding: 10px;
	margin-bottom: 5px;
	border-radius: 5px;
	background: #333;
	color: #fff;
	border: none;
	cursor: pointer; float: right;"></div></div>
			</div>
		</form>

		<!-- JavaScript 코드 -->
		<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
		<script
			src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

		<script>
			var addressSelected = false; // 주소 선택 여부를 나타내는 변수

			//주소찾기 버튼 클릭 시 실행되는 함수
			$('#addressSearchBtn')
					.on(
							'click',
							function() {
								new daum.Postcode(
										{
											oncomplete : function(data) {
												// 찾은 주소를 주소 입력 폼에 넣기
												document
														.getElementById('em_address').value = data.jibunAddress;

												// 주소를 선택했음을 표시
												addressSelected = true;

												// 빈 칸 검사를 우회하기 위해 값 입력 후 이벤트 강제 발생
												$('#em_address').trigger(
														'input');
											}
										}).open();
							});
		</script>
	</main>
</body>
</html>