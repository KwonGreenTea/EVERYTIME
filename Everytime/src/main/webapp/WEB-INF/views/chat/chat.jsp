<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://everytime.kr/css/common.css" />
<link rel="stylesheet"
	href="https://everytime.kr/css/common.partial.css" />
<link rel="stylesheet"
	href="https://everytime.kr/css/container.article.css" />
<link rel="stylesheet"
	href="https://everytime.kr/css/container.community.css" />
<link rel="stylesheet"
	href="https://everytime.kr/css/container.modal.css" />
<link rel="stylesheet" href="resources/css/chat.css" />
<script type="text/javascript" src="resources/js/chat.js"></script>
<meta charset="UTF-8">
<title>에브리타임</title>
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
</head>
<body>
	<%@ include file="../header.jspf"%>

	<input type="hidden" id="nickname" value="${registerVO.nickname }">
	<div id="container">
		<div id="roomList">
			<h2>채팅방 리스트</h2>
			<ul>
				<c:forEach var="ChatListVO" items="${chatList}">
					<li data-chatroomid="${ChatListVO.room_id}">${ChatListVO.chat_title}</li>
				</c:forEach>
			</ul>
			<input type="button" id="newChatBtn" value="채팅방 만들기">
		</div>
		<div id="chatSection">
			<div id="chatHeader"></div>
			<div id="chatArea">
				<div id="chatMessageArea"></div>
			</div>
			<div id="messageInput">
				<input type="text" id="message">
				<button id="sendBtn" disabled>전송</button>
			</div>
		</div>
	</div>

	<div id="myModal" class="modal">
		<div class="modal-content">
			<span class="close">&times;</span> <input type="text"
				id="newRoomName" placeholder="채팅방 이름"> <input type="button"
				id="createRoomBtn" value="채팅방 만들기">
		</div>
	</div>

	<script type="text/javascript">
		$(document).ready(
				function() {
					$('#message').keypress(
							function(event) {
								var keycode = (event.keyCode ? event.keyCode
										: event.which);
								if (keycode == '13'
										&& $('#sendBtn')
												.attr('disabled', false)
										&& $(this).val().trim() !== "") {
									send();
								}
								event.stopPropagation();
							});

					$('#sendBtn').click(function() {
						var message = $('#message').val().trim();
						if (message !== "") {
							send();
						}
					});

					$('#roomList li').click(function() {
						var clickedRoomId = $(this).data("chatroomid");

						if (chatRoomId === undefined) {
							if (confirm("채팅방에 입장하나요?")) {
								chatRoomId = clickedRoomId;
								var roomName = $(this).text();
								$('#chatHeader').text(roomName);
								connect(chatRoomId);
							}
						} else if (chatRoomId === clickedRoomId) {
							alert("해당 채팅방에 있습니다.");
						} else {
							if (confirm("다른 채팅방으로 이동하나요?")) {
								disconnect();
								chatRoomId = clickedRoomId;
								var roomName = $(this).text();
								$('#chatHeader').text(roomName);
								connect(chatRoomId);
								$('#chatMessageArea').text("");
							}
						}
					});

					var modal = document.getElementById("myModal");
					var btn = document.getElementById("newChatBtn");
					var span = document.getElementsByClassName("close")[0];

					btn.onclick = function() {
						modal.style.display = "block";
					}

					span.onclick = function() {
						modal.style.display = "none";
					}

				});

		$('#createRoomBtn').click(function() {
			var roomName = $('#newRoomName').val().trim();
			if (roomName.length >= 2) {
				$.ajax({
					type : "POST",
					url : "chat/create",
					data : {
						'roomName' : roomName
					},
					success : function(response) {
						alert('채팅방이 생성되었습니다!');

						window.location.href = "chat";
					},
					error : function(xhr, status, error) {
						alert('오류가 발생했습니다: ' + error);
					}
				});
			} else {
				alert("채팅방 이름은 2글자 이상 입력해주세요.");
			}
		});
	</script>
</body>
</html>