<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="https://everytime.kr/css/common.css" />
<link rel="stylesheet"
	href="https://everytime.kr/css/common.partial.css" />
<link rel="stylesheet"
	href="https://everytime.kr/css/container.article.css" />
<link rel="stylesheet"
	href="https://everytime.kr/css/container.community.css" />
<link rel="stylesheet"
	href="https://everytime.kr/css/container.modal.css" />

<link rel="stylesheet" type="text/css" href="resources/css/view4a.css">
<link rel="stylesheet" type="text/css" href="resources/css/view8d.css">
<link rel="stylesheet" type="text/css" href="resources/css/searchba.css">

</head>
<body>

	<%@ include file="../header.jspf"%>


	<div data-v-4713bb84>
		<div data-v-4713bb84 class="container">
			<div data-v-4713bb84="" class="header">


				<form data-v-4713bb84="" class="searchbar"
					data-gtm-form-interact-id="0" action="search" method="POST">
					<input data-v-4713bb84="" type="search"
						data-gtm-form-interact-field-id="0" name="keyword"> <input
						value="courseName" name="type" type=hidden> <input
						data-v-4713bb84="" type="submit" class="submit">
				</form>

				<div data-v-4713bb84="" class="filters">
					<div data-v-4713bb84="" class="categories">
						<label data-v-4713bb84=""><input data-v-4713bb84=""
							value="name" type="radio"> <span data-v-4713bb84=""
							class="icon"></span> <span data-v-4713bb84="" class="title">과목명</span></label>
						<label data-v-4713bb84=""><input data-v-4713bb84=""
							value="professor" type="radio"> <span data-v-4713bb84=""
							class="icon"></span> <span data-v-4713bb84="" class="title">교수명</span></label>
					</div>
					<button data-v-4713bb84="" class="campus">ERICA캠</button>
				</div>
			</div>


			<div data-v-4713bb84 class="lectures">
				<c:forEach var="courseVO" items="${courseList}">
					<div data-v-4713bb84="" href="" class="lecture">
						<div data-v-4713bb84="" class="name">
							<span class="highlight">${courseVO.courseName}</span>
						</div>
						<div data-v-4713bb84="" class="professor">${courseVO.professor}</div>
						<div data-v-4713bb84="" class="rate">
							<span data-v-4713bb84="" class="star"><span
								data-v-4713bb84="" class="on" style="width: 100%;"></span></span>
						</div>
					</div>
				</c:forEach>


			</div>

		</div>

	</div>

</body>
</html>