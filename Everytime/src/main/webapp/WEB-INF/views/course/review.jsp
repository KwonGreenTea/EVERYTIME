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
<link rel="stylesheet" type="text/css" href="resources/css/view9b.css">

<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
</head>
<body>

	<%@ include file="../header.jspf"%>
	<div data-v-191ba81a="" class="container">
		<div data-v-191ba81a="" class="bottombar">
			<div data-v-191ba81a="" class="title">학술영어1:통합</div>
			<div data-v-191ba81a="" class="tabbar">
				<a data-v-191ba81a="" href="" class="item"><div
						data-v-191ba81a="" class="rectangle active">
						<figure data-v-191ba81a="" class="info"></figure>
						<span data-v-191ba81a="" class="title">개요</span>
					</div></a><a data-v-191ba81a="" href=""
					class="item"><div data-v-191ba81a="" class="rectangle">
						<figure data-v-191ba81a="" class="article"></figure>
						<span data-v-191ba81a="" class="title">강의평</span>
					</div></a><a data-v-191ba81a="" href=""
					class="item"><div data-v-191ba81a="" class="rectangle">
						<figure data-v-191ba81a="" class="exam"></figure>
						<span data-v-191ba81a="" class="title">시험 정보</span>
					</div></a>
			</div>
			<!---->
			<!---->
		</div>

		<c:set var="couseRateValueSum" value="0" />
		<c:set var="courseRate0Count" value="0" />
		<c:set var="courseRate1Count" value="0" />
		<c:set var="courseRate2Count" value="0" />
		<c:set var="courseRate3Count" value="0" />
		<c:set var="courseRate4Count" value="0" />
		<c:set var="courseRate5Count" value="0" />


		<c:forEach var="reviewVO" items="${reviewListByCourseId}">
			<c:set var="courseRateValueSum"
				value="${courseRateValueSum + reviewVO.courseRate}" />
			<c:choose>
				<c:when test="${reviewVO.courseRate eq 0}">
					<c:set var="courseRate0Count" value="${courseRate0Count + 1}" />
				</c:when>
				<c:when test="${reviewVO.courseRate eq 1}">
					<c:set var="courseRate1Count" value="${courseRate1Count + 1}" />
				</c:when>
				<c:when test="${reviewVO.courseRate eq 2}">
					<c:set var="courseRate2Count" value="${courseRate2Count + 1}" />
				</c:when>
				<c:when test="${reviewVO.courseRate eq 3}">
					<c:set var="courseRate3Count" value="${courseRate3Count + 1}" />
				</c:when>
				<c:when test="${reviewVO.courseRate eq 4}">
					<c:set var="courseRate4Count" value="${courseRate4Count + 1}" />
				</c:when>
				<c:when test="${reviewVO.courseRate eq 5}">
					<c:set var="courseRate5Count" value="${courseRate5Count + 1}" />
				</c:when>

			</c:choose>

		</c:forEach>

		<c:set var="courseRateSum"
			value="${courseRate0Count + courseRate1Count + courseRate2Count +courseRate3Count + courseRate4Count + courseRate5Count}" />
		<c:set var="average"
			value="${courseRateValueSum / reviewListByCourseId.size()}" />


		<div data-v-d5c5d8d6="" data-v-191ba81a="" class="pane">
			<div data-v-d5c5d8d6="" class="article_tab">
				<div data-v-d5c5d8d6="" class="header">
					<div data-v-d5c5d8d6="" class="average">
						<span data-v-d5c5d8d6="" class="title">${average}</span> <span
							data-v-d5c5d8d6="" class="star"><span data-v-d5c5d8d6=""
							class="on" style="width: ${average / 5 * 100}%;"></span></span>
					</div>
					<div data-v-d5c5d8d6="" class="buttons">
						<button data-v-d5c5d8d6="" class="">전체</button>
						<button data-v-d5c5d8d6="">등록순</button>
					</div>
				</div>


				<div data-v-d5c5d8d6="" class="articles">
					<c:forEach var="reviewVO" items="${reviewListByCourseId}">


						<div data-v-d5c5d8d6="" class="article">
							<div data-v-d5c5d8d6="" class="article_header">
								<div data-v-d5c5d8d6="" class="title">
									<div data-v-d5c5d8d6="" class="rate">
										<span data-v-d5c5d8d6="" class="star"><span
											data-v-d5c5d8d6="" class="on"
											style="width: ${20 * reviewVO.courseRate}%;"></span></span>
									</div>
									<div data-v-d5c5d8d6="" class="info">
										<span data-v-d5c5d8d6="" class="semester">
											${reviewVO.semester } </span> <span data-v-d5c5d8d6=""
											class="posvote" id="${reviewVO.reviewId}">
											${reviewVO.reviewLike} </span>
										<!---->
									</div>
								</div>
								<div data-v-d5c5d8d6="" class="buttons">
									<button data-v-d5c5d8d6="" class="posvote"
										data-review-id="${reviewVO.reviewId}">추천</button>
									<button data-v-d5c5d8d6="">신고</button>
								</div>
							</div>
							<div data-v-d5c5d8d6="" class="text">${reviewVO.reviewContent }</div>
						</div>
						<!---->
					</c:forEach>


				</div>
			</div>
			<!---->
			<!---->
		</div>
	</div>


	<script type="text/javascript">
		$(document).ready(function() {
			updateLikeVisibility();

			$(".posvote").click(function() {
				var reviewId = $(this).data('review-id'); // 클릭된 버튼의 data-review-id 값을 가져옴
				console.log(reviewId);
				if (confirm("이 강의평을 추천하시겠습니까?")) {
					addLike(reviewId); // reviewId를 파라미터로 넘겨 추천 함수 호출

				} else {
					// 취소 버튼을 클릭한 경우의 처리
				}
			});

			function addLike(reviewId) {
				var obj = {
					'reviewId' : reviewId
				};

				$.ajax({
					type : 'POST',
					url : 'reviewLike',
					headers : {
						'Content-Type' : 'application/json'
					},
					data : JSON.stringify(obj),
					success : function(result) {
						if (result == 1) {
							increaseLikeCount(reviewId);
							updateLikeVisibility();
							// 실제 추천 추가 코드

						} else {
							alert("이미 추천하였습니다.")
						}
					}
				}); // and ajax
			} // end addLike

			function increaseLikeCount(reviewId) {
				console.log(reviewId);
				var likeElement = $("#" + reviewId); // 추천 수를 표시하는 span 요소를 가져옴
				var currentLikes = parseInt(likeElement.text()); // 현재 추천 수를 가져와 정수로 변환

				// 추천 수를 1 증가시킴
				var newLikes = currentLikes + 1;
				likeElement.text(newLikes); // 업데이트된 추천 수를 화면에 표시

			}

			function updateLikeVisibility() {
				$('.posvote').each(function() {
					var likeCountText = $(this).text().trim();
					var likeCount = parseInt(likeCountText);

					if (likeCount === 0) {
						$(this).closest('span').hide(); // 가장 가까운 <span> 요소를 숨김
					} else {
						$(this).closest('span').show(); // 가장 가까운 <span> 요소를 보임
					}
				});
			}

		}); // end document
	</script>


</body>
</html>