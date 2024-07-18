<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
<!DOCTYPE html>
<html>
<head>
<link type="text/css" href="resources/css/common.css" rel="stylesheet">
<link type="text/css" href="resources/css/common.partial.css"
	rel="stylesheet">
<link type="text/css" href="resources/css/container.message.css"
	rel="stylesheet">
<link type="text/css" href="resources/css/container.modal.css"
	rel="stylesheet">
<meta charset="UTF-8">
<title>에브리타임</title>
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<script type="text/javascript"
	src="resources/js/extensions.jquery-1.10.2.min.js"></script>
<script type="text/javascript"
	src="resources/js/extensions.underscore-min.js"></script>
<script type="text/javascript" src="resources/js/common.js"></script>
<script type="text/javascript" src="resources/js/message.index.js"></script>
<script type="text/javascript" src="resources/js/message.send.js"></script>
</head>
<body style="">

	<%@ include file="../header.jspf"%>
	<div id="container" class="message" data-box-id="0">
		<aside class="none">
			<div class="title">
				<a class="hamburger"></a>
				<h1>쪽지함</h1>
			</div>
		</aside>
		<div class="messageboxes">
			<h2>쪽지함</h2>
			<c:forEach var="messageVO" items="${msgList}">
				<div class="items">
					<a class="item" href="message/${messageVO.messageNo}"><time>${messageVO.messageCreatedDate}</time>
						<h3>${messageVO.nickname}</h3>
						<p class="text">${messageVO.content}</p></a>
				</div>
			</c:forEach>

			<!-- <a class="item active" href="/message/82837577"><time>05/29
					11:27</time>
				<h3>익명</h3>
				<p class="text">ㅈㅅ합니다 ㅠㅠ</p></a> -->
		</div>
		<div class="messages visible">
			<div class="title">
				<a class="back">뒤로</a>
				<h2>익명</h2>
				<a class="send" data-modal="messageSend" data-box-id="82837577"
					data-is-anonym="1">쪽지 보내기</a><a class="refresh">새로고침</a><a
					class="more">더보기</a>
			</div>
			<div class="items">
				<div class="item">
					<time>05/29 11:27</time>
					<p class="type type1">받은 쪽지</p>
					<p class="text">ㅈㅅ합니다 ㅠㅠ</p>
				</div>
				<div class="item">
					<time>05/29 11:27</time>
					<p class="type type2">보낸 쪽지</p>
					<p class="text">저기 누구신진 몰라도 계속 쪽지를 보내시면 차단 해버릴꺼에욧!!!!</p>
				</div>
				<div class="item">
					<time>05/29 11:26</time>
					<p class="type type1">받은 쪽지</p>
					<p class="text">ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ</p>
				</div>
				<div class="item">
					<time>05/29 11:22</time>
					<p class="type type1">받은 쪽지</p>
					<p class="text">저 민예인이요</p>
				</div>
				<div class="item">
					<time>05/29 11:15</time>
					<p class="type type2">보낸 쪽지</p>
					<p class="text">누구세요..?</p>
				</div>
				<div class="item">
					<time>05/29 11:15</time>
					<p class="type type1">받은 쪽지</p>
					<p class="text">어 그래그래 보성이 어서오고</p>
				</div>
				<div class="item">
					<time>05/29 11:15</time>
					<p class="type type0">안내</p>
					<p class="text">
						새내기게시판에 작성된 글을 통해 시작된 쪽지입니다.<br>글 내용: 부천에서 통학하는 사람!! 1시간 30분
						걸린다는데 버틸 수 있을까
					</p>
				</div>
				<div class="item">
					<time>05/29 11:15</time>
					<p class="type type0">안내</p>
					<p class="text">쪽지 이용 시 개인정보 및 금융정보 보호에 유의해주시기 바랍니다. 광고, 스팸, 사기
						등의 쪽지를 받으셨을 경우 스팸 신고를 눌러주세요.</p>
				</div>
			</div>
		</div>
		<form id="messageSend" class="modal"
			style="margin-left: -200px; margin-top: -107px; display: none;">
			<a title="닫기" class="close"></a>
			<h3>쪽지 보내기</h3>
			<p>
				<textarea name="message" class="text" placeholder="내용을 입력해주세요."></textarea>
			</p>
			<input type="submit" value="전송" class="button">
		</form>
		<form id="messageMore" class="modal"
			style="margin-left: -200px; margin-top: -106px; display: none;">
			<a title="닫기" class="close"></a>
			<h3>쪽지함</h3>
			<ul>
				<li><a data-menu="removeAll">전체 삭제</a></li>
				<li><a data-menu="block">차단</a></li>
				<li><a data-menu="reportSpam">스팸 신고</a></li>
			</ul>
		</form>
	</div>
</body>
</html>