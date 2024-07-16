<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="https://everytime.kr/css/common.css" />
<link rel="stylesheet"
	href="https://everytime.kr/css/common.partial.css" />
<link rel="stylesheet"
	href="https://everytime.kr/css/container.article.css" />
<link rel="stylesheet"
	href="https://everytime.kr/css/container.community.css" />
<link rel="stylesheet"
	href="https://everytime.kr/css/container.modal.css" />

<link rel="stylesheet" type="text/css" href="resources/css/view4a.css">
<link rel="stylesheet" type="text/css" href="resources/css/view8d.css">
<link rel="stylesheet" type="text/css" href="resources/css/searchba.css">
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
</head>
<body>

	<%@ include file="../header.jspf"%>


	<div data-v-4713bb84>
		<div data-v-4713bb84 class="container">
			<div data-v-4713bb84="" class="header">

				<input id="keyword-data" data-keyword="${keyword }" type="hidden"></input>
				<input id="type-data" data-type="${type }" type="hidden"></input>
				<form data-v-4713bb84="" class="searchbar"
					data-gtm-form-interact-id="0" action="search" method="GET">
					<input data-v-4713bb84="" type="search"
						data-gtm-form-interact-field-id="0" name="keyword"> <input
						id="typeInput" value="courseName" name="type" type=hidden>
					<input data-v-4713bb84="" type="submit" class="submit">
				</form>

				<div data-v-4713bb84="" class="filters">
					<div data-v-4713bb84="" class="categories">
						<label data-v-4713bb84=""> 
						<input data-v-4713bb84=""
							value="courseName" type="radio" name="type" checked> 
							<span
							data-v-4713bb84="" class="icon"></span> 
							<span data-v-4713bb84=""
							class="title">과목명</span>
						</label> 
							
							<label data-v-4713bb84=""> 
							<input
							data-v-4713bb84="" value="professor" type="radio" name="type">
							<span data-v-4713bb84="" class="icon"></span> 
							<span
							data-v-4713bb84="" class="title">교수명</span>
						</label>
					</div>

				</div>
			</div>


			<div data-v-4713bb84 class="lectures">
				<c:if test="${empty courseList}">
					<div data-v-4713bb84="" class="alert">
						<p data-v-4713bb84="" class="primary noresult">검색된 강의가 없습니다</p>
					</div>
				</c:if>
				<c:forEach var="courseVO" items="${courseList}">
					<a href="view?courseId=${courseVO.courseId}" class="article-link">
						<div data-v-4713bb84="" href="" class="lecture">
							<div data-v-4713bb84="" class="name">
								<span class="highlight">${courseVO.courseName}</span>
							</div>
							<div data-v-4713bb84="" class="professor">${courseVO.professor}</div>
							<div data-v-4713bb84="" class="rate">
								<span data-v-4713bb84="" class="star"><span
									data-v-4713bb84="" class="on"
									style="width :${20 * courseVO.courseRate}%;"></span></span>
							</div>
						</div>
					</a>
				</c:forEach>


			</div>

		</div>

	</div>

	<script type="text/javascript">
		$(document).ready(function() {
			const keyword = $('#keyword-data').data('keyword');

			console.log(keyword);
			// input 상자에 keyword를 넣어줌
			$('input[name="keyword"]').val(keyword);

			$('input[name="type"]').on('change', function() {
				// 선택된 라디오 버튼의 값(value)을 가져와서 변수에 저장
				var selectedType = $('input[name="type"]:checked').val();
				console.log(selectedType);
				// 숨겨진(type) 입력 필드의 값을 선택된 라디오 버튼의 값으로 설정
				$('#typeInput').val(selectedType);
			});

			
			 const type = $('#type-data').data('type');

			    // 모든 라디오 버튼 요소들을 선택
			    $('input[name="type"]').each(function() {
			      // 현재 라디오 버튼의 값 가져오기
			      const value = $(this).val();

			      // data-type 속성과 현재 라디오 버튼의 값이 일치하면 체크 처리
			      if (value === type) {
			        $(this).prop('checked', true); // 체크 처리
			      } else {
			        $(this).prop('checked', false); // 체크 해제
			      }
			    });
			
		}); // end document
	</script>



</body>
</html>