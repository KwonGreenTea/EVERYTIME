<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에브리타임</title>

<link rel="stylesheet" href="https://everytime.kr/css/common.css" />
<link rel="stylesheet"
   href="https://everytime.kr/css/common.partial.css" />
<link rel="stylesheet"
   href="https://everytime.kr/css/container.article.css" />
<link rel="stylesheet"
   href="https://everytime.kr/css/container.community.css" />
<link rel="stylesheet"
   href="https://everytime.kr/css/container.modal.css" />
<link rel="stylesheet" href="resources/css/mainCommon.css" />
<link rel="stylesheet" href="resources/css/mainCommon.partial.css" />
<link rel="stylesheet" href="resources/css/container.community.css" />
<script type="text/javascript" src="resources/js/friend.js"></script>
</head>
<body>

   <!--주석 썻따고 ^^ -->
   <%@ include file="../header.jspf"%>
   <div id="submenu">
      <div class="wrap">
         <div class="divider"></div>
         <div class="group">
            <ul>
               <li><a href="post/post_list?boardId=1" class="new">자유게시판</a></li>
               <li><a href="post/post_list?boardId=2" class="new">비밀게시판</a></li>
               <li><a href="post/post_list?boardId=3" class="new">졸업생게시판</a></li>
               <li><a href="post/post_list?boardId=4" class="new">새내기게시판</a></li>
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

   <div id="container" class="community">
      <aside class="none">
         <form class="search">
            <input type="search" name="keyword" class="text"
               placeholder="전체 게시판의 글을 검색하세요!">

         </form>
         <div class="title">
            <a class="hamburger"></a>
            <h1>한양대 ERICA캠 에브리타임</h1>
            <ol class="buttons">
               <li><a id="searchArticle">글 검색</a></li>
            </ol>
         </div>
      </aside>
      <div class="leftside">
         <div class="card pconly">
            <form class="logged">
               <img src="${imgSource}" class="picture">
               <p class="nickname">${registerVO.nickname }</p>
               <p class="school">${registerVO.name }</p>
               <p class="school">${registerVO.email }</p>
               <ul class="buttons">
                  <li><a href="mypage">내 정보</a></li>
                  <li><a href="logout">로그아웃</a></li>
               </ul>
               <hr>
            </form>
         </div>
         <div class="card">
            <div class="menus">
               <a href="/myarticle" class="myarticle">내가 쓴 글</a> <a
                  href="/mycommentarticle" class="mycommentarticle">댓글 단 글</a> <a
                  href="myscrap" class="myscrap">내 스크랩</a>
               <hr>
            </div>
         </div>
      </div>
      <div class="rightside">
         <form action="post/search/all" method="POST" class="search">
            <input type="text" name="keyword" placeholder="전체 게시판의 글을 검색하세요!"
               class="text">
         </form>
         <div class="card">
            <div class="board">
               <h3>
                  <a href="/hotarticle">HOT 게시물<span>더 보기</span></a>
               </h3>
               <a class="list" href="/370449/v/348440683"><time>07/08
                     23:09</time>
                  <p>1X학번 특</p>
                  <hr></a><a class="list" href="/370449/v/348543099"><time>07/10
                     12:34</time>
                  <p>오늘 날씨 진짜 좋당</p>
                  <hr></a><a class="list" href="/370449/v/348439380"><time>07/08
                     22:54</time>
                  <p>근데 진짜로 다 조용히 하면 안되냐</p>
                  <hr></a><a class="list" href="/370449/v/348354416"><time>07/07
                     20:28</time>
                  <p>셔틀버스 레전드 ㅋㅋ</p>
                  <hr></a>
            </div>
         </div>
         <div class="card">
            <div class="board">
               <h3>
                  <a href="/bestarticle">BEST 게시판<span>더 보기</span></a>
               </h3>
            </div>
         </div>
         <div class="card">
            <div class="board">
               <h3>
                  <a href="/lecture">최근 강의평<span>더 보기</span></a>
               </h3>
               <a class="article" href="/lecture/view/137944"><span
                  class="star"><span class="on" style="width: 20%;"></span></span>
                  <p class="title">미분적분학2 : 박상웅</p>
                  <p class="small">일점도 아까운데 내 최악의 교수임 혼자 달리시는걸 엄청 좋아하심</p>
                  <hr></a><a class="article" href="/lecture/view/135695"><span
                  class="star"><span class="on" style="width: 80%;"></span></span>
                  <p class="title">기능성고분자 : 장영욱</p>
                  <p class="small">전반적인 고분자합성방법 응용 시제품적용 등 고분자쪽에서 다룰수 있는건 거의 다룸.
                     자료내용이 많지는 않아서 필기 열심히하몀 공부할때 도움많이됩니</p>
                  <hr></a><a class="article" href="/lecture/view/501949"><span
                  class="star"><span class="on" style="width: 100%;"></span></span>
                  <p class="title">무역업창업과마케팅 : 백상현</p>
                  <p class="small">출석 안보심. 무역 실무에 굉장한 전문가이시기 때문에 현실적인 조언이나 팁들을
                     전수받을 수 있음. 시험은 범위 알려주셔서 외우기만 하면 쉬운 편</p>
                  <hr></a>
            </div>
         </div>
      </div>
      <div class="banners">
         <a href="https://www.youtube.com/shorts/mZPkoLfdGQg">
         <img src="/web/resources/images/chuchu.png"></a>
      </div>
      <div class="main">
         <div class="card">
            <div class="board">
               <h3>
                  <a href="post/post_list?boardId=1">자유게시판</a>
               </h3>
               <c:forEach var="postVO" items="${postListNum1 }" begin="0" end="3">
                  <a class="list"
                     href="/web/post/detail?boardId=${postVO.boardId }&postId=${postVO.postId}">
                     <time id="createdTime">${postVO.postCreatedDate }</time>
                     <p>${postVO.postTitle }</p>
                     <hr>
                  </a>
               </c:forEach>
            </div>
         </div>

         <div class="card">
            <div class="board">
               <h3>
                  <a href="post/post_list?boardId=2">비밀게시판</a>
               </h3>
               <c:forEach var="postVO" items="${postListNum2 }" begin="0" end="3">
                  <a class="list"
                     href="/web/post/detail?boardId=${postVO.boardId }&postId=${postVO.postId}"><time
                        id="createdTime">${postVO.postCreatedDate }</time>
                     <p>${postVO.postTitle }</p>
                     <hr></a>
               </c:forEach>
            </div>
         </div>
         <div class="card">
            <div class="board">
               <h3>
                  <a href="post/post_list?boardId=3">졸업생게시판</a>
               </h3>
               <c:forEach var="postVO" items="${postListNum3 }" begin="0" end="3">
                  <a class="list"
                     href="/web/post/detail?boardId=${postVO.boardId }&postId=${postVO.postId}"><time
                        id="createdTime">${postVO.postCreatedDate }</time>
                     <p>${postVO.postTitle }</p>
                     <hr></a>
               </c:forEach>
            </div>
         </div>
         <div class="card">
            <div class="board">
               <h3>
                  <a href="post/post_list?boardId=4">새내기게시판</a>
               </h3>
               <c:forEach var="postVO" items="${postListNum4 }" begin="0" end="3">
                  <a class="list"
                     href="/web/post/detail?boardId=${postVO.boardId }&postId=${postVO.postId}"><time
                        id="createdTime">${postVO.postCreatedDate }</time>
                     <p>${postVO.postTitle }</p>
                     <hr></a>
               </c:forEach>
            </div>
         </div>



      </div>
   </div>


   <hr>
</body>
</html>