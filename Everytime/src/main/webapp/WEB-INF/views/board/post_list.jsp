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

<body>
	<%@ include file="../header.jspf"%>
	<div id="submenu">
		<div class="wrap">
			<div class="divider"></div>
			<div class="group">
				<ul>
					<li><a href="freeBoard" class="new">자유게시판</a></li>

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
		<div class="wrap title">
			<h1>
				<a href="/370449">자유게시판</a>
			</h1>
			<hr>
		</div>
		<div class="wrap notification none"></div>
		<div class="wrap bubbles">
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
			<form id="write" action="post/create" method="post" class="write"
				style="display: none">
				<input type="hidden" name="boardId" value="370449"> <input
					type="hidden" name="memberId" value="${RegisterVO.memberId}">

				<p>
					<input name="postTitle" autocomplete="off" placeholder="글 제목"
						class="title">
				</p>
				<p>
					<textarea name="postContent" placeholder="글 내용"
						class="smallplaceholder"></textarea>
				</p>

				<!-- 파일 첨부 -->
				<input class="file" type="file" id="attachBoardFile"
					style="display: none;" multiple="multiple"
					onchange="handleFileSelect(event)">
				<ol class="thumbnails" id="thumbnails" style="display: none;"></ol>

				<input type="hidden" name="postAnonymous" value="0">
				<ul class="option">
					<li title="첨부" class="attach" id="attachBoard"></li>
					<li title="완료" class="submit" id="submitBtn"></li>
					<li title="익명" class="anonym"><br> <input type="checkbox"
						name="PostAnonymous" value="1"><a> 익명</a></li>
				</ul>
				<div class="clearBothOnly"></div>
			</form>

		</div>

		<script type="text/javascript">
		 $('#attachBoard').click(function() {
		        document.getElementById('attachBoardFile').click();
		    });
		 

	        $(document).on('click', '#thumbnails .thumbnail img', function() {
	            if(confirm("첨부된 이미지를 삭제할까요?")) {
	                $(this).closest('li').remove();
	            }
	            
	            if ($('#thumbnails li').length === 0) {
                    $('#thumbnails').hide();
                }
	        });

	        function handleFileSelect(event) {
	            const files = event.target.files;
	            const allowedExtensions = ['.jpg', '.jpeg', '.png'];

	            for (let file of files) {
	                const fileExtension = file.name.slice(((file.name.lastIndexOf(".") - 1) >>> 0) + 2).toLowerCase();

	                if (allowedExtensions.includes('.' + fileExtension)) {
	                    let maxSize = 5 * 1024 * 1024; // 5 MB 
	                    if (file.size < maxSize) {
	                    	const imgPreview = document.getElementById('thumbnails');
	        	            imgPreview.style.display = "block";
	        	            
	                        const reader = new FileReader();
	                        reader.onload = function(e) {
	                            const li = document.createElement('li');
	                            li.className = 'thumbnail attached';
	                            const img = document.createElement('img');
	                            img.src = e.target.result;
	                            img.style.width = "85px";
	                            img.style.height = "85px";
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
	            event.target.value = '';
	        }
		</script>

		<!-- 게시물 목록 -->
		<div class="wrap articles">
			<c:forEach var="postVO" items="${postList}">
				<article class="list">
					<a class="article"
						href="/web/post/detail?boardId=1&postId=${postVO.postId}">
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
								<h3 class="small">익명</h3>
							</div>
							<hr />
						</div>

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

	<hr>
	<script type="text/javascript">
    $(document).ready(function() {
        $('#writeArticleButton').click(function() {
            $('#write').show();
        });

        $('#submitBtn').click(function(event) {
            event.preventDefault(); // 기본 폼 제출 동작 방지

            const fileInput = document.getElementById('attachBoardFile');
            const files = fileInput.files;

            if (files.length > 0) {
                const formData = new FormData();

                for (let i = 0; i < files.length; i++) {
                    formData.append('imgFiles[]', files[i]);
                }

                $.ajax({
                    url: 'imgUploads', // 이미지 업로드를 처리할 서버 URL
                    type: 'POST',
                    data: formData,
                    processData: false,
                    contentType: false,
                    success: function(result) {
                        // 이미지 업로드 성공 후 폼 제출
                        $('#write').off('submit').submit(); // 중복 제출 방지
                    },
                    error: function(xhr, status, error) {
                        alert("첨부된 이미지에서 문제가 발생했습니다.");
                    }
                });
            } else {
                // 이미지 파일이 없는 경우 폼을 바로 제출
                $('#write').submit();
            }
        });

        // `#write` 폼을 초기 숨김 상태로 설정
        $('#write').hide();
    });
</script>




</body>
</html>