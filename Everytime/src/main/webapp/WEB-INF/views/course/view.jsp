<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강의별 개요,강의평,시험정보</title>
</head>
<body>

	<h2>평가하기 </h2>
	<button onclick="location.href='write?courseId=${courseVO.courseId}'">평가하러가기</button>
	<h2>개요</h2>
	<div>
		<p>과목명 : ${courseVO.courseName }
	</div>

	<div>
		<p>교수명 : ${courseVO.professor }
	</div>

	<div></div>

	<c:forEach var="reviewVO" items="${reviewList }">
		<div>
			<p>과제 : ${reviewVO.courseRate }
		</div>

		<div>
			<p>조모임 : ${reviewVO.team}
		</div>
		<div>
			<p>성적 : :${reviewVO.grade}
		</div>
		
	</c:forEach>


	



</body>
</html>