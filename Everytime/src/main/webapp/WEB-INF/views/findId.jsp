<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���̵� ã��</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" type="text/css" href="resources/css/login11a.css">
<link rel="stylesheet" type="text/css" href="resources/css/login75.css">
<link rel="stylesheet" type="text/css" href="resources/css/findId96.css">
</head>
<body>



	<div data-v-60803e18="">
		<div data-v-60803e18="" class="container">
			<section data-v-60803e18="">
				<div data-v-60803e18="" class="menu">
					<a data-v-60803e18="" class="active"><span data-v-60803e18="">���̵�
							ã��</span></a>
				</div>
				<form data-v-60803e18="" id="findId" method="post">
					<input data-v-60803e18="" id = "email" name = "email" type="email" placeholder="���Ե� �̸���"
						autocomplete="off" required> <input data-v-60803e18=""
						type="submit" id = "findIdBtn" value="���̵� ã��">
					<div data-v-60803e18="" class="description">
						<p data-v-60803e18="">�� ���Ե� ���̵� ���� ���, �Է��Ͻ� �̸��Ϸ� ���̵� �ȳ���
							�帳�ϴ�.</p>
						<p data-v-60803e18="">�� ���� �̸����� ���� �ʴ´ٸ�, ���� ���������� �̵����� �ʾҴ���
							Ȯ�����ּ���.</p>
						<p data-v-60803e18="">�� �̸��� ���� ������ ������ ���� ��� �������� ���� �� ������,
							�ִ� 30�� ���� ��ٸ��� �� �ٽ� �õ����ּ���.</p>
					</div>
				</form>
			</section>
		</div>
	</div>





	<script type="text/javascript">
		$(document)
				.ready(
						function() {
							// ���̵� ã�� ��ư Ŭ�� �̺�Ʈ ó��
							$('#findIdBtn')
									.click(
											function() {
												var email = $('#email').val(); // �̸��� �Է� �� ��������
												if (email === "") {
													alert("�̸����� �Է����ּ���.");
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
																	alert("�ȳ� �̸����� �߼��Ͽ����ϴ�. ���� ������ ���� �ʴ´ٸ�, ���� �������� Ȯ�����ּ���.");
																} else {
																	alert("�ùٸ��� ���� �̸��� �������� ���Ե� ���̵��Դϴ�. [�����ϱ�]�� ���� ���� ���� �ٶ��ϴ�.");
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
																alert("���� ���� �� ������ �߻��߽��ϴ�. �ٽ� �õ����ּ���.");
															}
														});
											});
						});
	</script>
</body>
</html>