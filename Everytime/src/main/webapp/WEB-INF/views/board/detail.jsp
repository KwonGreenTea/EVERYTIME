<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false"%>
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

	<%@ include file="../header.jspf"%>
	<div id="submenu">
		<div class="wrap">
			<div class="divider"></div>
			<div class="group">
				<ul>
					<li><a href="post_list?boardId=1" class="new">자유게시판</a></li>
					<li><a href="post_list?boardId=2" class="new">비밀게시판</a></li>
					<li><a href="post_list?boardId=3" class="new">졸업생게시판</a></li>
					<li><a href="post_list?boardId=4" class="new">새내기게시판</a></li>
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
				<c:choose>
					<c:when test="${postVO.boardId == 1}">
						<a href="../post/post_list?boardId=1">자유게시판</a>
					</c:when>
					<c:when test="${postVO.boardId == 2}">
						<a href="../post/post_list?boardId=2">비밀게시판</a>
					</c:when>
					<c:when test="${postVO.boardId == 3}">
						<a href="../post/post_list?boardId=3">졸업생게시판</a>
					</c:when>
					<c:when test="${postVO.boardId == 4}">
						<a href="../post/post_list?boardId=3">새내기게시판</a>
					</c:when>
				</c:choose>
			</h1>
			<hr>
		</div>
		<div class="wrap notification none"></div>
		<div class="wrap bubbles none"></div>
		<div class="wrap articles">
			<a id="writeArticleButton" style="display: none;">새 글을 작성해주세요!</a>
			<article class="item">
				<a class="article"><img src="../${profileImgSource}"
					class="picture large">
					<div class="profile">
						<c:choose>
							<c:when test="${postVO.postAnonymous == 0}">
								<h3 class="large">${nickname}</h3>
							</c:when>
							<c:when test="${postVO.postAnonymous == 1}">
								<h3 class="large">익명</h3>
							</c:when>
						</c:choose>

						<time class="large">
							<fmt:formatDate value="${postVO.postCreatedDate}"
								pattern="yyyy-MM-dd HH:mm" />
						</time>
					</div>
					<ul class="status">
						<li class="messagesend" data-modal="messageSend"
							data-article-id="346406404" data-is-anonym="1">쪽지</li>
						<li class="abuse">신고</li>
					</ul>
					<hr>
					<h2 class="large">${postVO.postTitle}</h2>
					<p class="large">${postVO.postContent}</p>

					<div class="attaches multiple">
						<c:forEach var="src" items="${imgSource}">
							<c:if test="${not empty src}">
								<figure class="attach">
									<img src="../${src}">
								</figure>
							</c:if>
						</c:forEach>
					</div>


					<ul class="status left">
						<li title="공감" class="vote like-count" id="like-${postVO.postId}">${postVO.postLikeCount}</li>
						<li title="댓글" class="comment">1</li>
						<li title="스크랩" class="scrap scrap-count"
							id="scrap-${postVO.postId}">${postVO.postScrapCount}</li>
					</ul>
					<hr>
					<div class="buttons">
						<span class="posvote" data-post-id="${postVO.postId}">공감</span> <span
							class="posScrap" data-post-id="${postVO.postId}"
							data-scrap-status="not-scraped">스크랩</span>
					</div> <input type="hidden" name="346406404_comment_anonym" value="0"></a>

				<!-- #####################댓글 목록##################### -->

				<div class="comments" style="display: block;">
					<article class="parent">
						<img src="https://cf-fpi.everytime.kr/0.png"
							class="picture medium">
						<h3 class="medium">익명1</h3>
						<ul class="status">
							<li class="childcomment">대댓글</li>
							<li class="commentvote">공감</li>
							<li class="messagesend" data-modal="messageSend"
								data-comment-id="1550240911" data-is-anonym="1">쪽지</li>
							<li class="abuse">신고</li>
						</ul>
						<hr>
						<p class="large">이보다 더 쉬울수있냐...</p>
						<time class="medium">7분 전</time>
						<ul class="status commentvotestatus">
							<li class="vote commentvote" style="display: none;">0</li>
						</ul>
					</article>
					<article class="parent">
						<img src="https://cf-fpi.everytime.kr/0.png"
							class="picture medium">
						<h3 class="medium">익명2</h3>
						<ul class="status">
							<li class="childcomment">대댓글</li>
							<li class="commentvote">공감</li>
							<li class="messagesend" data-modal="messageSend"
								data-comment-id="1550243333" data-is-anonym="1">쪽지</li>
							<li class="abuse">신고</li>
						</ul>
						<hr>
						<p class="large">4문제 맞지?</p>
						<time class="medium">방금</time>
						<ul class="status commentvotestatus">
							<li class="vote commentvote" style="display: none;">0</li>
						</ul>
					</article>

					<form class="writecomment child">
						<input type="text" name="text" maxlength="300" autocomplete="off"
							placeholder="대댓글을 입력하세요." class="text">
						<ul class="option">
							<li title="익명" class="anonym"></li>
							<li title="대댓글 작성 완료" class="submit"></li>
						</ul>
						<div class="clearBothOnly"></div>
					</form>

					<!-- #####################댓글 작성##################### -->
					<form class="writecomment" id="writecomment"
						action="/web/reply/create" method="post">
						<input type="text" name="replyContent" maxlength="300"
							autocomplete="off" placeholder="댓글을 입력하세요." class="text">
						<input type="hidden" name="boardId" id="boardId"
							value="${param.boardId}"> <input type="hidden"
							name="postId" id="postId" value="${param.postId}"> <input
							type="hidden" name="memberId" id="memberId" value="test">
						<input type="hidden" name="memberId" id="memberId" value="test">
						<input type="hidden" name="memberId" id="memberId" value="test">

						<ul class="option">
							<li title="익명" class="anonym"></li>
							<li title="댓글 작성 완료" class="submit" id="submitBtn"></li>

						</ul>
						<div class="clearBothOnly"></div>
					</form>

					</ul>
					<div class="clearBothOnly"></div>
					</form>
				</div>
			</article>
			<div class="clearBothOnly"></div>
			<div class="pagination">
				<a href="post_list?boardId=${param.boardId }" id="goListButton" class="list">글 목록</a>
			</div>
		</div>
		<hr>
		<form id="abuseForm" class="modal">
			<a title="닫기" class="close"></a>
			<h3>신고 사유 선택</h3>
			<ul>
				<li><a data-reason="1">게시판 성격에 부적절함</a></li>
				<li><a data-reason="2">욕설/비하</a></li>
				<li><a data-reason="3">음란물/불건전한 만남 및 대화</a></li>
				<li><a data-reason="4">상업적 광고 및 판매</a></li>
				<li><a data-reason="5">유출/사칭/사기</a></li>
				<li><a data-reason="6">낚시/놀람/도배</a></li>
				<li><a data-reason="7">정당/정치인 비하 및 선거운동</a></li>
				<li><a data-reason="10">불법촬영물 등의 유통</a></li>
			</ul>
		</form>
		<form id="manageMoimForm" class="modal">
			<a title="닫기" class="close"></a>
			<h3>게시판 설정</h3>
			<p>
				<label>소개</label> <input type="text" name="info" class="text">
			</p>
			<p class="hide">
				<label>인기 글 금지</label> <input type="checkbox"
					id="manageMoimForm_is_not_selected_hot_article"
					name="is_not_selected_hot_article"><label
					for="manageMoimForm_is_not_selected_hot_article" class="checkbox">글이
					공감을 받아도 인기 글 및 HOT 게시물에 선정되지 않음</label>
			</p>
			<input type="button" value="게시판 양도" class="button light floatLeft">
			<input type="button" value="게시판 삭제" class="button light floatLeft">
			<input type="submit" value="수정" class="button">
		</form>
		<form id="transferMoimForm" class="modal">
			<a title="닫기" class="close"></a>
			<h3>게시판 양도</h3>
			<p>
				<label>양도인 비밀번호</label> <input type="password"
					name="transferer_password" class="text">
			</p>
			<p>
				<label>피양도인 아이디</label> <input type="text" name="transferee_userid"
					class="text">
			</p>
			<input type="submit" value="양도 요청" class="button">
		</form>
		<form id="attachThumbnailForm" class="modal">
			<a title="닫기" class="close"></a>
			<h3>첨부된 이미지</h3>
			<p>
				<label>설명 추가</label>
				<textarea name="caption" class="text"
					placeholder="이 이미지에 대한 설명을 입력하세요."></textarea>
			</p>
			<input type="button" value="첨부 삭제" class="button light floatLeft">
			<input type="submit" value="설명 저장" class="button">
		</form>
		<form id="messageSend" class="modal">
			<a title="닫기" class="close"></a>
			<h3>쪽지 보내기</h3>
			<p>
				<textarea name="message" class="text" placeholder="내용을 입력해주세요."></textarea>
			</p>
			<input type="submit" value="전송" class="button">
		</form>
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
				var obj = {
					'postId' : postId
				};
				$.ajax({
					type : 'POST',
					url : 'getScrapStatus', // 서버의 실제 URL로 변경 필요
					headers : {
						'Content-Type' : 'application/json'
					},
					data : JSON.stringify(obj),
					success : function(result) {
						if (result == 1) {
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

	<script type="text/javascript">
		document.getElementById('writeArticleButton').addEventListener('click',
				function() {
					document.getElementById('write').style.display = 'block';
				});

		document.getElementById('submitBtn').addEventListener('click',
				function() {
					document.getElementById('writecomment').submit();
				});
	</script>

</body>
</html>