<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>아이디 찾기</title>
<link rel="stylesheet"
	href="resources/css/findId.css" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" type="text/css" href="resources/css/login11a.css">
<link rel="stylesheet" type="text/css" href="resources/css/login75.css">
<link rel="stylesheet" type="text/css" href="resources/css/findId96.css">
</head>
<body>
<<<<<<< HEAD



	<div data-v-60803e18="">
		<div data-v-60803e18="" class="container">
			<section data-v-60803e18="">
				<div data-v-60803e18="" class="menu">
					<a data-v-60803e18="" class="active"><span data-v-60803e18="">아이디
							찾기</span></a>
				</div>
				<form data-v-60803e18="" id="findId" method="post">
					<input data-v-60803e18="" id = "email" name = "email" type="email" placeholder="가입된 이메일"
						autocomplete="off" required> <input data-v-60803e18=""
						type="submit" id = "findIdBtn" value="아이디 찾기">
					<div data-v-60803e18="" class="description">
						<p data-v-60803e18="">※ 가입된 아이디가 있을 경우, 입력하신 이메일로 아이디를 안내해
							드립니다.</p>
						<p data-v-60803e18="">※ 만약 이메일이 오지 않는다면, 스팸 편지함으로 이동하지 않았는지
							확인해주세요.</p>
						<p data-v-60803e18="">※ 이메일 서비스 제공자 사정에 의해 즉시 도착하지 않을 수 있으니,
							최대 30분 정도 기다리신 후 다시 시도해주세요.</p>
					</div>
				</form>
			</section>
		</div>
	</div>





	<script type="text/javascript">
		$(document)
				.ready(
						function() {
							// 아이디 찾기 버튼 클릭 이벤트 처리
							$('#findIdBtn')
									.click(
											function() {
												var email = $('#email').val(); // 이메일 입력 값 가져오기
												if (email === "") {
													alert("이메일을 입력해주세요.");
													return;
												}

												$
														.ajax({
															url : 'findId',
															type : 'POST',
															data : {
																email : email
															},
															success : function(
																	data) {
																if (data.status === "success") {
																	alert("안내 이메일을 발송하였습니다. 만약 메일이 오지 않는다면, 스팸 편지함을 확인해주세요.");
																} else {
																	alert("올바르지 않은 이메일 형식으로 가입된 아이디입니다. [문의하기]를 통해 별도 문의 바랍니다.");
																}
															},
															error : function(
																	xhr,
																	status,
																	error) {
																console
																		.log(email);
																console
																		.error(
																				"Error:",
																				status,
																				error);
																alert("메일 전송 중 오류가 발생했습니다. 다시 시도해주세요.");
															}
														});
											});
						});
	</script>
=======
	<h2>아이디 찾기</h2>
        <form id="findId" method="post">
            <div class="form-group">
                <label for="email">이메일 주소</label>
                <input type="email" id="email" name="email" required>
            </div>
            <button type="button" id="findIdBtn" class="btn">아이디 찾기</button>
        </form>
        
        <script type="text/javascript">
        $(document).ready(function() {
            // 아이디 찾기 버튼 클릭 이벤트 처리
            $('#findIdBtn').click(function() {
                var email = $('#email').val(); // 이메일 입력 값 가져오기
                if (email === "") {
                    alert("이메일을 입력해주세요.");
                    return;
                }
                
                $.ajax({
                    url: 'findId',
                    type: 'POST',
                    data: { email: email },
                    success: function(data) {
                        if (data.status === "success") {
                            alert("안내 이메일을 발송하였습니다. 만약 메일이 오지 않는다면, 스팸 편지함을 확인해주세요.");
                            window.location.href = 'login';
                        } else {
                            alert("올바르지 않은 이메일 형식으로 가입된 아이디입니다.");
                        }
                    },
                    error: function(xhr, status, error) {
                        console.log(email);
                        console.error("Error:", status, error);
                        alert("메일 전송 중 오류가 발생했습니다. 다시 시도해주세요.");
                    }
                });
            });
        });
    </script>
>>>>>>> branch 'master' of https://github.com/KwonGreenTea/EVERYTIME
</body>
</html>