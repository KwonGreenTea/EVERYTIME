<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에브리타임</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<link rel="stylesheet" href="https://everytime.kr/css/common.css" />
<link rel="stylesheet"
	href="https://everytime.kr/css/common.partial.css" />
<link rel="stylesheet"
	href="https://everytime.kr/css/container.article.css" />
<link rel="stylesheet"
	href="https://everytime.kr/css/container.community.css" />
<link rel="stylesheet"
	href="https://everytime.kr/css/container.modal.css" />
</head>

<body>
<nav>
		<div class="wrap">
			<div id="logo">
				<a href="main"><img src="resources/images/soldesk.png"></a>
				<p>
					<span class="name multiple">에브리타임</span><span class="subname">솔데스크대
						강남캠</span>
				</p>
			</div>
			<div id="account">
				<a href="chat" title="쪽지함" class="icon message">쪽지함</a> <a
					href="mypage" title="내 정보" class="icon my">내 정보</a>
				<!--  <input
					type="hidden" id="userUserid" value="iparknoori"> <input
					type="hidden" id="userSchool" value="4"> <input
					type="hidden" id="userCampus" value="23">-->
			</div>
			<ul id="menu">
				<li><a href="main">게시판</a></li>
				<li><a href="time">시간표</a></li>
				<li class="active"><a href="course">강의실</a></li>
				<li><a href="calculator">학점계산기</a></li>
				<li><a href="frd">친구</a></li>
			</ul>
		</div>
	</nav>

	<div id="container" class="article">
		<h1>강의평 목록</h1>
	
	<br><br><br><br><br><br><br><br>

		<form action="search" method="POST">
			<select name="type" class="type-box">
				<option value="">검색 유형 선택</option>
				<option value="courseName">과목명</option>
				<option value="professor">교수명</option>
			</select> <input type="text" name="keyword" placeholder="검색어 입력"> <input
				type="submit" value="검색">
		</form>
	</div>
</body>
</html>
