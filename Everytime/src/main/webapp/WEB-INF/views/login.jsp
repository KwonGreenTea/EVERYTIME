<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에브리타임</title>

<link rel="stylesheet" type="text/css" href="resources/css/login11a.css">
<link rel="stylesheet" type="text/css" href="resources/css/login75.css">
</head>
<body>


<!-- ---------------------------------- -->
	<div data-v-c80e0668="" class="container">
		<h1 data-v-c80e0668="" class="logo"></h1>
		<!---->
		<!---->
		<form data-v-c80e0668="" action="login" method="post">
			<div data-v-c80e0668="" class="input">
				<input data-v-c80e0668="" name="memberId" id="memberId" type="text" maxlength="20"
					placeholder="아이디" required> <input data-v-c80e0668=""
					name="password" type="password" id="password" maxlength="20" placeholder="비밀번호" required>
				<input data-v-c80e0668="" type="hidden" name="redirect_uri"
					value="https://everytime.kr">
			</div>
			<input data-v-c80e0668="" type="submit" value="에브리타임 로그인">
			<div data-v-c80e0668="" class="options">
				<label data-v-c80e0668="" class="keep"><input
					data-v-c80e0668="" type="checkbox">
					<figure data-v-c80e0668="" ></figure>
					
					 </label> <a data-v-c80e0668="" href="findId">아이디 찾기</a>
			</div>
		</form>
		<p data-v-c80e0668="" class="register">
			<a data-v-c80e0668=""
				href="register">회원가입</a>
		</p>
		<footer data-v-c80e0668="">
			<a data-v-c80e0668=""
				href="https://everytime.kr/page/serviceagreement"> 이용약관 </a> <a
				data-v-c80e0668="" href="https://everytime.kr/page/privacy"
				class="privacy"> 개인정보처리방침 </a> <a data-v-c80e0668=""
				href="https://everytime.kr/page/faq"> 문의하기 </a> <a
				data-v-c80e0668="" href="https://everytime.kr" class="copyright">
				© 에브리타임 </a>
		</footer>
	</div>
</body>
</html>
