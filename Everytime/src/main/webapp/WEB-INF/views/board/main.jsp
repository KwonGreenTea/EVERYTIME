<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에브리타임</title>

<link rel="stylesheet" href="https://everytime.kr/css/common.css" />
<link rel="stylesheet"
	href="https://everytime.kr/css/common.partial.css" />
<link rel="stylesheet"
	href="https://everytime.kr/css/container.article.css" />
<link rel="stylesheet"
	href="https://everytime.kr/css/container.community.css" />
<link rel="stylesheet"
	href="https://everytime.kr/css/container.modal.css" />
<link rel="stylesheet" href="resources/css/mainCommon.css" />
<link rel="stylesheet" href="resources/css/mainCommon.partial.css" />
<link rel="stylesheet" href="resources/css/container.community.css" />
<script type="text/javascript" src="resources/js/friend.js"></script>
</head>
<body>

	<!--주석 썻따고 ^^ -->
	<%@ include file="../header.jspf"%>
	<div id="submenu">
		<div class="wrap">
			<div class="divider"></div>
			<div class="group">
				<ul>
					<li><a href="post/post_list?boardId=1" class="new">자유게시판</a></li>
					<li><a href="post/post_list?boardId=2" class="new">비밀게시판</a></li>
					<li><a href="post/post_list?boardId=3" class="new">졸업생게시판</a></li>
					<li><a href="post/post_list?boardId=4" class="new">새내기게시판</a></li>
				</ul>
			</div>
			<div class="group">
				<ul>
				</ul>
			</div>
			<div class="divider"></div>
			<div class="group">
				<ul>
				</ul>
			</div>
			<div class="divider"></div>
			<div class="group">
				<ul>
				</ul>
			</div>
			<div class="divider"></div>
			<div class="group">
				<ul>
				</ul>
			</div>
			<div class="group">
				<ul>
					<li><a href="/community/search" class="search">게시판 찾기</a></li>
				</ul>
			</div>
			<div class="divider"></div>
			<hr>
		</div>
		<input type="hidden" id="communityCampusId" value="23">
	</div>

	<div id="container" class="community">
		<aside class="none">
			<form class="search">
				<input type="search" name="keyword" class="text"
					placeholder="전체 게시판의 글을 검색하세요!">

			</form>
			<div class="title">
				<a class="hamburger"></a>
				<ol class="buttons">
					<li><a id="searchArticle">글 검색</a></li>
				</ol>
			</div>
		</aside>
		<div class="leftside">
			<div class="card pconly">
				<form class="logged">
					<img src="${imgSource}" class="picture">
					<p class="nickname">${registerVO.nickname }</p>
					<p class="school">${registerVO.name }</p>
					<p class="school">${registerVO.email }</p>
					<ul class="buttons">
						<li><a href="mypage">내 정보</a></li>
						<li><a href="logout">로그아웃</a></li>
					</ul>
					<hr>
				</form>
			</div>
			<div class="card">
				<div class="menus">
					<a href="post/myPost" class="myarticle">내가 쓴 글</a> 
					<a href="/mycommentarticle" class="mycommentarticle">댓글 단 글</a> 
					<a href="myscrap" class="myscrap">내 스크랩</a>
					<hr>
				</div>
			</div>
		</div>
		<div class="rightside">
			<form action="post/search/all" method="POST" class="search">
				<input type="text" name="keyword" placeholder="전체 게시판의 글을 검색하세요!"
					class="text">
			</form>
			<div class="card">
				<div class="board">
					<h3>
						<a href="post/hotpost">HOT 게시물<span>더 보기</span></a>
					</h3>
					<c:forEach var="postVO" items="${hotPostList }" begin="0" end="3">
						<a class="list"
							href="/web/post/detail?boardId=${postVO.boardId }&postId=${postVO.postId}">
							<time><fmt:formatDate value="${postVO.postCreatedDate}"
									pattern="MM/dd HH:mm" /></time>
							<p>${postVO.postTitle }</p>
							<hr>
						</a>
					</c:forEach>

				</div>
			</div>
			<div class="card">
				<div class="board">
					<h3>
						<a href="lecture">최근 강의평<span>더 보기</span></a>
					</h3>

					<c:forEach var="reviewVO" items="${reviewList }" begin="0" end="2">
						<a class="article" href="view?courseId=${reviewVO.courseId}">
							<span class="star"> <span class="on"
								style="width :${20 * reviewVO.courseRate}%;"> </span>
						</span>
							<p class="title">${reviewVO.courseName }:
								${reviewVO.professor }</p>
							<p class="small">${reviewVO.reviewContent }</p>
							<hr>
						</a>
					</c:forEach>


				</div>
			</div>
		</div>
		<div class="banners">
			<a href="https://www.youtube.com/shorts/mZPkoLfdGQg"> <img
				src="/web/resources/images/university.png"></a>
		</div>
		<div class="main">
			<div class="card">
				<div class="board">
					<h3>
						<a href="post/post_list?boardId=1">자유게시판</a>
					</h3>
					<c:forEach var="postVO" items="${postListNum1 }" begin="0" end="3">
						<a class="list"
							href="/web/post/detail?boardId=${postVO.boardId }&postId=${postVO.postId}">
							<time id="createdTime">
								<fmt:formatDate value="${postVO.postCreatedDate}"
									pattern="MM/dd HH:mm" />
							</time>
							<p>${postVO.postTitle }</p>
							<hr>
						</a>
					</c:forEach>
				</div>
			</div>

			<div class="card">
				<div class="board">
					<h3>
						<a href="post/post_list?boardId=2">비밀게시판</a>
					</h3>
					<c:forEach var="postVO" items="${postListNum2 }" begin="0" end="3">
						<a class="list"
							href="/web/post/detail?boardId=${postVO.boardId }&postId=${postVO.postId}"><time
								id="createdTime">
								<fmt:formatDate value="${postVO.postCreatedDate}"
									pattern="MM/dd HH:mm" />
							</time>
							<p>${postVO.postTitle }</p>
							<hr></a>
					</c:forEach>
				</div>
			</div>
			<div class="card">
				<div class="board">
					<h3>
						<a href="post/post_list?boardId=3">졸업생게시판</a>
					</h3>
					<c:forEach var="postVO" items="${postListNum3 }" begin="0" end="3">
						<a class="list"
							href="/web/post/detail?boardId=${postVO.boardId }&postId=${postVO.postId}"><time
								id="createdTime">
								<fmt:formatDate value="${postVO.postCreatedDate}"
									pattern="MM/dd HH:mm" />
							</time>
							<p>${postVO.postTitle }</p>
							<hr></a>
					</c:forEach>
				</div>
			</div>
			<div class="card">
				<div class="board">
					<h3>
						<a href="post/post_list?boardId=4">새내기게시판</a>
					</h3>
					<c:forEach var="postVO" items="${postListNum4 }" begin="0" end="3">
						<a class="list"
							href="/web/post/detail?boardId=${postVO.boardId }&postId=${postVO.postId}">
							<time id="createdTime">
								<fmt:formatDate value="${postVO.postCreatedDate}"
									pattern="MM/dd HH:mm" />
							</time>
							<p>${postVO.postTitle }</p>
							<hr>
						</a>
					</c:forEach>
				</div>
			</div>



		</div>
	</div>


</body>
</html>