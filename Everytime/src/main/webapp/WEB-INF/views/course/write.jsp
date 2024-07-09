<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>


<link rel="stylesheet" href="https://everytime.kr/css/common.css" />
<link rel="stylesheet"
	href="https://everytime.kr/css/common.partial.css" />
<link rel="stylesheet"
	href="https://everytime.kr/css/container.article.css" />
<link rel="stylesheet"
	href="https://everytime.kr/css/container.community.css" />
<link rel="stylesheet"
	href="https://everytime.kr/css/container.modal.css" />

<link rel="stylesheet" type="text/css" href="resources/css/write4a.css">
<link rel="stylesheet" type="text/css" href="resources/css/write8d.css">
<link rel="stylesheet" type="text/css" href="resources/css/writeb3.css">
<script src="https://code.jquery.com/jquery-3.7.1.js">
	
</script>


<script type="text/javascript">
	
</script>

</head>
<body>
	<div data-v-38263efc>
	
	<%@ include file="../header.jspf"%>
	
	
		<form data-v-570e2290 data-v-38263efc class="container" action = "write" method = "POST">



			<input type="hidden" name="courseId" value="${courseVO.courseId }">

			<input type="hidden" name="courseName"
				value="${courseVO.courseName }"> <input type="hidden"
				name="professor" value="${courseVO.professor}">


			<div  data-v-38263efc class="rate">
				<div data-v-38263efc class="stars">
					<span data-v-38263efc class ="star"></span>
					<span data-v-38263efc class ="star"></span>
					<span data-v-38263efc class ="star"></span>
					<span data-v-38263efc class ="star"></span>
					<span data-v-38263efc class ="star"></span>
						
					<input type="hidden" name="courseRate" id="courseRate" value="0">
				</div>
				
				<span data-v-38263efc="" class="text" id="starCount">0 / 5</span>
				
			</div>
			

			<div data-v-38263efc="" class="text">
				<textarea data-v-38263efc="" placeholder="이 강의에 대한 총평을 작성해주세요." name = "reviewContent"></textarea>
			</div>

			<div data-v-38263efc="" class="items">
				<div data-v-38263efc="" class="item">
					<span data-v-38263efc="" class="title">언제 수강했나요?</span> <select
						data-v-38263efc="" class="menu" name="semester">
						<option value="" disabled selected>수강 학기 선택</option>
						<option value="2024년 2학기">2024년 2학기</option>
						<option value="2023년 1학기">2023년 1학기</option>
					</select>
				</div>



				<div data-v-38263efc="" class="item">
					<span data-v-38263efc="" class="title">과제가 많은가요?</span>
					<div data-v-38263efc="" class="buttons">
						<label data-v-38263efc="" class="button"> <input
							data-v-38263efc="" type="radio" value="2" name="project">
							<span data-v-38263efc="">많음</span></label><label data-v-38263efc=""
							class="button"><input data-v-38263efc="" type="radio"
							value="1" name="project"> <span data-v-38263efc="">보통</span></label><label
							data-v-38263efc="" class="button"><input
							data-v-38263efc="" type="radio" value="0" name="project">
							<span data-v-38263efc="">없음</span></label>
					</div>
				</div>
				<div data-v-38263efc="" class="item">
					<span data-v-38263efc="" class="title">조모임이 많은가요?</span>
					<div data-v-38263efc="" class="buttons">
						<label data-v-38263efc="" class="button"><input
							data-v-38263efc="" type="radio" value="2" name="team"> <span
							data-v-38263efc="">많음</span></label><label data-v-38263efc=""
							class="button"><input data-v-38263efc="" type="radio"
							value="1" name="team"> <span data-v-38263efc="">보통</span></label><label
							data-v-38263efc="" class="button"><input
							data-v-38263efc="" type="radio" value="0" name="team"> <span
							data-v-38263efc="">없음</span></label>
					</div>
				</div>
				<div data-v-38263efc="" class="item">
					<span data-v-38263efc="" class="title">성적은 어떻게 주시나요?</span>
					<div data-v-38263efc="" class="buttons">
						<label data-v-38263efc="" class="button"><input
							data-v-38263efc="" type="radio" value="3" name="grade"> <span
							data-v-38263efc="">너그러움</span></label><label data-v-38263efc=""
							class="button"><input data-v-38263efc="" type="radio"
							value="2" name="grade"> <span data-v-38263efc="">보통</span></label><label
							data-v-38263efc="" class="button"><input
							data-v-38263efc="" type="radio" value="1" name="grade"> <span
							data-v-38263efc="">깐깐함</span></label>
					</div>
				</div>
				<div data-v-38263efc="" class="item">
					<span data-v-38263efc="" class="title">출석은 어떻게 확인하나요?</span>
					<div data-v-38263efc="" class="buttons">
						<label data-v-38263efc="" class="button"><input
							data-v-38263efc="" type="radio" value="4" name="attend">
							<span data-v-38263efc="">복합적</span></label><label data-v-38263efc=""
							class="button"><input data-v-38263efc="" type="radio"
							value="3" name="attend"> <span data-v-38263efc="">직접호명</span></label><label
							data-v-38263efc="" class="button"><input
							data-v-38263efc="" type="radio" value="2" name="attend">
							<span data-v-38263efc="">지정좌석</span></label><label data-v-38263efc=""
							class="button"><input data-v-38263efc="" type="radio"
							value="1" name="attend"> <span data-v-38263efc="">전자출결</span></label><label
							data-v-38263efc="" class="button"><input
							data-v-38263efc="" type="radio" value="0" name="attend">
							<span data-v-38263efc="">반영안함</span></label>
					</div>
				</div>
				<div data-v-38263efc="" class="item">
					<span data-v-38263efc="" class="title">시험은 몇 번 보나요?</span>
					<div data-v-38263efc="" class="buttons">
						<label data-v-38263efc="" class="button"><input
							data-v-38263efc="" type="radio" value="4" name="exam"> <span
							data-v-38263efc="">네 번 이상</span></label><label data-v-38263efc=""
							class="button"><input data-v-38263efc="" type="radio"
							value="3" name="exam"> <span data-v-38263efc="">세
								번</span></label><label data-v-38263efc="" class="button"><input
							data-v-38263efc="" type="radio" value="2" name="exam"> <span
							data-v-38263efc="">두 번</span></label><label data-v-38263efc=""
							class="button"><input data-v-38263efc="" type="radio"
							value="1" name="exam"> <span data-v-38263efc="">한
								번</span></label><label data-v-38263efc="" class="button"><input
							data-v-38263efc="" type="radio" value="0" name="exam"> <span
							data-v-38263efc="">없음</span></label>
					</div>
				</div>
			</div>
			<div data-v-38263efc="" class="notification">
				<p data-v-38263efc="">
					※ 강의평을 등록하면 <strong data-v-38263efc="">10 포인트</strong>가 적립됩니다.
				</p>
				<p data-v-38263efc="">
					※ <strong data-v-38263efc="">수정 및 삭제가 불가능</strong>하므로 신중히 작성해주세요.
				</p>
				<p data-v-38263efc="">※ 허위, 중복, 저작권 침해, 성의없는 내용을 작성할 경우, 서비스 이용이
					제한될 수 있습니다.</p>
			</div>

			<input data-v-38263efc="" type="submit" value="평가하기">



		</form>
	</div>

	<script type="text/javascript">
	
	
	const stars = document.querySelectorAll('.star');
	
	// starRate 요소 가져오기
	const starRate = document.getElementById('courseRate');
	
	const starCount = document.getElementById('starCount');
	
	// 각 별에 클릭 이벤트 추가
	for (let i = 0; i < stars.length; i++) {
	    stars[i].onclick = function() {
	        // 모든 별의 클래스를 지움
	        for (let j = 0; j < stars.length; j++) {
	            stars[j].classList.remove('on');
	        }
	        // 클릭한 별까지 클래스 추가
	        for (let j = 0; j <= i; j++) {
	            stars[j].classList.add('on');
	        }
	        
	        courseRate.value = i + 1;
	        
	        starCount.textContent = (i + 1) + " / 5"; 
	        
	        console.log(courseRate);
	       
	    }
	}
	
	
	
	
	
    document.addEventListener('DOMContentLoaded', function() {
        const form = document.querySelector('form');

        form.addEventListener('submit', function(event) {
            // 폼 제출 이벤트를 막기 위해 기본 동작을 취소
            event.preventDefault();

            // 각 항목의 값들을 가져옴
                const courseRate = document.getElementById('courseRate');
            const courseContent = document.querySelector('textarea[data-v-38263efc]');
            const semester = document.querySelector('select[name="semester"]');
            const project = document.querySelector('input[name="project"]:checked');
            const team = document.querySelector('input[name="team"]:checked');
            const grade = document.querySelector('input[name="grade"]:checked');
            const attend = document.querySelector('input[name="attend"]:checked');
            const exam = document.querySelector('input[name="exam"]:checked');

            // 각 항목에 대해 선택 여부를 확인하고, 선택되지 않았을 경우 알림 띄우기
             if (courseRate.value === '0') {
                alert('별점을 선택해주세요!');
                return;
            }
            if (courseContent.value.trim() === '') {
                alert('강의 평가 내용을 작성해주세요!');
                return;
            }
            if (!semester.value) {
                alert('언제 수강했나요? 항목을 선택해주세요!');
                return; // 선택되지 않은 항목이 있으면 폼 제출 중단
            }
            if (!project) {
                alert('과제가 많은가요? 항목을 선택해주세요!');
                return;
            }
            if (!team) {
                alert('조모임이 많은가요? 항목을 선택해주세요!');
                return;
            }
            if (!grade) {
                alert('성적은 어떻게 주시나요? 항목을 선택해주세요!');
                return;
            }
            if (!attend) {
                alert('출석은 어떻게 확인하나요? 항목을 선택해주세요!');
                return;
            }
            if (!exam) {
                alert('시험은 몇 번 보나요? 항목을 선택해주세요!');
                return;
            }

            // 선택된 항목들이 모두 있으면 폼을 제출
            form.submit();
        });
    });
</script>
	





</body>
</html>
