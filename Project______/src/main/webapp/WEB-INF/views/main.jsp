<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>Main</title>
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
	width: 450px;
	height: 250px;
	padding: 10px;
	background: #fff;
	border-radius: 5px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.notices {
	padding: 10px;
	width: 550px;
	height: 443px;
	background: #fff;
	border-radius: 5px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.workhour {
	padding: 10px;
	width: 350px;
	height: 107px;
	margin-bottom: 5px;
	background: #fff;
	border-radius: 5px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.library {
	padding: 10px;
	width: 550px;
	height: 443px;
	background: #fff;
	border-radius: 5px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}



.deptattendance {
	padding: 10px;
	width: 1028px;
	height: 250px;
	background: #fff;
	border-radius: 5px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.myinfo {
	width: 200px;
	height: 30px;
	text-align: center;
	font-size: 20px;
	margin: auto;
	border-radius: 5px;
	box-shadow: inset 0 0 4px rgb(0 0 0/ 30%);
	display: flex;
	justify-content: center;
	align-items: center;
}

.myinfo b {
	display: flex;
	justify-content: center;
	align-items: center;
}

.myinfo_1 {
	width: 250px;
	height: 180px;
	float: right;
	margin-top: 20px;
	display: flex;
	justify-content: space-evenly;
	flex-direction: column;
}

.myinfo_2 {
	width: 150px;
	float: left;
	padding: 5px;
	display: flex;
	flex-direction: column;
	align-items: center;
	gap: 10px;
}

.deptatt {
	width: 500px;
	height: 30px;
	text-align: center;
	font-size: 20px;
	margin: auto;
	border-radius: 5px;
	box-shadow: inset 0 0 4px rgb(0 0 0/ 30%);
	display: flex;
	justify-content: center;
	align-items: center;
}

.deptatt_info {
	height: 200px;
	display: flex;
	align-items: center;
	justify-content: center;
	flex-wrap: wrap;
	overflow: hidden;
	gap: 10px;
}

.deptatt_info_1 {
	padding: 50px 0px;
	display: flex;
}

.deptatt_info_1 div {
	display: flex;
	text-align: center;
	justify-content: center;
	align-items: center;
	line-height: 25px;
}

.workhour_1 {
	width: 200px;
	height: 30px;
	text-align: center;
	font-size: 20px;
	margin: auto;
	border-radius: 5px;
	box-shadow: inset 0 0 4px rgb(0 0 0/ 30%);
	display: flex;
	justify-content: center;
	align-items: center;
}

.workhour_2 {
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	gap: 10px;
	padding-top: 10px;
	font-size: 18px;
}

.workhour_2 div {
	display: flex;
	align-items: center;
	gap: 10px;
}


.notices_1 {
	width: 250px;
	height: 30px;
	text-align: center;
	font-size: 20px;
	margin: auto;
	border-radius: 5px;
	box-shadow: inset 0 0 4px rgb(0 0 0/ 30%);
	display: flex;
	justify-content: center;
	align-items: center;
}

.library_1 {
	width: 250px;
	height: 30px;
	text-align: center;
	font-size: 20px;
	margin: auto;
	border-radius: 5px;
	box-shadow: inset 0 0 4px rgb(0 0 0/ 30%);
	display: flex;
	justify-content: center;
	align-items: center;
}

.notices_list table {
	width: 90%;
	border-top: 1px solid #444444;
	border-collapse: collapse;
	margin-left: auto;
	margin-right: auto;
	margin-top: 10px; /* 표 위쪽 여백 조절 */
}

.notices_list td, th {
	padding: 6px;
	text-align: center;
	border-bottom: 1px solid #ddd;
	height: 14px; /* 행의 높이 조절 */
}

.notices_list th {
	border-top: 2px solid #000;
	border-bottom: 2px solid #000;
	color: #000;
}

.calendar {
	font-family: Arial, sans-serif;
	width: 370px;
	height:329px;
	border: 1px solid #ccc;
	border-radius: 5px;
	overflow: hidden;
	background: #fff;
}

.calendar-header {
	display: flex;
	justify-content: space-between;
	background-color: #333;
	color: #fff;
	text-align: center;
	padding: 10px;
	font-weight: bold;
}

.calendar-header span {
	font-size: 19px;
}

.calendar-days {
	display: grid;
	grid-template-columns: repeat(7, 1fr);
}

.calendar-day {
	padding: 10px;
	border: 1px solid #ccc;
	text-align: center;
	cursor: pointer;
}

.calendar-day.empty {
	background-color: #f9f9f9; /* 빈 날짜의 배경색을 설정합니다. */
}

.calendar-day:hover {
	background-color: #f0f0f0;
}

.today {
	background-color: yellow;
}

.calendar-days .calendar-day:nth-child(7n+1), .calendar-days .calendar-day:nth-child(7n+7)
	{
	color: red;
}

.month-year-buttons {
	display: flex;
	gap: 25px;
	align-items: center;
	margin: auto;
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
		<table>
			<tr>
				<td>
					<div class="profile">
						<div class="myinfo">
							<b>나의 정보</b>
						</div>
						<div class="myinfo_1">
							<div>
								<strong>사원번호:</strong> ${user.userid}
							</div>
							<div>
								<strong>생년월일:</strong>
								<fmt:formatDate value="${user.em_birth}" pattern="yyyy년 MM월 dd일" />
							</div>
							<div>
								<strong>입사일:</strong>
								<fmt:formatDate value="${user.em_hiredate}"
									pattern="yyyy년 MM월 dd일" />
							</div>
							<div>
								<strong>부서명:</strong> ${user.dept_name}
							</div>
							<div>
								<strong>전화번호:</strong> ${user.em_phone}
							</div>
							<div>
								<strong>주소:</strong> ${user.em_address}
							</div>
							<div>
								<strong>e-mail:</strong> ${user.em_email}
							</div>
						</div>
						<div class="myinfo_2">
							<div>
								<img src="/upload/${user.em_photo}" alt="사진"
									style="width: 150px; height: 150px;">
							</div>
							<div>
								<strong>이름:</strong> ${user.em_name}
							</div>
						</div>
					</div>
				</td>
				<td style="padding-left: 3px;">
					<div class="deptattendance">
						<div class="deptatt">
							<b>부서원 근태</b>
						</div>
						<div class="deptatt_info">
							<c:forEach items="${view}" var="v">
								<div class="deptatt_info_1">
									<div style="width: 120px; height: 120px;">
										<img src="/upload/${v.em_photo}" alt="사진"
											style="width: 120px; height: 120px;">
									</div>
									<div style="width: 70px;">${v.em_position}
										<br> ${v.em_name} <br> ${v.commit}
									</div>
								</div>
							</c:forEach>

						</div>
					</div>

				</td>

			</tr>
		</table>
		<table>
			<tr>
				<td style="display: flex; flex-direction: column;">
					<div style="display: flex; flex-direction: column;">
						<div class="workhour">
							<div class="workhour_1">
								<b>근로 시간</b>
							</div>
							<div class="workhour_2">
								<div>
									<img src="images/workhour.png"
										style="width: 30px; height: 30px;">
									<div>
										<fmt:formatDate value="${Date}" pattern="yyyy년 MM월 dd일" />
									</div>
								</div>

								<div style="gap: 7px;">
									현재 <span>${Time} </span>근로중입니다.
								</div>

							</div>
						</div>
						
					</div>
					<div class="calendar">
						<div class="calendar-header" id="calendarHeader">
							<div class="month-year-buttons">
								<button id="prevMonthBtn">이전 달</button>
								<span id="monthYearText"></span>
								<button id="nextMonthBtn">다음 달</button>
							</div>
						</div>
						<div class="calendar-days" id="calendarDays"></div>
					</div> <script>
						document
								.addEventListener(
										'DOMContentLoaded',
										function() {
											const calendarHeader = document
													.getElementById('calendarHeader');
											const calendarDays = document
													.getElementById('calendarDays');
											const monthYearText = document
													.getElementById('monthYearText');

											// 1월 1일의 요일을 반환하는 함수
											function getFirstDayOfWeek(year,
													month) {
												return new Date(year,
														month - 1, 1).getDay(); // 일요일(0) ~ 토요일(6)
											}

											function renderCalendar(year, month) {
												// 헤더에 연도와 월 표시
												monthYearText.textContent = year
														+ "년 " + month + "월";

												// 해당 월의 첫째 날부터 시작
												const firstDayOfMonth = getFirstDayOfWeek(
														year, month);
												const daysInMonth = new Date(
														year, month, 0)
														.getDate();

												// 기존 달력 내용 비우기
												calendarDays.innerHTML = '';

												// 요일 표시
												const daysOfWeek = [ '일', '월',
														'화', '수', '목', '금', '토' ];
												for (let i = 0; i < daysOfWeek.length; i++) {
													const dayOfWeekElement = document
															.createElement('div');
													dayOfWeekElement.classList
															.add('calendar-day');
													dayOfWeekElement.textContent = daysOfWeek[i];
													calendarDays
															.appendChild(dayOfWeekElement);
												}

												// 날짜 표시
												for (let i = 1; i <= daysInMonth
														+ firstDayOfMonth; i++) {
													const dayElement = document
															.createElement('div');
													dayElement.classList
															.add('calendar-day');

													// 오늘 날짜인 경우 노란색으로 강조
													const today = new Date();
													if (i > firstDayOfMonth
															&& i <= daysInMonth
																	+ firstDayOfMonth) {
														const dayNumber = i
																- firstDayOfMonth;
														dayElement.textContent = dayNumber;

														if (year === today
																.getFullYear()
																&& month === today
																		.getMonth() + 1
																&& dayNumber === today
																		.getDate()) {
															dayElement.classList
																	.add('today');
														}
													} else {
														dayElement.classList
																.add('empty');
													}

													calendarDays
															.appendChild(dayElement);
												}
											}

											// 현재 날짜를 가져옴
											const currentDate = new Date();
											let currentYear = currentDate
													.getFullYear();
											let currentMonth = currentDate
													.getMonth() + 1;

											// 초기 달력 표시
											renderCalendar(currentYear,
													currentMonth);

											// 이전 달 버튼 클릭 시
											document
													.getElementById(
															'prevMonthBtn')
													.addEventListener(
															'click',
															function() {
																if (currentMonth === 1) {
																	currentYear--;
																	currentMonth = 12;
																} else {
																	currentMonth--;
																}
																renderCalendar(
																		currentYear,
																		currentMonth);
															});

											// 다음 달 버튼 클릭 시
											document
													.getElementById(
															'nextMonthBtn')
													.addEventListener(
															'click',
															function() {
																if (currentMonth === 12) {
																	currentYear++;
																	currentMonth = 1;
																} else {
																	currentMonth++;
																}
																renderCalendar(
																		currentYear,
																		currentMonth);
															});
										});
					</script>
				</td>

				<td style="padding-left: 3px; padding-right: 3px;">
					<div class="notices">
						<div class="notices_1">
							<b>공지사항</b>
						</div>
						<div class="notices_list">

							<table>
								<tr>
									<th>No.</th>
									<th>제목</th>
									<th>작성자</th>
									<th>작성일</th>
									<th>조회수</th>
								</tr>
								<c:forEach items="${bList}" var="boardItem">
									<tr>
										<td>${boardItem.num}</td>
										<td><a href="/board/content/${boardItem.num}">${boardItem.title}</a></td>
										<td>${boardItem.userid}</td>
										<td><fmt:formatDate value="${boardItem.regdate}"
												dateStyle="short" /></td>
										<td>${boardItem.readcount}</td>
									</tr>
								</c:forEach>
							</table>
						</div>

					</div>
				</td>

				<td>
					<div class="library">
						<div class="library_1">
							<b>자료실</b>
						</div>
						<div>
							<div class="notices_list">
								<table>
									<tr>
										<th>번호</th>
										<th>제목</th>
										<th>작성자</th>
										<th>작성일</th>

									</tr>
									<c:forEach items="${fList}" var="f">
										<tr>
											<td>${num}<c:set var="num" value="${num + 1 }" />
											</td>
											<td><a href="/file/content/${f.fileid}">${f.title}</a></td>
											<td>${f.userid }</td>
											<td><fmt:formatDate value="${f.regdate}"
													dateStyle="short" /></td>
										</tr>
									</c:forEach>
								</table>
							</div>

						</div>
					</div>
				</td>
			</tr>
		</table>
	</main>
</body>
</html>