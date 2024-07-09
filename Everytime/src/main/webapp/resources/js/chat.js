	var wsocket;
	var chatRoomId;

	function connect(chatRoomId) {
		if (wsocket !== undefined && wsocket.readyState !== WebSocket.CLOSED) {
			wsocket.close();
		}

		wsocket = new WebSocket("ws://192.168.0.107:8080/web/chat/message-ws/"
				+ chatRoomId);
		wsocket.onopen = onOpen;
		wsocket.onmessage = onMessage;
		wsocket.onclose = onClose;
	}

	function disconnect() {
		var msg = 'msg:[' + $('#nickname').val() + ' 퇴장!]';
		wsocket.send(msg);
		wsocket.close();
	}

	function onOpen(evt) {
		$('#sendBtn').attr('disabled', false);
		var msg = 'msg:[' + $('#nickname').val() + ' 입장!]';
		wsocket.send(msg);
	}

	function onMessage(evt) {
		var data = evt.data;
		if (data.substring(0, 4) == 'msg:') {
			appendMessage(data.substring(4));
		}
	}

	function onClose(evt) {
		$('#sendBtn').attr('disabled', true);
	}

	function send() {
		var nickname = $('#nickname').val();
		var msg = $('#message').val();
		wsocket.send("msg:" + nickname + ':' + msg);
		$('#message').val('');

		// 데이터베이스에 채팅 데이터 입력
		var dt = new Date();
		var obj = {
			'room_id' : chatRoomId,
			'nickname' : nickname,
			'chat_content' : msg,
			'chat_time' : dt
		};

		if (obj) {
			$.ajax({
				type : 'POST',
				url : 'chat/insert',
				headers : {
					'Content-Type' : 'application/json'
				},
				data : JSON.stringify(obj),
				success : function(result) {
					console.log("채팅 입력");
				}
			});
		}
	}

	function appendMessage(msg) {
		$('#chatMessageArea').append(msg + '<br>');
		var chatAreaHeight = $('#chatArea').height();
		var maxScroll = $('#chatMessageArea').height() - chatAreaHeight;
		$('#chatArea').scrollTop(maxScroll);
	}