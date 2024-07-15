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
<style>
#thumbnails {
	display: none;
	list-style: none;
	padding: 0;
}

#thumbnails .thumbnail {
	display: inline-block;
	margin: 5px;
}

#thumbnails .thumbnail img {
	width: 85px;
	height: 85px;
}
</style>
<body>
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



	<div id="container" class="article">
		<input type="hidden" id="isUser" value="1"> <input
			type="hidden" id="boardId" value="370449">
		<aside class="none">
			<div class="title">
				<a class="hamburger"></a>
				<h1>
					<a href="/370449">자유게시판</a>
				</h1>
			</div>
		</aside>
		<div class="wrap title">
			<h1>
				<a href="/370449">내 스크랩</a>
			</h1>
			<hr>
		</div>
		<div class="wrap notification none"></div>

		<!-- 게시물 목록 -->
		<div class="wrap articles">
			<c:forEach var="postVO" items="${postList}">
				<article class="list">
					<a class="article"
						href="/web/post/detail?boardId=${postVO.boardId }&postId=${postVO.postId}">
						<div class="desc">
							<h2 class="medium bold">${postVO.postTitle}</h2>
							<p class="medium">${postVO.postContent}</p>
							<div class="info">
								<ul class="status">
									<li title="댓글" class="comment">1</li>
									<!-- 댓글 개수 -->
								</ul>
								<time class="small">
									<fmt:formatDate value="${postVO.postCreatedDate}"
										pattern="MM/dd" />
									<!-- 작성 날짜 -->
								</time>
								<h3 class="small">익명</h3>
							</div>
							<hr>
						</div> <c:forEach var="img" items="${postImgList}">
							<c:if test="${post.postId == img.postId}">
								<div class="attachthumbnail">
									<img
										src="<c:url value='/image/${img.postPath}/${img.postChgName}'/>"
										alt="${img.postRealName}" />
								</div>
							</c:if>
						</c:forEach>
					</a>
					<div class="comments"></div>
				</article>
			</c:forEach>
		</div>
	</div>
</body>
</html>