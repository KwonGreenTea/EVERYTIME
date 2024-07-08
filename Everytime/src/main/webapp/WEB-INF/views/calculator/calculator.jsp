<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>에브리타임</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://everytime.kr/css/common.css" />
<link rel="stylesheet"
	href="https://everytime.kr/css/common.partial.css" />
<link rel="stylesheet"
	href="https://everytime.kr/css/container.article.css" />
<link rel="stylesheet"
	href="https://everytime.kr/css/container.community.css" />
<link rel="stylesheet"
	href="https://everytime.kr/css/container.modal.css" />
<link rel="stylesheet" 
	href="resources/css/calculator_.css" />
<script type="text/javascript" src="resources/js/calculator.js"></script>
</head>
<body>
	<%@ include file="../header.jspf" %>

	<div class="container">

		<div class="section">
			<div class="chart">
				<article class="overview">
					<div class="column gpa">
						<h4>전체 평점</h4>
						<p class="value" id="gpa-value"></p>
						<p class="total">/ 4.5</p>
					</div>
					<div class="column acquisition">
						<h4>취득 학점</h4>
						<p class="value" id="total-credits"></p>
					</div>
				</article>
				<article class="semester">
					<ul class="ratioplot">
					</ul>
				</article>
			</div>
		</div>

		<br> <br>
		<h4>
			데이터가 없을 시<br>시간표에 있는 과목을 불러옵니다.
		</h4>
		<table class="subjects">
			<thead>
				<tr>
					<th>과목명</th>
					<th>학점</th>
					<th>성적</th>
				</tr>
			</thead>
			<tbody>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="3"><a onclick="addRow()" style="color: red;">더
							입력하기</a>&nbsp;<a onclick="clearTable()">초기화</a></td>
				</tr>
			</tfoot>
		</table>
	</div>

	<div id="calculatorData" style="display: none;">
		<c:set var="jsonArray" value="" />

		<c:if test="${not empty calculatorList}">
			<c:forEach var="scheduleVO" items="${calculatorList}"
				varStatus="loop">
				<c:set var="calNoString">
					<fmt:formatNumber value="${scheduleVO.calNo}" type="number" />
				</c:set>
				<c:set var="creditString">
					<fmt:formatNumber value="${scheduleVO.credit}" type="number" />
				</c:set>
				<c:set var="jsonObject"
					value='{"calNo": "${calNoString}", 
					"courseName": "${scheduleVO.courseName}",
					"credit": "${scheduleVO.credit}",
					"grade": "${scheduleVO.grade}"}' />

				<c:choose>
					<c:when test="${loop.first}">
						<c:set var="jsonArray" value="${jsonObject}" />
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
</body>
</html>
