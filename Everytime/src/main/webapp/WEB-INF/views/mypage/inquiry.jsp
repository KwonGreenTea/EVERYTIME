<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>문의하기</title>
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
	href="resources/css/inquiry.css" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<%@ include file="../header.jspf" %>

	<div class="container">
		<h2>문의하기</h2>
		<form id="inquiryForm" action="inquiry" method="post">
			<label for="inquiryBoard">문의 내용:</label>
			<textarea id="inquiryBoard" name="inquiryBoard" rows="5" required></textarea>

			<!--             <label class="custom-file-upload">
                <input type="file" id="inquiryFile" name="inquiryFile">
                파일 첨부
            </label> -->

			<label for="email">이메일:</label> <input type="email" id="email"
				name="email" value="${registerVO.email}" required> <label
				for="memberId">아이디:</label> <input type="text" id="memberId"
				name="memberId" value="${registerVO.memberId}" readonly> <label
				id="inquiryCheck"> <input type="checkbox" id="inquiryCheck"
				name="inquiryCheck" required> 개인정보 수집 및 이용 동의(필수)
			</label> 문의 처리를 위해 이메일, 회원정보, 기기정보, 문의내용에 포함된 개인정보를 수집하며, 개인정보처리방침에 따라 3년 후
			파기됩니다. <input type="submit" id="submitButton" value="문의하기">
		</form>
	</div>
	<script type="text/javascript">
		$(document).ready(function() {
			$('#inquiryForm').submit(function(e) {
				e.preventDefault();

				// 폼 데이터를 직렬화하여 변수에 저장
				var formData = $(this).serialize();

				console.log(formData);
				$.ajax({
					url : 'inquiry',
					type : 'post',
					data : formData,
					success : function(response) {
						alert('문의가 정상적으로 처리되었습니다.');
						window.location.href = 'main';
					},
					error : function(xhr, status, error) {
						alert('오류가 발생했습니다.');
					}
				});
			});
		});
	</script>
</body>
</html>