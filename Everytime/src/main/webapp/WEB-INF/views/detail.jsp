<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %>
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
<script type="text/javascript">
	$(document).ready(function() {
		$("#writeArticleButton").click(function() {
			$("#write_form").show();
			$("#writeArticleButton").hide();
		});
	});
</script>
</head>

<body>

	<nav>
		<div class="wrap">
			<div id="logo">
				<a href="../main"><img src="resources/images/soldesk.png"></a>
				<p>
					<span class="name multiple">에브리타임</span><span class="subname">솔데스크대
						강남캠</span>
				</p>
			</div>
			<div id="account">
				<a href="../chat" title="쪽지함" class="icon message">쪽지함</a> <a
					href="../mypage" title="내 정보" class="icon my">내 정보</a>
			</div>
			<ul id="menu">
				<li class="../active"><a href="main">게시판</a></li>
				<li><a href="../time">시간표</a></li>
				<li><a href="../lecture">강의실</a></li>
				<!-- <li><a href="/calculator">학점계산기</a></li>-->
				<li><a href="../frd">친구</a></li>
			</ul>
		</div>
	</nav>
	
	<div id="submenu">
		<div class="wrap">
			<div class="divider"></div>
			<div class="group">
				<ul>
					<li><a href="../main" data-id="370449" class="new">자유게시판</a></li>

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
						<a href="/hotarticle">HOT 게시물<span>더 보기</span></a>
					</h3>
					<a class="list" href="/370449/v/346396066"><time>06/17
							08:46</time>
						<p>안면인식장애인데 심심해서 적는 글.</p>
						<hr></a><a class="list" href="/255746/v/346247565"><time>06/15
							22:32</time>
						<p>아 진짜 수업 때 담배 냄새 좀 빼고 와</p>
						<hr></a><a class="list" href="/370449/v/346254844"><time>06/15
							23:31</time>
						<p>과마다 입결 순위 취업률 순위 나누는거 솔직히 할거없는 사람같아보임</p>
						<hr></a><a class="list" href="/370449/v/346210479"><time>06/15
							16:09</time>
						<p>장보고과학기지에 에리카 출신 있네 ㄷ</p>
						<hr></a>
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
					<a class="article" href="/lecture/view/2084699"><span
						class="star"><span class="on" style="width: 100%;"></span></span>
						<p class="title">영화의세계 : 김영재</p>
						<p class="small">
							옛날 영화에 대한 것들이 많이 나와요.<br>약간 암기위주이긴 한데 영화를 틀어주시면서 설명해주셔서
							이해하기엔 편해요
						</p>
						<hr></a><a class="article" href="/lecture/view/2541696"><span
						class="star"><span class="on" style="width: 100%;"></span></span>
						<p class="title">반도체공정및응용 : 박진석</p>
						<p class="small">
							가성비 개꿀 쌉꿀<br>4학점인데 중간기말에 공정실습하고 보고서 중간기말만 쓰면 끝
						</p>
						<hr></a><a class="article" href="/lecture/view/132545"><span
						class="star"><span class="on" style="width: 80%;"></span></span>
						<p class="title">기계설계 : 류근</p>
						<p class="small">수업 3시간 풀로 하고 팀플 거의 매주 만나서 하고 발표 배점도 높지만 그 모든
							걸 만회할 정도로 성적을 잘 줌</p>
						<hr></a>
				</div>
			</div>
		</div>
		<div class="wrap title">
			<h1>
				<a href="/370449">자유게시판</a>
			</h1>
			<hr>
		</div>
		<div class="wrap notification none"></div>
		<div class="wrap bubbles none"></div>
		<div class="wrap articles">
			<a id="writeArticleButton" style="display: none;">새 글을 작성해주세요!</a>
			<article class="item">
				<a class="article"><img src="https://cf-fpi.everytime.kr/0.png"
					class="picture large">
					<div class="profile">
						<h3 class="large">익명</h3>
						<time class="large"><fmt:formatDate value="${postVO.postCreatedDate}" pattern="yyyy-MM-dd HH:mm:ss" /></time>
					</div>
					<ul class="status">
						<li class="messagesend" data-modal="messageSend"
							data-article-id="346406404" data-is-anonym="1">쪽지</li>
						<li class="abuse">신고</li>
					</ul>
					<hr>
					<h2 class="large">${postVO.postTitle}</h2>
					<p class="large">${postVO.postContent}</p>
					<ul class="status left">
						<li title="공감" class="vote">1</li>
						<li title="댓글" class="comment">1</li>
						<li title="스크랩" class="scrap">1</li>
					</ul>
					<hr>
					<div class="buttons">
						<span class="posvote">공감</span><span class="scrap">스크랩</span>
					</div> <input type="hidden" name="346406404_comment_anonym" value="0"></a>
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
					<form class="writecomment">
						<input type="text" name="text" maxlength="300" autocomplete="off"
							placeholder="댓글을 입력하세요." class="text">
						<ul class="option">
							<li title="익명" class="anonym"></li>
							<li title="완료" class="submit"></li>
						</ul>
						<div class="clearBothOnly"></div>
					</form>
				</div>
			</article>
			<div class="clearBothOnly"></div>
			<div class="pagination">
				<a id="goListButton" class="list">글 목록</a>
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

</body>
</html>