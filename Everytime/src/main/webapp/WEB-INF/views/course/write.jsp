<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>

<style>
/* 텍스트 영역의 너비와 높이를 지정 */
textarea {
	width: 480px;
	height: 201px;
}
</style>
<script src="https://code.jquery.com/jquery-3.7.1.js">
	
</script>


<script type="text/javascript">
	
</script>

</head>
<body>
	<h1>설문조사</h1>
	<form action="write" method="POST">
		<div>
			<input type="hidden" name="courseId" value="${courseVO.courseId }"
				>
		</div>
		<div>
			<input type="hidden" name="professor" value="${courseVO.professor}"
				>
		</div>

		<div class="rate">
			<div class="stars">
				<span class="star on"></span> <span class="star"></span> <span
					class="star"></span> <span class="star"></span> <span class="star"></span>
			</div>
		</div>

		<div class="text">
			<textarea placeholder="이 강의에 대한 총평을 작성해주세요" name="review" required></textarea>
		</div>

		<div class="item">
			<span class="title">언제 수강했나요?</span> <select name="semester"
				class="type-box" required>
				<option value="">수강학기선택</option>
				<option value="2024년 2학기">2024년2학기</option>
				<option value="semester">2023년 1학기</option>
			</select>

		</div>


		<div class="item" >
			<span class="title">과제가 많은가요?</span>
			<div class="buttons" >
				<label class="button"> <input type="radio" name="project"
					id="2" value="2"  required > <span>많음</span>
				</label> <label class="button"> <input type="radio" name="project"
					id="1" value="1"  required> <span>보통</span>
				</label> <label class="button"> <input type="radio" name="project"
					id="0" value="0"  required> <span>없음</span>
				</label>
			</div>
		</div>

		<div class="item">
			<span class="title">조모임이 많은가요</span>
			<div class="buttons">
				<label class="button"> <input type="radio" name="group"
					id="2" value="2"  required> <span>많음</span>
				</label> <label class="button"> <input type="radio" name="group"
					id="1" value="1"  required> <span>보통</span>
				</label> <label class="button"> <input type="radio" name="group"
					id="0" value="0"  required> <span>없음</span>
				</label>
			</div>
		</div>

		<div class="item">
			<span class="title">성적은 어떻게 주시나요?</span>
			<div class="buttons">
				<label class="button"> <input type="radio" name="grade"
					id="2" value="2"  required> <span>너그러움</span>
				</label> <label class="button"> <input type="radio" name="grade"
					id="1" value="1"  required> <span>보통</span>
				</label> <label class="button"> <input type="radio" name="grade"
					id="0" value="0"  required> <span>깐깐함</span>
				</label>
			</div>
		</div>


		<div class="item">
			<span class="title">출석은 어떻게 확인하나요??</span>
			<div class="buttons">
				<label class="button"> <input type="radio" name="attend"
					id="4" value="4"  required> <span>복합적</span>
				</label> <label class="button"> <input type="radio" name="attend"
					id="3" value="3"  required> <span>직접호명</span>
				</label> <label class="button"> <input type="radio" name="attend"
					id="2" value="2"  required> <span>지정좌석</span>
				</label> <label class="button"> <input type="radio" name="attend"
					id="1" value="1"  required> <span>전자출결</span>
				</label> <label class="button"> <input type="radio" name="attend"
					id="0" value="0"  required> <span>반영안함</span>
				</label>

			</div>
		</div>

		<div class="item">
			<span class="title">시험은 몇 번 보나요?</span>
			<div class="buttons">
				<label class="button"> <input type="radio" name="exam"
					id="4" value="4"  required> <span>네 번 이상</span>
				</label> <label class="button"> <input type="radio" name="exam"
					id="3" value="3"  required> <span>세 번</span>
				</label> <label class="button"> <input type="radio" name="exam"
					id="2" value="2"  required> <span>두 번</span>
				</label> <label class="button"> <input type="radio" name="exam"
					id="1" value="1"  required> <span>한 번</span>
				</label> <label class="button"> <input type="radio" name="exam"
					id="0" value="0"  required> <span>없음</span>
				</label>

			</div>
		</div>

		<input type="submit" value="평가하기">
	</form>

</body>
</html>
