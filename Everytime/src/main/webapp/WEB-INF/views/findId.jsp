<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>아이디 찾기</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
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
                        } else {
                            alert("올바르지 않은 이메일 형식으로 가입된 아이디입니다. [문의하기]를 통해 별도 문의 바랍니다.");
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
</body>
</html>