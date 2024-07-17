<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>강의별 개요, 강의평, 시험정보</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.7.1.js">
	
</script>

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


</head>
<body>
	<%@ include file="../header.jspf"%>

	<c:set var="couseRateValueSum" value="0" />
	<c:set var="courseRate0Count" value="0" />
	<c:set var="courseRate1Count" value="0" />
	<c:set var="courseRate2Count" value="0" />
	<c:set var="courseRate3Count" value="0" />
	<c:set var="courseRate4Count" value="0" />
	<c:set var="courseRate5Count" value="0" />


	<c:set var="project0Count" value="0" />
	<c:set var="project1Count" value="0" />
	<c:set var="project2Count" value="0" />

	<c:set var="team0Count" value="0" />
	<c:set var="team1Count" value="0" />
	<c:set var="team2Count" value="0" />

	<c:set var="grade0Count" value="0" />
	<c:set var="grade1Count" value="0" />
	<c:set var="grade2Count" value="0" />

	<c:set var="attend0Count" value="0" />
	<c:set var="attend1Count" value="0" />
	<c:set var="attend2Count" value="0" />
	<c:set var="attend3Count" value="0" />
	<c:set var="attend4Count" value="0" />

	<c:set var="exam0Count" value="0" />
	<c:set var="exam1Count" value="0" />
	<c:set var="exam2Count" value="0" />
	<c:set var="exam3Count" value="0" />
	<c:set var="exam4Count" value="0" />



	<c:forEach var="reviewVO" items="${reviewListByCourseId}">

		<!-- courseRate 카운트 -->

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


		<!-- project 카운트 -->
		<c:choose>
			<c:when test="${reviewVO.project eq 0}">
				<c:set var="project0Count" value="${project0Count + 1}" />
			</c:when>
			<c:when test="${reviewVO.project eq 1}">
				<c:set var="project1Count" value="${project1Count + 1}" />
			</c:when>
			<c:when test="${reviewVO.project eq 2}">
				<c:set var="project2Count" value="${project2Count + 1}" />
			</c:when>

		</c:choose>

		<!-- team 카운트 -->
		<c:choose>
			<c:when test="${reviewVO.team eq 0}">
				<c:set var="team0Count" value="${team0Count + 1}" />
			</c:when>
			<c:when test="${reviewVO.team eq 1}">
				<c:set var="team1Count" value="${team1Count + 1}" />
			</c:when>
			<c:when test="${reviewVO.team eq 2}">
				<c:set var="team2Count" value="${team2Count + 1}" />
			</c:when>

		</c:choose>

		<!-- grade 카운트 -->
		<c:choose>
			<c:when test="${reviewVO.grade eq 0}">
				<c:set var="grade0Count" value="${grade0Count + 1}" />
			</c:when>
			<c:when test="${reviewVO.grade eq 1}">
				<c:set var="grade1Count" value="${grade1Count + 1}" />
			</c:when>
			<c:when test="${reviewVO.grade eq 2}">
				<c:set var="grade2Count" value="${grade2Count + 1}" />
			</c:when>

		</c:choose>

		<!-- attend 카운트 -->
		<c:choose>
			<c:when test="${reviewVO.attend eq 0}">
				<c:set var="attend1Count" value="${attend0Count + 1}" />
			</c:when>
			<c:when test="${reviewVO.attend eq 1}">
				<c:set var="attend1Count" value="${attend1Count + 1}" />
			</c:when>
			<c:when test="${reviewVO.attend eq 2}">
				<c:set var="attend2Count" value="${attend2Count + 1}" />
			</c:when>
			<c:when test="${reviewVO.attend eq 3}">
				<c:set var="attend3Count" value="${attend3Count + 1}" />
			</c:when>
			<c:when test="${reviewVO.attend eq 4}">
				<c:set var="attend4Count" value="${attend4Count + 1}" />
			</c:when>
		</c:choose>

		<!-- exam 카운트 -->
		<c:choose>
			<c:when test="${reviewVO.exam eq 0}">
				<c:set var="exam0Count" value="${exam0Count + 1}" />
			</c:when>
			<c:when test="${reviewVO.exam eq 1}">
				<c:set var="exam1Count" value="${exam1Count + 1}" />
			</c:when>
			<c:when test="${reviewVO.exam eq 2}">
				<c:set var="exam2Count" value="${exam2Count + 1}" />
			</c:when>
			<c:when test="${reviewVO.exam eq 3}">
				<c:set var="exam3Count" value="${exam3Count + 1}" />
			</c:when>
			<c:when test="${reviewVO.exam eq 4}">
				<c:set var="exam4Count" value="${exam4Count + 1}" />
			</c:when>
		</c:choose>

	</c:forEach>

	<!-- Calculate sums -->
	<c:set var="courseRateSum"
		value="${courseRate0Count + courseRate1Count + courseRate2Count +courseRate3Count + courseRate4Count + courseRate5Count}" />
	<c:set var="projectSum"
		value="${project0Count + project1Count + project2Count}" />
	<c:set var="teamSum" value="${team0Count + team1Count + team2Count}" />
	<c:set var="gradeSum"
		value="${grade0Count + grade1Count + grade2Count}" />
	<c:set var="attendSum"
		value="${attend0Count + attend1Count + attend2Count + attend3Count + attend4Count}" />
	<c:set var="examSum"
		value="${exam0Count + exam1Count + exam2Count + exam3Count + exam4Count}" />

	<c:set var="average"
		value="${courseRateValueSum / reviewListByCourseId.size()}" />
	<c:set var="reviewCount" value="${reviewListByCourseId.size()}" />


	<div data-v-191ba81a class="container">
		<div data-v-191ba81a="" class="bottombar">
			<div data-v-191ba81a="" class="title">${courseVO.courseName}</div>
			<div data-v-191ba81a="" class="tabbar">
				<a data-v-191ba81a="" href="" id="item-link">
					<div>
						<div class="item" data-v-191ba81a="">
							<div data-v-191ba81a="" class="rectangle active">
								<figure data-v-191ba81a="" class="info"></figure>
								<span data-v-191ba81a="" class="title">개요</span>
							</div>
						</div>
					</div>
				</a> <a data-v-191ba81a="" href="write?courseId=${courseVO.courseId}"
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
		<div data-v-cb953552 data-v-191ba81a class="pane">
			<div data-v-cb953552 class="info_tab">

				<section data-v-cb953552="" class="info">
					<div data-v-cb953552="" class="item">
						<label data-v-cb953552="">과목명</label>
						<div data-v-cb953552="" class="link">
							<span data-v-cb953552="">${courseVO.courseName}</span>
							<figure data-v-cb953552="" class="arrow"></figure>
						</div>

						<figure data-v-cb953552="" class="arrow">
						</figure>

					</div>
					<div data-v-cb953552="" class="item">
						<label data-v-cb953552="">교수명</label>
						<div data-v-cb953552="" class="multiline">
							<div data-v-cb953552="" class="link">
								<span data-v-cb953552="">${courseVO.professor }</span>
								<figure data-v-cb953552="" class="arrow"></figure>
							</div>
						</div>
					</div>
					<div data-v-cb953552="" class="item">
						<label data-v-cb953552="">캠퍼스</label> <span data-v-cb953552=""
							class="text">ERICA캠퍼스</span>
					</div>
				</section>
				<c:if test="${empty reviewListByCourseId and empty topLikeReviewList}">
					<section data-v-cb953552="" class="empty review" style="order: 1;">
						<div data-v-cb953552="" class="title">
							<span data-v-cb953552="" class="average">0</span> <span
								data-v-cb953552="" class="star"></span> <span data-v-cb953552=""
								class="count"> (0개) </span>
						</div>
						<p data-v-cb953552="" class="text">아직 등록된 강의평이 없습니다.</p>
						<a data-v-cb953552=""
							href="write?courseId=${courseVO.courseId}" class="button">
							강의평 등록하기 </a>
					</section>
				</c:if>
				<c:if test="${!empty reviewListByCourseId or !empty topLikeReviewList}">
				<section data-v-cb953552="" class="review" style="order: 1;">
					<div data-v-cb953552="" class="rating">
						<div data-v-cb953552="" class="title">
							<span data-v-cb953552="" class="average">${average}</span> <span
								data-v-cb953552="" class="star"><span data-v-cb953552=""
								class="on" style="width: ${average / 5 * 100}%;"></span></span> <span
								data-v-cb953552="" class="count"> (${reviewCount}개) </span>
						</div>
						<div data-v-cb953552="" class="rates">
							<div data-v-cb953552="" class="rate">
								<span data-v-cb953552="" class="value winner"> 5 </span>
								<div data-v-cb953552="" class="bar">
									<div data-v-cb953552="" class="gauge"
										style="width: ${courseRate5Count / courseRateSum * 100}%;"></div>
								</div>
								<div data-v-cb953552="" class="vote part">${courseRate5Count / courseRateSum * 100}%</div>
							</div>
							<div data-v-cb953552="" class="rate">
								<span data-v-cb953552="" class="value"> 4 </span>
								<div data-v-cb953552="" class="bar">
									<div data-v-cb953552="" class="gauge"
										style="width: ${courseRate4Count / courseRateSum * 100}%;"></div>
								</div>
								<div data-v-cb953552="" class="vote part">${courseRate4Count / courseRateSum * 100}%</div>
							</div>
							<div data-v-cb953552="" class="rate">
								<span data-v-cb953552="" class="value"> 3 </span>
								<div data-v-cb953552="" class="bar">
									<div data-v-cb953552="" class="gauge"
										style="width: ${courseRate3Count / courseRateSum * 100}%;"></div>
								</div>
								<div data-v-cb953552="" class="vote part">${courseRate3Count / courseRateSum * 100}%</div>
							</div>
							<div data-v-cb953552="" class="rate">
								<span data-v-cb953552="" class="value"> 2 </span>
								<div data-v-cb953552="" class="bar">
									<div data-v-cb953552="" class="gauge"
										style="width: ${courseRate2Count / courseRateSum * 100}%;"></div>
								</div>
								<div data-v-cb953552="" class="vote part">${courseRate2Count / courseRateSum * 100}%</div>
							</div>
							<div data-v-cb953552="" class="rate">
								<span data-v-cb953552="" class="value"> 1 </span>
								<div data-v-cb953552="" class="bar">
									<div data-v-cb953552="" class="gauge"
										style="width: ${courseRate1Count / courseRateSum * 100}%;"></div>
								</div>
								<div data-v-cb953552="" class="vote part">${courseRate1Count / courseRateSum * 100}%</div>
							</div>
						</div>
					</div>
					<div data-v-cb953552="" class="assessment">
						<div data-v-cb953552="" class="detail subjective">
							<h3 data-v-cb953552="">과제</h3>
							<div data-v-cb953552="" class="items">
								<div data-v-cb953552="" class="item">
									<div data-v-cb953552="" class="bar">
										<div data-v-cb953552="" class="winner positive gauge "
											style="width: ${project0Count / projectSum * 100}%;">
											<span data-v-cb953552="" class="winner "> 없음 </span>
										</div>
									</div>
									<div data-v-cb953552="" class="winner positive vote part ">
										${project0Count / projectSum * 100}%</div>

								</div>
								<div data-v-cb953552="" class="item">
									<div data-v-cb953552="" class="bar">
										<div data-v-cb953552="" class="neutral gauge"
											style="width: ${project1Count / projectSum * 100}%;">
											<span data-v-cb953552="" class=""> 보통 </span>
										</div>
									</div>
									<div data-v-cb953552="" class="neutral vote part">${project1Count / projectSum * 100}%</div>
								</div>
								<div data-v-cb953552="" class="item">
									<div data-v-cb953552="" class="bar">
										<div data-v-cb953552="" class="negative gauge"
											style="width: ${project2Count / projectSum * 100}%;">
											<span data-v-cb953552="" class=""> 많음 </span>
										</div>
									</div>
									<div data-v-cb953552="" class="negative vote part">${project2Count / projectSum * 100}%</div>
								</div>
							</div>
						</div>
						<div data-v-cb953552="" class="detail subjective">
							<h3 data-v-cb953552="">조모임</h3>
							<div data-v-cb953552="" class="items">
								<div data-v-cb953552="" class="item">
									<div data-v-cb953552="" class="bar">
										<div data-v-cb953552="" class="winner positive gauge"
											style="width: ${team0Count / teamSum * 100}%;">
											<span data-v-cb953552="" class="winner"> 없음 </span>
										</div>
									</div>
									<div data-v-cb953552="" class="winner positive vote part">
										${team0Count / teamSum * 100}%</div>
								</div>
								<div data-v-cb953552="" class="item">
									<div data-v-cb953552="" class="bar">
										<div data-v-cb953552="" class="neutral gauge"
											style="width: ${team1Count / teamSum * 100}%;">
											<span data-v-cb953552="" class=""> 보통 </span>
										</div>
									</div>
									<div data-v-cb953552="" class="neutral vote part">${team1Count / teamSum * 100}%</div>
								</div>
								<div data-v-cb953552="" class="item">
									<div data-v-cb953552="" class="bar">
										<div data-v-cb953552="" class="negative gauge"
											style="width: ${team2Count / teamSum * 100}%;">
											<span data-v-cb953552="" class=""> 많음 </span>
										</div>
									</div>
									<div data-v-cb953552="" class="negative vote part">${team2Count / teamSum * 100}%</div>
								</div>
							</div>
						</div>
						<div data-v-cb953552="" class="detail subjective">
							<h3 data-v-cb953552="">성적</h3>
							<div data-v-cb953552="" class="items">
								<div data-v-cb953552="" class="item">
									<div data-v-cb953552="" class="bar">
										<div data-v-cb953552="" class="winner positive gauge"
											style="width: ${grade0Count / gradeSum * 100}%;">
											<span data-v-cb953552="" class="winner"> 너그러움 </span>
										</div>
									</div>
									<div data-v-cb953552="" class="winner positive vote part">
										${grade0Count / gradeSum * 100}%</div>
								</div>
								<div data-v-cb953552="" class="item">
									<div data-v-cb953552="" class="bar">
										<div data-v-cb953552="" class="neutral gauge"
											style="width:  ${grade1Count / gradeSum * 100}%;">
											<span data-v-cb953552="" class=""> 보통 </span>
										</div>
									</div>
									<div data-v-cb953552="" class="neutral vote part">
										${grade1Count / gradeSum * 100}%</div>
								</div>
								<div data-v-cb953552="" class="item">
									<div data-v-cb953552="" class="bar">
										<div data-v-cb953552="" class="negative gauge "
											style="width:  ${grade2Count / gradeSum * 100}%;">
											<span data-v-cb953552="" class=""> 깐깐함 </span>
										</div>
									</div>
									<div data-v-cb953552="" class="negative vote part">
										${grade2Count / gradeSum * 100}%</div>
								</div>
							</div>
						</div>
						<div data-v-cb953552="" class="detail objective">
							<h3 data-v-cb953552="">출결</h3>
							<div data-v-cb953552="" class="options">
								<span data-v-cb953552="" class="majority"> 전자출결 </span><span
									data-v-cb953552="" class=""> 복합적 </span>
							</div>
						</div>
						<div data-v-cb953552="" class="detail objective">
							<h3 data-v-cb953552="">시험</h3>
							<div data-v-cb953552="" class="options">
								<span data-v-cb953552="" class="majority"> 두 번 </span>
							</div>
						</div>
					</div>

					<hr data-v-cb953552="" class="divider">


					<div data-v-cb953552="" class="articles">
						<c:forEach var="reviewVO" items="${topLikeReviewList}">
							<div data-v-cb953552="" class="article">
								<div data-v-cb953552="" class="rate">
									<span data-v-cb953552="" class="star"> <span
										data-v-cb953552="" class="on"
										style="width:${reviewVO.courseRate / 5 * 100}%;"></span>
									</span>
								</div>
								<div data-v-cb953552="" class="info">
									<span data-v-cb953552="" class="semester">
										${reviewVO.semester}</span> <span data-v-cb953552="" class="posvote"
										id="${reviewVO.reviewId}"> ${reviewVO.reviewLike} </span>
								</div>
								<div data-v-cb953552="" class="text">${reviewVO.reviewContent }</div>
							</div>
						</c:forEach>
						<a data-v-cb953552="" href="review?courseId=${courseVO.courseId}"
							class="more"> 강의 평 더보기 </a> <a data-v-cb953552=""
							href="write?courseId=${courseVO.courseId}" class="more"> 강의
							평가 하러 가기 </a>

					</div>

				</section>
				</c:if>
			</div>
		</div>
	</div>


	<script type="text/javascript">
		$(document).ready(function() {
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

	<script>
		// 모든 .vote 요소를 찾아서 정수로 변환하기
		document.querySelectorAll(".part").forEach(function(vote) {
			vote.textContent = Math.floor(parseFloat(vote.textContent)) + "%";
		});

		document.querySelectorAll(".average").forEach(function(avg) {
			avg.textContent = parseFloat(avg.textContent).toFixed(1);
		});
	</script>



</body>
</html>
