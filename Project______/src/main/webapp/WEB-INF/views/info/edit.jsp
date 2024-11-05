<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 - 내 정보 수정</title>
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
width: 400px;
height: 30px;
margin: auto;
text-align: center;
}
.form-group{
height: 47px;
}
.form-group input[type="text"], .form-group input[type="email"],  .form-group input[type="password"]{
	width: 250px;
	padding: 10px;
	margin-top: 5px;
	margin-bottom: 5px;
	border: 1px solid #ccc;
	border-radius: 5px;
	float:right;
}
.form-group label {
float:left;
padding-top:13px;
padding-left:13px;
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

			<h1>마이페이지 - 내 정보 수정</h1>

			<div>
				<h2>기본 정보 확인</h2>
				<div><strong>사원번호:</strong> ${user.userid}</div> 
				<div><strong>이름:</strong> ${user.em_name}</div>
				<div><strong>생년월일:</strong> <fmt:formatDate value="${user.em_birth}" pattern="yyyy년 MM월 dd일"/></div>
				<div><strong>입사일:</strong> <fmt:formatDate value="${user.em_hiredate}" pattern="yyyy년 MM월 dd일"/></div>
				<div><strong>부서명:</strong> ${user.dept_name}</div>
				<div><strong>연봉:</strong> ${user.em_salary}</div>
			</div>
				<!-- 사용자가 수정한 정보를 확인합니다. -->
			<div>
				<h2>개인정보 수정</h2>
				<form id="updateForm" action="/info/update-mypage" method="get">
					<!-- 수정할 내용 입력 폼 -->

					<!-- 추가 필드들을 여기에 추가 -->
					<div class="form-group">
						<label for="phoneNumber">전화번호:</label> <input type="text"
							id="phoneNumber" name="em_phone">
					</div>
					<div class="form-group">
						<label for="email">e-mail:</label> <input type="email" id="email"
							name="em_email">
					</div>
					<div class="form-group">
						<label for="address">주소:</label> <input type="text"
							id="em_address" name="em_address">
					</div>
					<div class="form-group">
						<label for="detailAddress">상세주소:</label> <input type="text"
							id="detailAddress" name="detailAddress" >
					</div>
					<div>
					<button id="addressSearchBtn" style="width:70px; height:30px; float:right;">주소찾기</button></div>
					<script
						src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
					<div class="form-group">
						<label for="password">비밀번호:</label> <input type="password"
							id="password" name="Password">
					</div>
					<div class="form-group">
						<label for="confirmPassword">비밀번호 확인:</label> <input
							type="password" id="confirmPassword" name="confirmPassword">
					</div>

					<!-- 비밀번호 일치 여부 확인 메시지 -->
					<div id="pwConfirm"style="width:150px; height:25px; float:right;"></div>

					<!-- 비밀번호 불일치 메시지 -->
					<div id="pwMismatch" style="width:70px; height:25px; color: red;"></div>

					<!-- JavaScript 코드 -->
					<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
					<script>
						function pwCheck() {
							if ($('#password').val() == $('#confirmPassword')
									.val()) {
								$('#pwConfirm').text('비밀번호 일치').css('color',
										'green');
							} else {
								$('#pwConfirm').text('비밀번호 불일치').css('color',
										'red');
							}
						}

						// 비밀번호 입력이 변경될 때마다 pwCheck 함수 호출
						$('#password, #confirmPassword').on('input', pwCheck);

						// 폼 서브밋 전에 실행되는 함수
						$('#updateForm')
								.submit(
										function() {
											// 빈 칸이 있는지 확인
											if ($('#phoneNumber').val() === ''
													|| $('#email').val() === ''
													|| $('#password').val() === ''
													|| $('#confirmPassword')
															.val() === '') {
												showError('빈 칸을 채워주세요');
												return false;
											}

											// 비밀번호 일치 여부 확인
											if ($('#password').val() !== $(
													'#confirmPassword').val()) {
												showError('비밀번호가 일치하지 않습니다');
												return false;
											}

											// 여기에서 추가적인 유효성 검사를 수행할 수 있습니다.

											// 모든 검사를 통과하면 true 반환
											return true;
										});

						function showError(message) {
							alert(message);
						}

						
						// 주소찾기 버튼 클릭 시 실행되는 함수
						$('#addressSearchBtn')
								.on(
										'click',
										function() {
											new daum.Postcode(
													{
														oncomplete : function(
																data) {
															// 팝업에서 검색결과 항목을 클릭했을 때 실행되는 함수
															// 여기에서 주소 정보(data)를 활용하여 필요한 작업을 수행할 수 있습니다.

															// 찾은 주소를 주소 입력 폼에 넣기
															document
																	.getElementById('em_address').value = data.address;

															// 빈 칸 검사를 우회하기 위해 값 입력 후 이벤트 강제 발생
															$('#em_address')
																	.trigger(
																			'input');
														}
													}).open();
										});

						// 주소 입력이 변경될 때마다 빈 칸 검사 우회
						$('#em_address').on('input', function() {
							showError(''); // 에러 메시지 초기화
						});
					</script>

					<!-- 저장 버튼 -->
					<div><button type="submit" style="width: 100px;
	padding: 10px;
	margin-bottom: 5px;
	border-radius: 5px;
	background: #333;
	color: #fff;
	border: none;
	cursor: pointer; float: right;">수정</button></div>
				</form>
			</div>
		</div>
	</main>
</body>
</html>
