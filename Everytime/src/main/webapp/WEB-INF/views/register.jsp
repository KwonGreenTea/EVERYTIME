<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.everytime.web.domain.RegisterVO" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원가입</title>
    <!-- jQuery CDN -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f8f9fa; /* 연한 그레이 */
        }

        h2 {
            text-align: center;
            margin-top: 50px;
        }

        form {
            width: 50%;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* 그림자 효과 */
        }

        label {
            display: block;
            font-weight: bold;
            margin-bottom: 10px;
        }

        input[type="text"],
        input[type="password"],
        input[type="email"] {
            width: calc(100% - 22px);
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box; /* padding과 border 포함하여 크기 설정 */
        }

        input[type="submit"] {
            width: 100%;
            padding: 15px;
            background-color: #007bff; /* 파란색 */
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #0056b3; /* 파란색 조금 진한 색 */
        }

        .error-message {
            color: red;
            font-size: 14px;
            margin-bottom: 10px;
        }

        .success-message {
            color: green;
            font-size: 14px;
            margin-bottom: 10px;
        }

        .id-check-container {
            display: flex;
            align-items: center;
            margin-bottom: 20px; /* 아이디 확인 컨테이너의 하단 여백 */
        }

        .id-check-container input[type="text"] {
            flex: 1;
            padding: 10px;
            margin-right: 10px;
        }

        .id-check-container button {
            padding: 10px 20px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .id-check-container button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>

<h2>회원가입</h2>
<form id="registerForm" action="register" method="post">
    <label for="memberId">아이디:</label>
    <div class="id-check-container">
        <input type="text" id="memberId" name="memberId" required>
        <button type="button" id="checkId">중복 확인</button>
    </div>
    <div class="error-message" id="idError" style="display: none;">아이디를 입력해주세요.</div>
    <div class="error-message" id="idFormatError" style="display: none;">아이디는 영어 소문자와 숫자로만 이루어져야 하며, 5~15자 사이여야 합니다.</div>
    <div class="error-message" id="idExist" style="display: none;">이미 사용 중인 아이디입니다.</div>
    <div class="success-message" id="idAvailable" style="display: none;">사용 가능한 아이디입니다.</div>
    <br>
    
    <label for="password">비밀번호:</label>
    <input type="password" id="password" name="password" required><br>
    <div class="error-message" id="passwordFormatError" style="display: none;">비밀번호는 영어 대문자, 소문자, 숫자, 특수문자를 모두 포함하여 최소 8자 이상이어야 합니다.</div><br>
    
    <label for="passwordConfirm">비밀번호 확인:</label>
    <input type="password" id="passwordConfirm" name="passwordConfirm" required><br>
    <div class="error-message" id="passwordMismatch" style="display: none;">비밀번호가 일치하지 않습니다.</div><br>
    
    <label for="nickname">닉네임:</label>
    <input type="text" id="nickname" name="nickname" required><br><br>
    
    <label for="name">이름:</label>
    <input type="text" id="name" name="name" required><br><br>
    
    <label for="email">이메일:</label>
    <input type="email" id="email" name="email" required><br><br>
    <button type="button" id="sendBtn" name="sendBtn">인증번호 전송</button>
    
    <label for="emailConfirm">인증번호</label>
    <input type="text" id="emailConfirm" name="emailConfirm" required><br>
    <button type="button" id="confirmBtn" name="confirmBtn">인증번호 확인</button>
    
    <label for="phone">전화번호:</label>
    <input type="text" id="phone" name="phone" required><br><br>
    <div class="error-message" id="phoneError" style="display: none;"></div><br>
    
    <input type="submit" id="submitButton" value="가입하기">
    
    <div class="error-message" id="errorMessage" style="display: none;"></div>
    
</form>

<!-- JavaScript -->
<script type="text/javascript">
    $(document).ready(function() {
        var isIdChecked = false; // 중복 확인 여부를 저장하는 변수
        var idPattern = /^[a-z0-9]{5,15}$/; // 아이디 유효성 검사 패턴
        var passwordPattern = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*])[a-zA-Z\d!@#$%^&*]{8,}$/;
        var emailVerified = false; // 이메일 인증 여부를 저장하는 변수

        $('#registerForm').submit(function(e) {
            e.preventDefault(); // 기본 이벤트 방지

            if (!isIdChecked) {
                alert('아이디 중복 확인을 해주세요.');
                return false; // 가입 요청 중단
            }

            if (!emailVerified) {
                alert('이메일 인증을 완료해주세요.');
                return false; // 가입 요청 중단
            }

            var memberId = $('#memberId').val();
            if (!idPattern.test(memberId)) {
                $('#idFormatError').show();
                return false; // 가입 요청 중단
            } else {
                $('#idFormatError').hide();
            }

            var password = $('#password').val();
            var passwordConfirm = $('#passwordConfirm').val();
            
            if (!passwordPattern.test(password)) {
                $('#passwordFormatError').show();
                return false; // 가입 요청 중단
            } else {
                $('#passwordFormatError').hide();
            }
            
            if (password !== passwordConfirm) {
                $('#passwordMismatch').show();
                return false; // 가입 요청 중단
            }

            $('#passwordMismatch').hide();

            // 폼 데이터를 직렬화하여 변수에 저장
            var formData = $(this).serialize();

            // Ajax를 사용하여 회원 가입 요청 전송
            $.ajax({
                url: 'register',
                type: 'post',
                data: formData,
                success: function(response) {
                    // 가입이 성공적으로 완료되었을 때 로그인 페이지로 리디렉션
                    alert('회원 가입이 완료되었습니다.');
                    window.location.href = 'login'; // 로그인 페이지로 리디렉션
                },
                error: function(xhr, status, error) {
                    // 오류가 발생했을 때 처리
                    $('#errorMessage').text('회원 가입 중 오류가 발생하였습니다.').show();
                }
            });

            return false; // 폼 제출 중단
        });
        
        // 비밀번호 확인 실시간 체크
        $('#password, #passwordConfirm').on('keyup', function () {
            if ($('#password').val() === $('#passwordConfirm').val()) {
                $('#passwordMismatch').hide();
            } else {
                $('#passwordMismatch').show();
            }
        });

        // 아이디 중복 확인
        $('#checkId').click(function() {
            var memberId = $('#memberId').val();
            
            if (!memberId) {
                $('#idError').show();
                $('#idExist').hide();
                $('#idAvailable').hide();
                return;
            } else if (!idPattern.test(memberId)) {
                $('#idFormatError').show();
                $('#idError').hide();
                $('#idExist').hide();
                $('#idAvailable').hide();
                return;
            } else {
                $('#idError').hide();
                $('#idFormatError').hide();
                $.ajax({
                    url: 'checkId',
                    type: 'post',
                    data: { memberId: memberId },
                    success: function(result) {
                        if (result != null) {
                            if (result == 1) {
                                $('#idExist').show();
                                $('#idAvailable').hide();
                                isIdChecked = false; // 중복된 아이디
                            } else {
                                $('#idExist').hide();
                                $('#idAvailable').show();
                                isIdChecked = true; // 사용 가능한 아이디
                            }
                        } else {
                            $('#idError').show();
                            $('#idExist').hide();
                            $('#idAvailable').hide();
                            isIdChecked = false; // 오류 발생
                        }
                    },
                    error: function(xhr, status, error) {
                        $('#idError').text('아이디 확인 중 오류가 발생하였습니다.').show();
                        $('#idExist').hide();
                        $('#idAvailable').hide();
                        isIdChecked = false; // 오류 발생
                    }
                });
            }
        });

        // 아이디 입력 필드의 입력 이벤트 핸들러 추가
        $('#memberId').on('input', function() {
            $('#idError').hide();
            $('#idExist').hide();
            $('#idAvailable').hide();
            $('#idFormatError').hide();
            isIdChecked = false; // 아이디가 변경되면 중복 확인 상태 초기화
        });

        // 전화번호 유효성 검사
        $('#phone').on('blur', function() {
            var phone = $(this).val();
            var regex = /^[0-9]{10,15}$/;

            if (!regex.test(phone)) {
                $('#phoneError').text('전화번호는 숫자로만 구성되어 있으며, 10자에서 15자 사이여야 합니다.').show();
            } else {
                $('#phoneError').hide();
            }
        });
        
        var confirmNumber;
        
        // 이메일 인증 번호 전송
        $('#sendBtn').click(function() {
            var email = $('#email').val();
            if (email === "") {
                alert("이메일을 입력해주세요.");
                return;
            }

            $.ajax({
                url: 'sendConfirmNumber',
                type: 'post',
                data: { email: email },
                success: function(data) {
                    if (data.status === "success") {
                        confirmNumber = data.confirmNumber;
                        alert("인증번호가 전송되었습니다.");
                    } else if (data.status === "exists") {
                        alert("인증번호 전송에 실패했습니다. 이미 존재하는 이메일입니다.");
                    }
                },
                error: function(xhr, status, error) {
                    console.error("Error:", status, error);
                    alert("인증번호 전송 중 오류가 발생했습니다. 다시 시도해주세요.");
                }
            });
        });

        // 이메일 인증 번호 확인
        $('#confirmBtn').click(function() {
            var emailConfirm = parseInt($('#emailConfirm').val());
            console.log("입력된 인증번호:", emailConfirm);
            console.log("서버에서 받은 인증번호:", confirmNumber);
            if (emailConfirm === confirmNumber) {
                emailVerified = true;
                alert("이메일 확인이 완료되었습니다.");
            } else {
                alert("인증 번호가 틀렸습니다.");
            }
        });
    });
</script>


</body>
</html>

