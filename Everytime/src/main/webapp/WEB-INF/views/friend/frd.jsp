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
	href="resources/css/friend.css" />
	<script type="text/javascript" src="resources/js/friend.js"></script>
</head>
<body>
	<%@ include file="../header.jspf"%>

	<div class="container">
		<form action="frd/friend" method="post">
			<input type="text" id="responseId" name="responseId"
				placeholder="아이디를 통해서 검색해주세요.">
		</form>

		<form id="memberForm" action="frdTime" method="post">
			<input type="hidden" id="requestId" name="requestId"> <input
				type="hidden" id="requestName" name="requestName">
		</form>

		<ul>
			<c:forEach var="friendVO" items="${requestList}">
				<li>${friendVO.responseName}님이 친구요청을 보냈습니다
					<form action="frd/accept" method="post">
						<input type="hidden" id="responseId" name="responseId"
							value="${friendVO.responseId}"> <input type="submit"
							value="수락">
					</form>
					<form action="frd/delete" method="post">
						<input type="hidden" id="responseId" name="responseId"
							value="${friendVO.responseId}"> <input type="submit"
							style="display: none;">
					</form>
				</li>
			</c:forEach>
		</ul>

		<ul>
			<c:forEach var="friendVO" items="${friendlist}">
				<c:if test="${not empty friendVO.requestId}">
					<li class="nameListItem">${friendVO.requestName}<input
						type="hidden" class="frdId" value="${friendVO.requestId}">
						<input type="hidden" class="frdName"
						value="${friendVO.requestName}">
					</li>
				</c:if>
			</c:forEach>
		</ul>
	</div>
	
	<script type="text/javascript">
	window.onload = function() {
		var error = '<c:out value="${errorMessage}" default=""/>';
		if (error) {
			alert(error);
		}
	}
	</script>
</body>
</html>