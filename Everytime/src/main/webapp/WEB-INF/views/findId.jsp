<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���̵� ã��</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<h2>���̵� ã��</h2>
        <form id="findId" method="post">
            <div class="form-group">
                <label for="email">�̸��� �ּ�</label>
                <input type="email" id="email" name="email" required>
            </div>
            <button type="button" id="findIdBtn" class="btn">���̵� ã��</button>
        </form>
        
        <script type="text/javascript">
        $(document).ready(function() {
            // ���̵� ã�� ��ư Ŭ�� �̺�Ʈ ó��
            $('#findIdBtn').click(function() {
                var email = $('#email').val(); // �̸��� �Է� �� ��������
                if (email === "") {
                    alert("�̸����� �Է����ּ���.");
                    return;
                }
                
                $.ajax({
                    url: 'findId',
                    type: 'POST',
                    data: { email: email },
                    success: function(data) {
                        if (data.status === "success") {
                            alert("�ȳ� �̸����� �߼��Ͽ����ϴ�. ���� ������ ���� �ʴ´ٸ�, ���� �������� Ȯ�����ּ���.");
                        } else {
                            alert("�ùٸ��� ���� �̸��� �������� ���Ե� ���̵��Դϴ�. [�����ϱ�]�� ���� ���� ���� �ٶ��ϴ�.");
                        }
                    },
                    error: function(xhr, status, error) {
                        console.log(email);
                        console.error("Error:", status, error);
                        alert("���� ���� �� ������ �߻��߽��ϴ�. �ٽ� �õ����ּ���.");
                    }
                });
            });
        });
    </script>
</body>
</html>