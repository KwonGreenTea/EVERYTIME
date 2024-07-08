<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>에브리타임</title>
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<link rel="stylesheet" href="https://everytime.kr/css/common.css" />
<link rel="stylesheet"
	href="https://everytime.kr/css/common.partial.css" />
<link rel="stylesheet"
	href="https://everytime.kr/css/container.article.css" />
<link rel="stylesheet"
	href="https://everytime.kr/css/container.community.css" />
<link rel="stylesheet"
	href="https://everytime.kr/css/container.modal.css" />
<link rel="stylesheet" href="resources/css/mypage.css" />
<script type="text/javascript" src="resources/js/mypage.js"></script>
<style>

</style>
</head>
<body>

	<%@ include file="../header.jspf"%>

	<div class="container first-container">
		<div class="profile-header">
				<h2>내정보</h2>
		    <form action="logout" method="get">
		        <button class="logout-button" id="logoutBtn" onclick="logout()">로그아웃</button>
		    </form>
		</div>
		<div class="profile">
			<img src="${imgSource}" alt="프로필 사진"
				onclick="changeImgModal()">  
			<p>${registerVO.name } / ${registerVO.nickname }</p>
		</div>

		 <div id="imgModal" class="modal">
            <div class="modal-content">
                <br><br><h3>프로필 변경</h3><hr><br><br>
                <form id="attachForm" action="imgAttach" method="post" enctype="multipart/form-data">
					<input type="hidden" name="memberId" value="${registerVO.memberId}">
					<input type="file" name="file" id="imgFile" style="display: none;" accept=".jpg, .jpeg, .png" onchange="handleFileSelect(event)">
				</form>
                <button class="modal-button" id="changeImgBtn" onclick="changeImgBtn()" style="margin:0 auto;">이미지 파일 업로드</button>
                <div class="img-preview" id="imgPreview"></div>
                <button class="modal-button" id="reImgBtn" onclick="changeImgBtn()" style="display: none;">이미지 바꾸기</button>
      			<button class="modal-button" id="uploadBtn" onclick="uploadFile()" style="display: none;">프로필 변경</button>
                <br><h4>.jpg .jpeg .png 파일만 업로드할 수 있습니다.</h4>
                <h4>이미지 파일은 최대 5MB까지 가능합니다.</h4><br>
            </div>
        </div>
	</div>



	<div class="container">
	    <h3>계정</h3>
	    <div class="account-info">
	        <p class="account-label">아이디</p>
	        <p class="account-value">${registerVO.memberId}</p>
	    </div>
	    <form id="pwForm" action="mypage/password" method="post">
	        <input type="hidden" id="idInput" name="id" value="${registerVO.memberId}">
	        <input type="hidden" id="pwInput" name="pw" value="${registerVO.password}">
	        <button id="passwordChange" type="button">비밀번호 변경</button>
	    </form>
	    <form id="emailForm" action="mypage/email" method="post">
	        <input type="hidden" id="idInput" name="id" value="${registerVO.memberId}">
	        <input type="hidden" id="pwInput" name="pw" value="${registerVO.password}">
	        <input type="hidden" id="emailInput" name="email" value="${registerVO.email}">
	        <button id="emailChange" type="button">이메일 변경</button>
	    </form>
	    <form id="nicknameForm" action="mypage/nickname" method="post">
	        <input type="hidden" id="idInput" name="id" value="${registerVO.memberId}">
	        <input type="hidden" id="nickInput" name="nickname" value="${registerVO.nickname}">
	        <button id="nicknameChange" type="button">닉네임 설정</button>
	    </form>
	</div>


	<div class="container">
		<h3>이용 안내</h3>
		<div class="info">
			<button id="inquiryBtn">문의하기</button>
		</div>
	</div>

	<div class="container">
		<h3>회원 탈퇴</h3>
		<div class="info">
			<button id="unregisterBtn">회원 탈퇴</button>
		</div>
	</div>

</body>
</html>

