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

	<script type="text/javascript">
		$(document).ready(function() {
			// 버튼 클릭 시 폼 보이기/숨기기
			$("#writeArticleButton").click(function() {
				$("#write_form").show();
				$("#writeArticleButton").hide();
			});

			// 공감 버튼 클릭 이벤트
			$(".posvote").click(function() {
				var postId = $(this).data('post-id');
				console.log("공감 클릭, postId:", postId);
				if (confirm("이 강의평을 추천하시겠습니까?")) {
					addLike(postId);
				}
			});

			// 스크랩 버튼 클릭 이벤트
			$(".posScrap").click(function() {
				var postId = $(this).data('post-id');
				var scrapStatus = $(this).data('scrap-status');
				if (scrapStatus === 'not-scraped') {
					if (confirm("이 글을 스크랩 하시겠습니까?")) {
						addScrap(postId, $(this));
					}
				} else {
					if (confirm("스크랩을 취소하시겠습니까?")) {
						cancelScrap(postId, $(this));
					}
				}
			});

			$(".posScrap").each(function() {
				var postId = $(this).data('post-id');
				var buttonElement = $(this);
				checkScrapStatus(postId, buttonElement);
			});

			// AJAX로 공감 추가 요청
			function addLike(postId) {
				var obj = {
					'postId' : postId
				};
				$.ajax({
					type : 'POST',
					url : 'postLike',
					headers : {
						'Content-Type' : 'application/json'
					},
					data : JSON.stringify(obj),
					success : function(result) {
						if (result == 1) {
							increaseLikeCount(postId);
							updateLikeVisibility();
						} else {
							alert("이미 추천하였습니다.");
						}
					},
					error : function(xhr, status, error) {
						console.error("공감 추가 실패:", status, error);
					}
				});
			}

			// AJAX로 스크랩 추가 요청
			function addScrap(postId, buttonElement) {
				var obj = {
					'postId' : postId
				};
				$.ajax({
					type : 'POST',
					url : 'postScrap', // 서버의 실제 URL로 변경 필요
					headers : {
						'Content-Type' : 'application/json'
					},
					data : JSON.stringify(obj),
					success : function(result) {
						if (result == 1) {
							buttonElement.text('스크랩 취소');
							buttonElement.data('scrap-status', 'scraped');
							increaseScrapCount(postId);
							updateScrapVisibility();
						} else {
							alert("이미 스크랩하였습니다.");
						}
					},
					error : function(xhr, status, error) {
						console.error("스크랩 추가 실패:", status, error);
					}
				});
			}

			// AJAX로 스크랩 취소 요청
			function cancelScrap(postId, buttonElement) {
				var obj = {
					'postId' : postId
				};
				$.ajax({
					type : 'POST',
					url : 'postCancelScrap',
					headers : {
						'Content-Type' : 'application/json'
					},
					data : JSON.stringify(obj),
					success : function(result) {
						if (result == 1) {
							buttonElement.text('스크랩');
							buttonElement.data('scrap-status', 'not-scraped');
							decreaseScrapCount(postId);
							updateScrapVisibility();
						} else {
							alert("스크랩 취소에 실패하였습니다.");
						}
					},
					error : function(xhr, status, error) {
						console.error("스크랩 취소 실패:", status, error);
					}
				});
			}

			// 서버에서 스크랩 상태 확인
			function checkScrapStatus(postId, buttonElement) {
				$.ajax({
					type : 'GET',
					url : 'getScrapStatus', // 서버의 실제 URL로 변경 필요
					headers : {
						'Content-Type' : 'application/json'
					},
					data : {
						'postId' : postId
					},
					success : function(result) {
						if (result.scraped) {
							buttonElement.text('스크랩 취소');
							buttonElement.data('scrap-status', 'scraped');
						} else {
							buttonElement.text('스크랩');
							buttonElement.data('scrap-status', 'not-scraped');
						}
					},
					error : function(xhr, status, error) {
						console.error("스크랩 상태 확인 실패:", status, error);
					}
				});
			}

			function increaseLikeCount(postId) {
				var likeElement = $("#like-" + postId); // 공감 수를 표시하는 li 요소를 가져옴
				var currentLikes = parseInt(likeElement.text());
				var newLikes = currentLikes + 1;
				likeElement.text(newLikes);
			}

			function increaseScrapCount(postId) {
				var scrapElement = $("#scrap-" + postId); // 스크랩 수를 표시하는 li 요소를 가져옴
				var currentScraps = parseInt(scrapElement.text());
				var newScraps = currentScraps + 1;
				scrapElement.text(newScraps);
			}

			// 스크랩 수 감소
			function decreaseScrapCount(postId) {
				var scrapElement = $("#scrap-" + postId);
				var currentScraps = parseInt(scrapElement.text());
				var newScraps = currentScraps - 1;
				scrapElement.text(newScraps);
			}

		}); // end document();
	</script>
</body>
</html>