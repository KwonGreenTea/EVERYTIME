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
<link rel="stylesheet" href="/web/resources/css/mainCommon.css" />
<link rel="stylesheet" href="/web/resources/css/mainCommon.partial.css" />
<link rel="stylesheet" href="/web/resources/css/container.article.css" />

<link rel="stylesheet" href="/web/resources/css/container.community.css" />

<link rel="stylesheet" href="/web/resources/css/container.modal.css" />


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
			<form action="" method="POST" class="search">
				<input type="text" name="keyword" placeholder="전체 게시판의 글을 검색하세요!"
					class="text">
			</form>
			<div class="card">
				<div class="board">
					<h3>
						<a href="../post/hotpost">HOT 게시물<span>더 보기</span></a>
					</h3>
					<c:forEach var="postVO" items="${hotPostList }" begin="0" end="3">
						<a class="list" href="/370449/v/348440683"> <time>${postVO.postCreatedDate }</time>
							<p>${postVO.postTitle }</p>
							<hr>
						</a>
					</c:forEach>
				</div>
			</div>
			<div class="card">
				<div class="board">
					<h3>
						<a href="/bestarticle">BEST 게시판<span>더 보기</span></a>
					</h3>
				</div>
			</div>
			<div class="card">
				<div class="board">
					<h3>
						<a href="/lecture">최근 강의평<span>더 보기</span></a>
					</h3>
					<a class="article" href="/lecture/view/137944"><span
						class="star"><span class="on" style="width: 20%;"></span></span>
						<p class="title">미분적분학2 : 박상웅</p>
						<p class="small">일점도 아까운데 내 최악의 교수임 혼자 달리시는걸 엄청 좋아하심</p>
						<hr></a><a class="article" href="/lecture/view/135695"><span
						class="star"><span class="on" style="width: 80%;"></span></span>
						<p class="title">기능성고분자 : 장영욱</p>
						<p class="small">전반적인 고분자합성방법 응용 시제품적용 등 고분자쪽에서 다룰수 있는건 거의 다룸.
							자료내용이 많지는 않아서 필기 열심히하몀 공부할때 도움많이됩니</p>
						<hr></a><a class="article" href="/lecture/view/501949"><span
						class="star"><span class="on" style="width: 100%;"></span></span>
						<p class="title">무역업창업과마케팅 : 백상현</p>
						<p class="small">출석 안보심. 무역 실무에 굉장한 전문가이시기 때문에 현실적인 조언이나 팁들을
							전수받을 수 있음. 시험은 범위 알려주셔서 외우기만 하면 쉬운 편</p>
						<hr></a>
				</div>
			</div>
		</div>

		<div class="wrap title">
			<h1>
				<a href="../post/hotpost">HOT 게시판</a>
			</h1>
			<hr>
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

	<hr>
</body>
</html>