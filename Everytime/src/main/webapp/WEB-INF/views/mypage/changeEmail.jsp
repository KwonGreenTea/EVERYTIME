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
	href="../resources/css/changeEmail.css" />
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
</head>
<body>
	<%@ include file="../header.jspf" %>
	
	<div class="container">
		<h2>이메일 변경</h2>
		<form id="emailForm" action="email/do" method="post">
	        <input type="hidden" id="idHidden" name="id" value="${registerVO.memberId}">
	        <label for="newEmail">이메일</label>
	        <input type="email" id="newEmail" name="newEmail" placeholder="이메일" value="${registerVO.email}" required><br>
	        <input type="password" id="pwChk" name="pwChk" placeholder="계정 비밀번호" required><br>
	        <div id="error-message"></div><br>
	        <input type="submit" value="이메일 변경" id="submitButton" disabled>
	    </form>
	</div>
	
	<script type="text/javascript">
	$(document).ready(function() {
	    $('#pwChk').on('input', function() {
	        var password = $(this).val();
	        var memberId = $('#idHidden').val();
	        var errorMessageDiv = $('#error-message');
	        var submitButton = $('#submitButton');
	        var obj = {
	            'memberId': memberId,
	            'password': password
	        };

	        if (password.length > 0) {
	            $.ajax({
	                type: 'POST',
	                url: 'verifyPw',
	                headers: {
	                    'Content-Type': 'application/json'
	                },
	                data: JSON.stringify(obj),
	                success: function(result) {
	                    if (result === 1) {
	                        errorMessageDiv.text('비밀번호가 일치합니다.').css('color', 'green');
	                        submitButton.prop('disabled', false);
	                    } else {
	                        errorMessageDiv.text('비밀번호가 일치하지 않습니다.').css('color', 'red');
	                        submitButton.prop('disabled', true);
	                    }
	                }
	            });
	        } else {
	            errorMessageDiv.text('');
	            submitButton.prop('disabled', true);
	        }
	    });

	    $('#emailForm').on('submit', function(event) {
	        if ($('#submitButton').prop('disabled') === false) {
	            event.preventDefault();
	            alert('이메일 변경이 완료되었습니다.');
	            this.submit();
	        } else {
	        	alert('비밀번호가 틀립니다.');
	        }
	    });
	});
	</script>

</body>
</html>
