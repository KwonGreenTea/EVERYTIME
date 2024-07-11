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
			<div data-v-191ba81a="" class="title">${courseVO.courseName}</div>
			<div data-v-191ba81a="" class="tabbar">
				<a data-v-191ba81a="" href="write?courseId=${courseVO.courseId}"
					id="item-link">
					<div class="item" data-v-191ba81a="">
						<div data-v-191ba81a="" class="rectangle">
							<figure data-v-191ba81a="" class="article"></figure>
							<span data-v-191ba81a="" class="title">강의 평가 하러 가기</span>
						</div>
					</div>
				</a>
			</div>
			<!---->
			<!---->
		</div>


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
		<c:set var="courseRate0Count" value="0" />
		<c:set var="courseRate1Count" value="0" />
		<c:set var="courseRate2Count" value="0" />
		<c:set var="courseRate3Count" value="0" />
		<c:set var="courseRate4Count" value="0" />
		<c:set var="courseRate5Count" value="0" />

		<div data-v-d5c5d8d6="" data-v-191ba81a="" class="pane">
			<div data-v-d5c5d8d6="" class="article_tab">
				<div data-v-d5c5d8d6="" class="header">
					<div data-v-d5c5d8d6="" class="average">
						<span data-v-d5c5d8d6="" class="title averageRate">${average}</span> <span
							data-v-d5c5d8d6="" class="star"><span data-v-d5c5d8d6=""
							class="on" style="width: ${average / 5 * 100}%;"></span></span>
					</div>
					<!-- <form action = "" method="POST">-->
					<div data-v-d5c5d8d6="" class="buttons">
						<button data-v-d5c5d8d6="" class="filter" id="allButton">전체</button>
						<button data-v-d5c5d8d6="" class="filter" id="orderButton">등록순</button>
					</div>
					<!-- </form>  -->
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
			<c:set var="reviewCount" value="${reviewListByCourseId.size()}" />
			<c:forEach var="reviewVO" items="${reviewListByCourseId}">
				<c:set var="number" value="${number + 1}" />
				<c:choose>
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
			<div id="menu1" data-v-03849084="" data-v-d5c5d8d6=""
				class="dialogmenu">
				<div data-v-03849084="" class="backdrop"></div>
				<div data-v-03849084="" class="wrap">
					<div data-v-03849084="" class="item">
						<div data-v-d5c5d8d6="" data-v-03849084=""
							class="menu_item sortButton" data-sort="earlist">
							<span data-v-d5c5d8d6="" data-v-03849084="" class="title">등록순</span>
						</div>
					</div>
					<div data-v-03849084="" class="item ">
						<div data-v-d5c5d8d6="" data-v-03849084=""
							class="menu_item sortButton" data-sort="topLike">
							<span data-v-d5c5d8d6="" data-v-03849084="" class="title">추천순</span>
						</div>
					</div>
				</div>
				<form id="sortForm" action="sortFilter" method="POST">
					<input type="hidden" name="courseId"
						value="${reviewListByCourseId.get(0).getCourseId() }"> <input
						type="hidden" id="sortValue" name="sortCondition">
				</form>

			</div>

			<div id="menu2" data-v-03849084="" data-v-d5c5d8d6=""
				class="dialogmenu">
				<div data-v-03849084="" class="backdrop"></div>
				<div data-v-03849084="" class="wrap">
					<div data-v-03849084="" class="item">
						<div data-v-d5c5d8d6="" data-v-03849084=""
							class="menu_item rate_filter rateButton" data-rate="0">
							<span data-v-d5c5d8d6="" data-v-03849084="" class="title">전체</span>
							<span data-v-d5c5d8d6="" data-v-03849084="" class="count">(${reviewCount })</span>
						</div>
					</div>
					<div data-v-03849084="" class="item">
						<div data-v-d5c5d8d6="" data-v-03849084=""
							class="menu_item rate_filter rateButton" data-rate="5">
							<span data-v-d5c5d8d6="" data-v-03849084="" class="title rate">5</span>
							<span data-v-d5c5d8d6="" data-v-03849084="" class="count">(${courseRate5Count })</span>
						</div>
					</div>
					<div data-v-03849084="" class="item">
						<div data-v-d5c5d8d6="" data-v-03849084=""
							class="menu_item rate_filter rateButton" data-rate="4">
							<span data-v-d5c5d8d6="" data-v-03849084="" class="title rate">4</span>
							<span data-v-d5c5d8d6="" data-v-03849084="" class="count">(${courseRate4Count })</span>
						</div>
					</div>
					<div data-v-03849084="" class="item">
						<div data-v-d5c5d8d6="" data-v-03849084=""
							class="menu_item rate_filter rateButton" data-rate="3">
							<span data-v-d5c5d8d6="" data-v-03849084="" class="title rate">3</span>
							<span data-v-d5c5d8d6="" data-v-03849084="" class="count">(${courseRate3Count })</span>
						</div>
					</div>
					<div data-v-03849084="" class="item">
						<div data-v-d5c5d8d6="" data-v-03849084=""
							class="menu_item rate_filter rateButton" data-rate="2">
							<span data-v-d5c5d8d6="" data-v-03849084="" class="title rate">2</span>
							<span data-v-d5c5d8d6="" data-v-03849084="" class="count">(${courseRate2Count})</span>
						</div>
					</div>
					<div data-v-03849084="" class="item">
						<div data-v-d5c5d8d6="" data-v-03849084=""
							class="menu_item rate_filter rateButton" data-rate="1">
							<span data-v-d5c5d8d6="" data-v-03849084="" class="title rate">1</span>
							<span data-v-d5c5d8d6="" data-v-03849084="" class="count">(${courseRate1Count })</span>
						</div>
					</div>
				</div>
				<form id="rateForm" action="rateFilter" method="POST">
					<input type="hidden" name="courseId"
						value="${reviewListByCourseId.get(0).getCourseId() }"> <input
						type="hidden" id="rateValue" name="courseRate">
				</form>
			</div>

		</div>
	</div>




	<script type="text/javascript">
		$(document).ready(function() {
			updateLikeVisibility();

			$('.rateButton').click(function() {
				console.log("hi")
				var courseRate = $(this).data('rate'); // data-rate 속성에서 평가 값을 가져옴
				console.log(courseRate);
				$('#rateValue').val(courseRate); // hidden input에 평가 값을 설정
				$('#rateForm').submit(); // 평가 값이 설정된 form을 서버로 제출
			});

			$('.sortButton').click(function() {
				console.log("sort")
				var sortCondition = $(this).data('sort'); // data-rate 속성에서 평가 값을 가져옴
				console.log(sortCondition);
				$('#sortValue').val(sortCondition); // hidden input에 평가 값을 설정
				$('#sortForm').submit(); // 평가 값이 설정된 form을 서버로 제출
			});

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

			function increaseLikeCount(reviewId) { // 추천 1개 증가시키기
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

			var allButton = $('#allButton');
			var orderButton = $('#orderButton');
			var menu1 = $('#menu1');
			var menu2 = $('#menu2');

			// 초기 로드 시 menu1과 menu2를 숨깁니다
			menu1.hide();
			menu2.hide();

			// 모든 메뉴를 숨기는 함수
			function hideMenus() {
				menu1.hide();
				menu2.hide();
			}

			// 전체 버튼을 클릭했을 때
			allButton.click(function(event) {
				event.stopPropagation(); // 이벤트 전파 막기
				hideMenus(); // 모든 메뉴 숨기기
				// 버튼의 위치를 가져와서 menu2의 wrap 요소 위치를 설정합니다
				var buttonPosition = allButton.offset();
				menu2.find('.wrap').css({
					'left' : buttonPosition.left,
					'top' : buttonPosition.top + allButton.outerHeight()
				});
				menu2.show(); // menu2 표시
			});

			orderButton.click(function(event) {
				event.stopPropagation(); // 이벤트 전파 막기
				hideMenus(); // 모든 메뉴 숨기기
				// 버튼의 위치를 가져와서 menu1의 wrap 요소 위치를 설정합니다
				var buttonPosition = orderButton.offset();
				menu1.find('.wrap').css({
					'left' : buttonPosition.left,
					'top' : buttonPosition.top + orderButton.outerHeight()
				});
				menu1.show(); // menu1 표시
			});

			// 문서 전체를 클릭했을 때
			$(document).click(function() {
				hideMenus(); // 모든 메뉴를 숨김
			});

		}); // end document
	</script>
	<script type="text/javascript">
		window.onload = function() {
			console.log("페이지업로드");
			var errorMessage = "${errorMessage}";
			if (errorMessage) {
				alert(errorMessage); // 또는 다른 방식으로 에러 메시지를 표시할 수 있습니다.
			}
		};
	</script>

	<script type="text/javascript">
		document.querySelectorAll(".averageRate").forEach(function(avg) {
			avg.textContent = parseFloat(avg.textContent).toFixed(1);
		});
	</script>

</body>
</html>