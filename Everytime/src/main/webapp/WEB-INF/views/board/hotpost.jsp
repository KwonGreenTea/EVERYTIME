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
					<li><a href="../post/post_list?boardId=1" class="new">자유게시판</a></li>
					<li><a href="../post/post_list?boardId=2" class="new">비밀게시판</a></li>
					<li><a href="../post/post_list?boardId=3" class="new">졸업생게시판</a></li>
					<li><a href="../post/post_list?boardId=4" class="new">새내기게시판</a></li>
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
		<aside class="none"></aside>


		<div class="rightside">

			<div class="card">
				<div class="board">
					<h3>
						<a href="../post/hotpost">HOT 게시물<span>더 보기</span></a>
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
						<a href="../lecture">최근 강의평<span>더 보기</span></a>
					</h3>

					<c:forEach var="reviewVO" items="${reviewList }" begin="0" end="2">
						<a class="article" href="../view?courseId=${reviewVO.courseId}">
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

		<div class="wrap title">
			<h1>
				<a href="../post/hotpost">HOT 게시판</a>
			</h1>
			<hr>
			<p>공감 5개를 받으면 HOT 게시물로 자동 선정됩니다.</p>
		</div>
		<div class="wrap notification none"></div>
		<div class="wrap bubbles none"></div>

		<!-- 게시물 등록 -->
		<div class="wrap articles">
			<c:if test="${empty hotPostList}">
				<article class="dialog">검색 결과가 없습니다.</article>
			</c:if>
			<c:forEach var="postVO" items="${hotPostList}">
				<article class="list">
					<a class="article"
						href="/web/post/detail?boardId=${postVO.boardId }&postId=${postVO.postId}">
						<div class="desc">
							<div class="boardname">자유게시판</div>
							<h2 class="medium bold">${postVO.postTitle}</h2>
							<p class="medium">${postVO.postContent}</p>
							<div class="info">
								<ul class="status">
									<li title="공감" class="vote" id="${postVO.postLikeCount }">
										${postVO.postLikeCount }</li>
									<li title="댓글" class="comment">1</li>
									<!-- 댓글 개수 -->
								</ul>
								<time class="small">
									<fmt:formatDate value="${postVO.postCreatedDate}"
										pattern="MM/dd" />
									<!-- 작성 날짜 -->
								</time>
								<c:choose>
									<c:when test="${postVO.postAnonymous == 0}">
										<h3 class="small">${nickname }</h3>
									</c:when>
									<c:when test="${postVO.postAnonymous == 1}">
										<h3 class="small">익명</h3>
									</c:when>
								</c:choose>
							</div>
							<hr>
						</div> <input type="hidden" name="348759222_comment_anonym" value="0">
					</a>
					<div class="comments"></div>
				</article>



			</c:forEach>


			<div class="clearBothOnly"></div>
			<c:if test="${not empty searchList}">
				<div class="pagination">
					<a href="/search/all/미분/p/2" class="next">다음</a>
				</div>
			</c:if>

		</div>

	</div>
	
	<script type="text/javascript">
         $(document).ready(function() {
            
            $('.vote').each(function() {
                // 각 요소의 텍스트 내용을 숫자로 변환
                var likeCount = parseInt($(this).text().trim());
                
                // 조건에 따라 요소를 표시하거나 숨기기
                if (likeCount > 0) {
                  $(this).show(); // 요소를 표시
                } else {
                  $(this).hide(); // 요소를 숨김
                }
              }); 
            
            
         }); // end document
      </script>

</body>
</html>