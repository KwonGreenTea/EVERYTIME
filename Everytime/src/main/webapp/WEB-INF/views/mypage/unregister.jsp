<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://everytime.kr/css/common.css" />
<link rel="stylesheet"
	href="https://everytime.kr/css/common.partial.css" />
<link rel="stylesheet"
	href="https://everytime.kr/css/container.article.css" />
<link rel="stylesheet"
	href="https://everytime.kr/css/container.community.css" />
<link rel="stylesheet"
	href="https://everytime.kr/css/container.modal.css" />
<link rel="stylesheet" href="resources/css/unregister.css" />
<title>에브리타임</title>
<script>
	document
			.addEventListener(
					"DOMContentLoaded",
					function() {
						var form = document.querySelector("form");
						form
								.addEventListener(
										"submit",
										function(event) {
											var confirmation = confirm("탈퇴 전 안내사항을 반드시 확인 후 진행해주세요. 탈퇴하시겠습니까?");
											if (!confirmation) {
												event.preventDefault();
												return; // 함수 실행을 멈추기 위해 return을 추가했습니다.
											}

											alert("탈퇴가 성공적으로 처리되었습니다."); // 성공 메시지를 추가했습니다.
										});

						var errorMessage = "${errorMessage}";
						if (errorMessage) {
							alert(errorMessage); // 에러 메시지가 있을 경우 경고창을 띄웁니다.
						}
					});
</script>

</head>
<body>
	<%@ include file="../header.jspf"%>

	<div class="container">
		<h2>회원 탈퇴</h2>
		<form action="unregister" method="post">
			<label for="password">계정 비밀번호</label> <input type="password"
				id="password" name="password" placeholder="계정 비밀번호" required>

			<div class="notice">
				<p class="warning">※ 탈퇴 및 가입을 반복할 경우, 서비스 악용 방지를 위해 재가입이 제한됩니다.
					최초 탈퇴시에는 가입 시점을 기준으로 1일간 제한되며, 2회 이상 탈퇴를 반복할 경우 30일간 제한됩니다.</p>
				<p>※ 탈퇴 후 개인정보, 시간표 등의 데이터가 삭제되며, 복구할 수 없습니다.</p>
				<p>※ 다시 가입하여도, 게시판 등 이용 제한 기록은 초기화되지 않습니다.</p>
				<p>※ 작성한 게시물은 삭제되지 않으며, (알수없음)으로 닉네임이 표시됩니다.</p>
				<p>※ 자세한 내용은 개인정보처리방침을 확인해주세요.</p>
			</div>
			<input type="submit" id="submitButton" value="회원 탈퇴">
		</form>
	</div>
</body>
</html>
