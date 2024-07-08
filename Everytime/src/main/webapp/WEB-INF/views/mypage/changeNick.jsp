<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="UTF-8">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
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
<link rel="stylesheet" 
	href="../resources/css/changeNick.css" />
</head>
<body>
	<%@ include file="../header.jspf" %>
	
	<div class="container">
		<h2>닉네임 변경</h2>
		<form id="nicknameForm" action="nickname/do" method="post">
			<input type="hidden" id="idHidden" name="id"
				value="${registerVO.memberId}"> 
			<label for="newNick">닉네임</label>
			<input type="text" id="newNick" name="newNickname" placeholder="닉네임"
				value="${registerVO.nickname }" maxlength="12" required><br>
			<div id="error-message"></div>
			<input type="submit" value="닉네임 변경">
		</form>

		<script>
			document.getElementById('nicknameForm').addEventListener('submit',
					function(event) {
						event.preventDefault();
						alert('닉네임 변경이 완료되었습니다.');
						this.submit();
					});
		</script>
	</div>

</body>
</html>
