<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에브리타임</title>
<link rel="stylesheet"
	href="resources/css/login.css" />
</head>
<body>

	<h2>회원 로그인</h2>

	<form action="login" method="post">
		<label for="memberId">아이디</label> <input type="text" id="memberId"
			name="memberId" required><br>
		<br> <label for="password">비밀번호</label> <input type="password"
			id="password" name="password" required><br>
		<br> <input type="submit" value="로그인">
	</form>

	<p>
		아직 회원이 아니신가요? <a href="register">회원가입</a>
	</p>
	
	<p><a href="findId">아이디 찾기</a></p>

</body>
</html>
