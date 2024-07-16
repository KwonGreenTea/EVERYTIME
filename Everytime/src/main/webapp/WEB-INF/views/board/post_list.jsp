<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에브리타임</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<link rel="stylesheet" href="https://everytime.kr/css/common.css" />
<link rel="stylesheet"
	href="https://everytime.kr/css/common.partial.css" />
<link rel="stylesheet"
	href="https://everytime.kr/css/container.article.css" />
<link rel="stylesheet"
	href="https://everytime.kr/css/container.community.css" />
<link rel="stylesheet"
	href="https://everytime.kr/css/container.modal.css" />

</head>
<style>
#thumbnails {
	display: none;
	list-style: none;
	padding: 0;
}

#thumbnails .thumbnail {
	display: inline-block;
	margin: 5px;
}

#thumbnails .thumbnail img {
	width: 85px;
	height: 85px;
}
</style>
<body>
	<%@ include file="../header.jspf"%>

	<div id="submenu">
		<div class="wrap">
			<div class="divider"></div>
			<div class="group">
				<ul>
					<li><a href="../post/post_list?boardId=1" class="new">자유게시판</a></li>
					<li><a href="../post/post_list?boardId=2" class="new">비밀게시판</a></li>
					<li><a href="../post/post_list?boardId=3" class="new">졸업생게시판</a></li>
					<li><a href="../post/post_list?boardId=4" class="new">새내기게시판</a></li>
				</ul>
			</div>
			<div class="group">
				<ul>
				</ul>
			</div>
			<div class="divider"></div>
			<div class="group">
				<ul>
				</ul>
			</div>
			<div class="divider"></div>
			<div class="group">
				<ul>
				</ul>
			</div>
			<div class="divider"></div>
			<div class="group">
				<ul>
				</ul>
			</div>
			<div class="group">
				<ul>
					<li><a href="/community/search" class="search">게시판 찾기</a></li>
				</ul>
			</div>
			<div class="divider"></div>
			<hr>
		</div>
		<input type="hidden" id="communityCampusId" value="23">
	</div>

	<div id="container" class="article">
		<input type="hidden" id="isUser" value="1"> <input
			type="hidden" id="boardId" value="370449">
		<aside class="none">
			<div class="title">
				<a class="hamburger"></a>
				<h1>
					<a href="/370449">자유게시판</a>
				</h1>
			</div>
		</aside>
		<div class="rightside">
			<div class="card">
				<div class="board">
					<h3>
						<a href="../post/hotpost">HOT 게시물<span>더 보기</span></a>
					</h3>
					<c:forEach var="postVO" items="${hotPostList }" begin="0" end="3">
						<a class="list"
							href="/web/post/detail?boardId=${postVO.boardId }&postId=${postVO.postId}">
							<time>${postVO.postCreatedDate }</time>
							<p>${postVO.postTitle }</p>
							<hr>
						</a>
					</c:forEach>
				</div>
			</div>
			<div class="card">
				<div class="board">
					<h3>
						<a href="../lecture">최근 강의평<span>더 보기</span></a>
					</h3>

					<c:forEach var="reviewVO" items="${reviewList }" begin="0" end="2">
						<a class="article" href="../view?courseId=${reviewVO.courseId}">
							<span class="star"> <span class="on"
								style="width :${20 * reviewVO.courseRate}%;"> </span>
						</span>
							<p class="title">${reviewVO.courseName }:
								${reviewVO.professor }</p>
							<p class="small">${reviewVO.reviewContent }</p>
							<hr>
						</a>
					</c:forEach>
				</div>
			</div>
		</div>
		<div class="wrap title">
			<h1>
				<c:choose>
					<c:when test="${boardId == 1}">
						<a href="../post/post_list?boardId=1">자유게시판</a>
					</c:when>
					<c:when test="${boardId == 2}">
						<a href="../post/post_list?boardId=2">비밀게시판</a>
					</c:when>
					<c:when test="${boardId == 3}">
						<a href="../post/post_list?boardId=3">졸업생게시판</a>
					</c:when>
					<c:when test="${boardId == 4}">
						<a href="../post/post_list?boardId=3">새내기게시판</a>
					</c:when>
				</c:choose>
			</h1>
			<hr>
		</div>
		<div class="wrap notification none"></div>
		<div class="wrap bubbles none">
			<div class="bubble question">
				<div class="group"></div>
				<div class="items">
					<div class="item">
						<a href="/370449/v/343043794"><span>질문</span></a>
					</div>
				</div>
			</div>
			<div class="bubble popular">
				<div class="group"></div>
				<div class="item">
					<a href="/370449/v/343054561"><span>인기 게시물</span>
						<div class="posvote">50</div></a>
				</div>
			</div>
		</div>

		<!-- 게시물 등록 -->

		<div class="wrap articles">
			<a id="writeArticleButton">새 글을 작성해주세요!</a>
			<form id="write" action="create" method="post" class="write"
				style="display: none" enctype="multipart/form-data">
				<input type="hidden" name="boardId" id="boardId" value="1">
				<input type="hidden" name="memberId" value="${memberId}">

				<p>
					<input name="postTitle" autocomplete="off" placeholder="글 제목"
						class="title">
				</p>
				<p>
					<textarea name="postContent" placeholder="글 내용"
						class="smallplaceholder"></textarea>
				</p>

				<input class="file" type="file" id="attachBoardFile" name="imgFiles"
					style="display: none;" multiple="multiple"
					data-gtm-form-interact-field-id="0"
					onchange="handleFileSelect(event)">
				<ol class="thumbnails" id="thumbnails" style="display: none;"></ol>

				<ul class="option">
					<li title="첨부" class="attach" id="attachBoard"></li>
					<li title="완료" class="submit" id="submitBtn"></li>
					<li title="익명" class="anonym"><br> <input type="checkbox"
						name="PostAnonymous" value="1"><a> 익명</a></li>
				</ul>
				<div class="clearBothOnly"></div>
			</form>
		</div>

		<!-- 게시물 목록 -->
		<div class="wrap articles">
			<c:forEach var="postVO" items="${postList}">
				<article class="list">
					<a class="article"
						href="/web/post/detail?boardId=${boardId }&postId=${postVO.postId}">
						<div class="desc">
							<h2 class="medium bold">${postVO.postTitle}</h2>
							<p class="medium">${postVO.postContent}</p>
							<div class="info">
								<ul class="status">
									<li title="댓글" class="comment">1</li>
									<!-- 댓글 개수 -->
								</ul>
								<time class="small">
									<fmt:formatDate value="${postVO.postCreatedDate}"
										pattern="MM/dd" />
									<!-- 작성 날짜 -->
								</time>
								<c:choose>
									<c:when test="${postVO.postAnonymous == 0}">
										<h3 class="small">${nickname }</h3>
									</c:when>
									<c:when test="${postVO.postAnonymous == 1}">
										<h3 class="small">익명</h3>
									</c:when>
								</c:choose>
							</div>
							<hr>
						</div> <c:choose>
							<c:when test="${not empty postImgList}">
								<c:forEach var="img" items="${postImgList}">
									<c:if test="${postVO.postId == img.postId}">
										<div class="attachthumbnail"
											style="background-image: url('<c:url value="../${img.imgSource}" />');">
										</div>
									</c:if>
								</c:forEach>
							</c:when>
						</c:choose>
					</a>
					<div class="comments"></div>
				</article>
			</c:forEach>
		</div>


		<!-- 게시물 목록 끝 -->
		<!-- div class="clearBothOnly"></div-->
		<div class="wrap ">
			<div class="pagination">
				<form id="searchArticleForm" class="search">
					<select name="search_type"><option value="4">전체</option>
						<option value="2">글 제목</option>
						<option value="1">글 내용</option></select><input name="keyword"
						placeholder="검색어를 입력하세요." class="text">
				</form>
				<a href="" class="next">다음</a>
			</div>
		</div>
	</div>

	<script type="text/javascript">
      function handleFileSelect(event) {
           const files = event.target.files;
           const allowedExtensions = ['.jpg', '.jpeg', '.png'];
   
           const imgPreview = document.getElementById('thumbnails');
           imgPreview.innerHTML = ''; 
           imgPreview.style.display = 'none'; 
   
           for (let file of files) {
               const fileExtension = file.name.slice(((file.name.lastIndexOf(".") - 1) >>> 0) + 2).toLowerCase();
               if (allowedExtensions.includes('.' + fileExtension)) {
                   let maxSize = 5 * 1024 * 1024; // 5 MB 
                   if (file.size < maxSize) {
                       imgPreview.style.display = "block";
                       const reader = new FileReader();
                       reader.onload = function(e) {
                           const li = document.createElement('li');
                           li.className = 'thumbnail attached';
                           const img = document.createElement('img');
                           img.src = e.target.result;
                           li.appendChild(img);
                           imgPreview.appendChild(li);
                       };
                       reader.readAsDataURL(file);
                   } else {
                       alert("파일 크기가 너무 큽니다. 최대 크기는 5MB입니다.");
                   }
               } else {
                   alert('허용되지 않는 파일 형식입니다.');
               }
           }
       }
      
   
      $(document).ready(function() {
         $('#attachBoard').click(function() {
            $('#attachBoardFile').click();
         });
       
           $(document).on('click', '#thumbnails .thumbnail img', function() {
               if(confirm("첨부된 이미지를 삭제할까요?")) {
                   $(this).closest('li').remove();
               }
               
               if ($('#thumbnails li').length === 0) {
                    $('#thumbnails').hide();
                }
           });
           
           $('#submitBtn').click(function(event) {
                event.preventDefault();
                const fileInput = document.getElementById('attachBoardFile');
                const files = fileInput.files;
                
                console.log("Files length:", files.length); 
                console.log("Files:", files); 

                if (files.length > 0) {
                    const formData = new FormData();
                    for (let i = 0; i < files.length; i++) {
                        formData.append('imgFiles', files[i]);
                    }
                    
                    $.ajax({
                        url: '../imgUploads',
                        type: 'POST',
                        data: formData,
                        processData: false,
                        contentType: false,
                        success: function(result) {
                            $('#write').submit();
                        },
                        error: function(xhr, status, error) {
                            alert("첨부된 이미지에서 문제가 발생했습니다.");
                        }
                    });
                } else {
                    $('#write').submit(); 
                }
            });
       });
      </script>

	<script type="text/javascript">
         $(document).ready(function() {
            $("#writeArticleButton").click(function() {
               $("#write").show();
            });
         });
      </script>

</body>
</html>