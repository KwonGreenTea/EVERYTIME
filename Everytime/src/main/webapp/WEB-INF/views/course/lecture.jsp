<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<style></style>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" href="https://everytime.kr/css/common.css" />
<link rel="stylesheet"
	href="https://everytime.kr/css/common.partial.css" />
<link rel="stylesheet"
	href="https://everytime.kr/css/container.article.css" />
<link rel="stylesheet"
	href="https://everytime.kr/css/container.community.css" />
<link rel="stylesheet"
	href="https://everytime.kr/css/container.modal.css" />

<script src="https://code.jquery.com/jquery-3.7.1.js"></script>

<link rel="stylesheet" type="text/css" href="resources/css/course6c.css">
<link rel="stylesheet" type="text/css" href="resources/css/course8d.css">
<link rel="stylesheet" type="text/css" href="resources/css/course4c.css">
</head>

<body>
	<%@ include file="../header.jspf"%>

	<div class="container" data-v-f688a188="">


		<div data-v-f688a188="" class="side">
			<div data-v-f688a188="" class="searchbox">
				<form data-v-f688a188="" class="searchbar" action="search"
					method="POST">
					<input value="courseName" name="type" type=hidden> <input
						data-v-f688a188="" type="search" name=keyword
						placeholder="과목명, 교수명으로 검색"> <input data-v-f688a188=""
						type="submit" class="submit">
				</form>
			</div>
			<!---->
			<section data-v-f688a188="" class="point">
				<div data-v-f688a188="" href="/lecture/point">
					<span data-v-f688a188="" class="title">내 포인트 현황</span>
					<div data-v-f688a188="" class="flexbox">
						<span data-v-f688a188="" class="point">41 포인트</span> <span
							data-v-f688a188="" class="arrow"></span>
					</div>
				</div>
			</section>
			<!---->
			<!---->
		</div>
		<div class="articles" data-v-f688a188="">
			<c:forEach var="reviewVO" items="${reviewList}">
				<a href="view?courseId=${reviewVO.courseId}" class="article-link">
					<div class="article" data-v-f688a188="">
						<div class="articlename" data-v-f688a188="">${reviewVO.courseName}</div>
						<div class="professor" data-v-f688a188="">${reviewVO.professor}</div>
						<div class="rate" data-v-f688a188="">
							<span class="star" data-v-f688a188=""> <span class="on"
								style="width :${20 * reviewVO.courseRate}%;" data-v-f688a188=""></span>
							</span>
						</div>
						<div class="info" data-v-f688a188="">
							<span class="semester" data-v-f688a188="">${reviewVO.semester}
								수강자</span>
						</div>
						<div class="text" data-v-f688a188="">${reviewVO.reviewContent}</div>
					</div>

				</a>
			</c:forEach>
		</div>
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
