<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에브리타임</title>
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<script src="https://html2canvas.hertzen.com/dist/html2canvas.min.js"></script>
<link rel="stylesheet" href="https://everytime.kr/css/common.css" />
<link rel="stylesheet"
	href="https://everytime.kr/css/common.partial.css" />
<link rel="stylesheet"
	href="https://everytime.kr/css/container.article.css" />
<link rel="stylesheet"
	href="https://everytime.kr/css/container.community.css" />
<link rel="stylesheet"
	href="https://everytime.kr/css/container.modal.css" />
<link rel="stylesheet" href="resources/css/timetable.css" />
<script type="text/javascript" src="resources/js/timetable.js"></script>
</head>
<body>
	<%@ include file="../header.jspf"%>

	<div id="container" class="timetable" style="height: 871px;">
		<div class="wrap" style="width: 90%;">
			<div class="tablehead">
				<table class="tablehead" style="margin-top: 20px;">
					<tbody>
						<tr class="day">
							<th></th>
							<td>월</td>
							<td>화</td>
							<td>수</td>
							<td>목</td>
							<td>금</td>
							<th></th>
						</tr>
					</tbody>
				</table>
			</div>

			<div class="tablebody">
				<table class="tablebody" style="margin-top: -420px;">
					<tbody>
						<tr>
							<th>
								<div class="hours">
									<div class="hour"
										style="height: 30px; top: 450px; line-height: 30px;">0교시</div>
									<div class="hour"
										style="height: 30px; top: 480px; line-height: 30px;">1교시</div>
									<div class="hour"
										style="height: 30px; top: 510px; line-height: 30px;">2교시</div>
									<div class="hour"
										style="height: 30px; top: 540px; line-height: 30px;">3교시</div>
									<div class="hour"
										style="height: 30px; top: 570px; line-height: 30px;">4교시</div>
									<div class="hour"
										style="height: 30px; top: 600px; line-height: 30px;">5교시</div>
									<div class="hour"
										style="height: 30px; top: 630px; line-height: 30px;">6교시</div>
									<div class="hour"
										style="height: 30px; top: 660px; line-height: 30px;">7교시</div>
									<div class="hour"
										style="height: 30px; top: 690px; line-height: 30px;">8교시</div>
									<div class="hour"
										style="height: 30px; top: 720px; line-height: 30px;">9교시</div>
									<div class="hour"
										style="height: 30px; top: 750px; line-height: 30px;">10교시</div>
									<div class="hour"
										style="height: 30px; top: 780px; line-height: 30px;">11교시</div>
									<div class="hour"
										style="height: 30px; top: 810px; line-height: 30px;">12교시</div>
									<div class="hour"
										style="height: 30px; top: 840px; line-height: 30px;">13교시</div>
									<div class="hour"
										style="height: 30px; top: 870px; line-height: 30px;">14교시</div>
									<div class="hour"
										style="height: 30px; top: 900px; line-height: 30px;">15교시</div>
									<div class="hour"
										style="height: 30px; top: 930px; line-height: 30px;">16교시</div>
									<div class="hour"
										style="height: 30px; top: 960px; line-height: 30px;">17교시</div>
									<div class="hour"
										style="height: 30px; top: 990px; line-height: 30px;">18교시</div>
									<div class="hour"
										style="height: 30px; top: 1020px; line-height: 30px;">19교시</div>
									<div class="hour"
										style="height: 30px; top: 1050px; line-height: 30px;">20교시</div>
									<div class="hour"
										style="height: 30px; top: 1080px; line-height: 30px;">21교시</div>
									<div class="hour"
										style="height: 30px; top: 1110px; line-height: 30px;">22교시</div>
									<div class="hour"
										style="height: 30px; top: 1140px; line-height: 30px;">23교시</div>
									<div class="hour"
										style="height: 30px; top: 1170px; line-height: 30px;">24교시</div>
									<div class="hour"
										style="height: 30px; top: 1200px; line-height: 30px;">25교시</div>
									<div class="hour"
										style="height: 30px; top: 1230px; line-height: 30px;">26교시</div>
									<div class="hour"
										style="height: 30px; top: 1260px; line-height: 30px;">27교시</div>
									<div class="hour"
										style="height: 30px; top: 1290px; line-height: 30px;">28교시</div>
									<div class="hour"
										style="height: 30px; top: 1320px; line-height: 30px;">29교시</div>
									<div class="hour"
										style="height: 30px; top: 1350px; line-height: 30px;">30교시</div>
									<div class="hour"
										style="height: 30px; top: 1380px; line-height: 30px;">31교시</div>
									<div class="hour"
										style="height: 30px; top: 1410px; line-height: 30px;">32교시</div>
								</div>
							</th>
							<td>
								<div class="cols" style="width: 7px;"></div>
								<div class="grids">
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
								</div>
							</td>
							<td>
								<div class="cols" style="width: 7px;"></div>
								<div class="grids">
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
								</div>
							</td>
							<td>
								<div class="cols" style="width: 7px;"></div>
								<div class="grids">
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
								</div>
							</td>
							<td>
								<div class="cols" style="width: 7px;"></div>
								<div class="grids">
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
								</div>
							</td>
							<td>
								<div class="cols" style="width: 7px;"></div>
								<div class="grids">
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
								</div>
							</td>
							<th>
								<div class="times">
									<div class="time">오전 0시</div>
									<div class="time">오전 1시</div>
									<div class="time">오전 2시</div>
									<div class="time">오전 3시</div>
									<div class="time">오전 4시</div>
									<div class="time">오전 5시</div>
									<div class="time">오전 6시</div>
									<div class="time">오전 7시</div>
									<div class="time">오전 8시</div>
									<div class="time">오전 9시</div>
									<div class="time">오전 10시</div>
									<div class="time">오전 11시</div>
									<div class="time">오후 12시</div>
									<div class="time">오후 1시</div>
									<div class="time">오후 2시</div>
									<div class="time">오후 3시</div>
									<div class="time">오후 4시</div>
									<div class="time">오후 5시</div>
									<div class="time">오후 6시</div>
									<div class="time">오후 7시</div>
									<div class="time">오후 8시</div>
									<div class="time">오후 9시</div>
									<div class="time">오후 10시</div>
									<div class="time">오후 11시</div>
								</div>
							</th>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>

	<div id="scheduleData" style="display: none;">
		<c:set var="jsonArray" value="" />

		<c:if test="${not empty scheduleList}">
			<c:forEach var="scheduleVO" items="${scheduleList}" varStatus="loop">
				<c:set var="jsonObject"
					value='{
                "memberId": "${scheduleVO.memberId}",
                "courseName": "${scheduleVO.courseName}",
                "professor": "${scheduleVO.professor}",
                "weeks": "${scheduleVO.weeks}",
                "startHour": ${scheduleVO.startHour},
                "startMinute": ${scheduleVO.startMinute},
                "endHour": ${scheduleVO.endHour},
                "endMinute": ${scheduleVO.endMinute},
                "courseRoom": "${scheduleVO.courseRoom}"
            }' />

				<c:choose>
					<c:when test="${loop.first}">
						<c:set var="jsonArray" value="${jsonArray}${jsonObject}" />
					</c:when>
					<c:otherwise>
						<c:set var="jsonArray" value="${jsonArray},${jsonObject}" />
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</c:if>

		<c:set var="jsonArray" value="[${jsonArray}]" />
		<c:out value="${jsonArray}" />
	</div>

	<ul class="floating" style="left: 1.5px;">
		<li class="button course" id="addCourse">새 수업 추가</li>
		<li class="button download" id="downloadTimetable">시간표 다운로드</li>
	</ul>

	<div id="myModal" class="modal">
		<div class="modal-content">
			<span class="close" id="exitBtn">&times;</span>
			<form action="timetable" method="post" id="addCourseForm"
				style="display: none; left: 292px;">
				<h2>새 수업 추가</h2>
				<dl>
					<dt>과목명 (필수)</dt>
					<dd>
						<input type="text" name="courseName" placeholder="예) 경제학 입문"
							maxlength="40" class="text" required>
					</dd>
					<dt>교수명</dt>
					<dd>
						<input type="text" name="professor" placeholder="예)홍길동"
							maxlength="40" class="text">
					</dd>
					<dt>시간/장소</dt>
					<dd class="timeplaces">
						<div class="timeplace">
							<select class=weeks name="weeks">
								<option value="월">월</option>
								<option value="화">화</option>
								<option value="수">수</option>
								<option value="목">목</option>
								<option value="금">금</option>
							</select>
							<p>
								<select class=startHour name="startHour">
									<option value="8">오전 8시</option>
									<option value="9" selected="selected">오전 9시</option>
									<option value="10">오전 10시</option>
									<option value="11">오전 11시</option>
									<option value="12">오전 12시</option>
									<option value="13">오후 1시</option>
									<option value="14">오후 2시</option>
									<option value="15">오후 3시</option>
									<option value="16">오후 4시</option>
									<option value="17">오후 5시</option>
									<option value="18">오후 6시</option>
									<option value="19">오후 7시</option>
									<option value="20">오후 8시</option>
									<option value="21">오후 9시</option>
									<option value="22">오후 10시</option>
									<option value="23">오후 11시</option>
								</select> <select class="startMinute" name="startMinute">
									<option value="0">0분</option>
									<option value="5">5분</option>
									<option value="10">10분</option>
									<option value="15">15분</option>
									<option value="20">20분</option>
									<option value="25">25분</option>
									<option value="30">30분</option>
									<option value="35">35분</option>
									<option value="40">40분</option>
									<option value="45">45분</option>
									<option value="50">50분</option>
									<option value="55">55분</option>
								</select> <span>~</span> <select class="endHour" name="endHour">
									<option value="8">오전 8시</option>
									<option value="9">오전 9시</option>
									<option value="10" selected="selected">오전 10시</option>
									<option value="11">오전 11시</option>
									<option value="12">오전 12시</option>
									<option value="13">오후 1시</option>
									<option value="14">오후 2시</option>
									<option value="15">오후 3시</option>
									<option value="16">오후 4시</option>
									<option value="17">오후 5시</option>
									<option value="18">오후 6시</option>
									<option value="19">오후 7시</option>
									<option value="20">오후 8시</option>
									<option value="21">오후 9시</option>
									<option value="22">오후 10시</option>
									<option value="23">오후 11시</option>
								</select> <select class="endMinute" name="endMinute">
									<option value="0">0분</option>
									<option value="5">5분</option>
									<option value="10">10분</option>
									<option value="15">15분</option>
									<option value="20">20분</option>
									<option value="25">25분</option>
									<option value="30">30분</option>
									<option value="35">35분</option>
									<option value="40">40분</option>
									<option value="45">45분</option>
									<option value="50">50분</option>
									<option value="55">55분</option>
								</select> <input type="text" name="courseRoom" placeholder="예) 종 303"
									class="text place">
							</p>
						</div>
					</dd>
				</dl>

				<div class="submit">
					<input type="submit" value="저장" class="button">
				</div>
			</form>
		</div>
	</div>

	<script>
		document.getElementById("downloadTimetable").addEventListener("click", function() {
	        html2canvas(document.querySelector("#container")).then(canvas => {
	            let link = document.createElement('a');
	            link.download = 'timetable.png';
	            link.href = canvas.toDataURL();
	            link.click();
	        });
	    });
	</script>
</body>
</html>