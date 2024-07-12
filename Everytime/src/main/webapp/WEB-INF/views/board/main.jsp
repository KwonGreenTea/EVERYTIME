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
<link rel="stylesheet" href="resources/css/mainCommon.css" />
<link rel="stylesheet" href="resources/css/mainCommon.partial.css" />
<link rel="stylesheet" href="resources/css/container.community.css" />
	<script type="text/javascript" src="resources/js/friend.js"></script>
</head>
<body>

<!--주석 썻따고 ^^ -->
<%@ include file="../header.jspf" %>
	<div id="submenu">
		<div class="wrap">
			<div class="divider"></div>
			<div class="group">
				<ul>
					<li><a href="/board/post_list" class="new">자유게시판</a></li>

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
					<img src="https://cf-fpi.everytime.kr/0.png" class="picture">
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
						href="/myscrap" class="myscrap">내 스크랩</a>
					<hr>
				</div>
			</div>
			<div class="card">
				<div class="banner">
					<a
						href="https://ad.everytime.kr/adClick?adToken=5yoAUXr%2FgDBd0urnlhyNkrCAFMn6nmV6Xqd2HkOXuHyO9KyptvKWyRXB0pvPhrXZNq9OgNhbHJIYPdU7YlCEfNUraHk26EXIHk6fPeykM76axisGZieadMdOoY4EqYkGGj0czdssNtBDd%2BeXdqxun8mbyWmIKUcI7O%2BMzF%2FJ5pm41kXD5S7XWRrfTAK19QCCbDcq%2B0tlKhyc2ME3h4XB1i1o9vjqG4ErllMMYVUqceyeOwKTeuLLT%2B7juiHRIs4S"><img
						src="https://cf-eba.everytime.kr/20240703_NHR_Micogroup_card.jpg"></a>
				</div>
			</div>
			<div class="card">
				<div class="banner">
					<a
						href="https://ad.everytime.kr/adClick?adToken=5yoAUXr%2FgDBd0urnlhyNkrCAFMn6nmV6Xqd2HkOXuHyO9KyptvKWyRXB0pvPhrXZNq9OgNhbHJIYPdU7YlCEfNUraHk26EXIHk6fPeykM76axisGZieadMdOoY4EqYkGGj0czdssNtBDd%2BeXdqxun8mbyWmIKUcI7O%2BMzF%2FJ5pkyPbxYxy4glavp0JaGTRVPnOhgpK59tkdHeBAQjOHnY1D74g3GvFSxRmNDkpyQRGNv3mLNOcHh9IbgKyCx6BwD"><img
						src="https://cf-eba.everytime.kr/20240711_cp_edu_alpha_card.png"></a>
				</div>
			</div>
			<div class="card">
				<div class="banner">
					<a
						href="https://ad.everytime.kr/adClick?adToken=5yoAUXr%2FgDBd0urnlhyNkrCAFMn6nmV6Xqd2HkOXuHyO9KyptvKWyRXB0pvPhrXZNq9OgNhbHJIYPdU7YlCEfNUraHk26EXIHk6fPeykM76axisGZieadMdOoY4EqYkGGj0czdssNtBDd%2BeXdqxun8mbyWmIKUcI7O%2BMzF%2FJ5pl2JcoC7U%2FeMes0SaPMjnSQQ6h5MimxNudq5W5%2B9v6jLq%2FI2JqR%2B0M76FuZr2OIImXYXrbnHsG00jfC7GwMUvW6"><img
						src="https://cf-eba.everytime.kr/20240708_seastartup_card.png"></a>
				</div>
			</div>
		</div>
		<div class="rightside">
			<form class="search">
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
			<a
				href="https://ad.everytime.kr/adClick?adToken=DqA51qXsalDWZJacHdIiemM3%2BS3kv%2FCCjFDRw0MF9us%2FFdn3r5TAPtJxfj7A%2BCu2%2B%2Beq%2F9%2Fknsq2bgzKIijZt%2FnxtfIDJ%2Be5BhjoMNZsZAEOgrRf%2B1TCMO26veuhP2UUmjFlSNYM3YYd45%2F%2BHiPVmbV70Q5qy5EvCCWz3W0F5PamUu3CxDPJjbPBhCXLnAASMWoHdpDA1VpBJWjIaQqfZdkqmp1mM1%2Fg4TcE4rvCgnAf6y20Bm4dGzrO%2F9GR7DLO"><img
				src="https://cf-eba.everytime.kr/20240703_WEST_July_B_home.jpg"></a>
		</div>
		<div class="main">
			<div class="card">
				<div class="board">
					<h3>
						<a href="post/post_list?boardId=1">자유게시판</a>
					</h3>
					<c:forEach var="postVO" items="${postList1 }"  begin="0" end="3" >
						<a class="list" href="/370449/v/348629493"><time id = "createdTime">${postVO.postCreatedDate }</time>
						<p>${postVO.postTitle }</p>
						<hr>
					</c:forEach>
					

				</div>
			</div>
			<div class="card">
				<div class="board">
					<h3>
						<a href="/255746">비밀게시판</a>
					</h3>
					<a class="list" href="/255746/v/348629108"><time>28분 전</time>
						<p>꿈에 전남친나옴</p>
						<hr></a><a class="list" href="/255746/v/348625031"><time>07/11
							15:41</time>
						<p>보톡으로 성향얘기 할여자</p>
						<hr></a><a class="list" href="/255746/v/348619419"><time>07/11
							14:13</time>
						<p>이거 adhd려나</p>
						<hr></a><a class="list" href="/255746/v/348617242"><time>07/11
							13:36</time>
						<p>드라이브 갈 여자??</p>
						<hr></a>
				</div>
			</div>
			<div class="card">
				<div class="board">
					<h3>
						<a href="/385960">졸업생게시판</a>
					</h3>
					<a class="list" href="/385960/v/348619826"><time>07/11
							14:20</time>
						<p>16학번중에 취업못한 사람</p>
						<hr></a><a class="list" href="/385960/v/348585380"><time>07/10
							23:34</time>
						<p>전수환 공기업경영학 개념심화 결제해서 같이 들으실분 구합니다!!</p>
						<hr></a><a class="list" href="/385960/v/348572041"><time>07/10
							20:34</time>
						<p>취업계 관련 질문</p>
						<hr></a><a class="list" href="/385960/v/348567762"><time>07/10
							19:25</time>
						<p>취창업 지원센터에서 하는</p>
						<hr></a>
				</div>
			</div>
			<div class="card">
				<div class="board">
					<h3>
						<a href="/369479">새내기게시판</a>
					</h3>
					<a class="list" href="/369479/v/348564256"><time>07/10
							18:25</time>
						<p>남자 창의관 6개월</p>
						<hr></a><a class="list" href="/369479/v/348555220"><time>07/10
							15:59</time>
						<p>교환학생 영어 시험 지금 준비 시작하면</p>
						<hr></a><a class="list" href="/369479/v/348518958"><time>07/10
							00:24</time>
						<p>행복관 남자 4개월</p>
						<hr></a><a class="list" href="/369479/v/348517364"><time>07/10
							00:07</time>
						<p>반수</p>
						<hr></a>
				</div>
			</div>
			<div class="card">
				<div class="board">
					<h3>
						<a href="/482564">시사·이슈</a>
					</h3>
					<a class="list" href="/482564/v/348414685"><time>07/08
							17:09</time>
						<p>전공의들 기계적 법집행 면허정지 때린다며</p>
						<hr></a><a class="list" href="/482564/v/348337326"><time>07/07
							15:48</time>
						<p>근데 진짜 궁금한점</p>
						<hr></a><a class="list" href="/482564/v/348285541"><time>07/06
							19:45</time>
						<p>젤렌스키, 영토 포기 관련 인터뷰</p>
						<hr></a><a class="list" href="/482564/v/348180447"><time>07/05
							08:08</time>
						<p>채상병특검 수사대상 전문</p>
						<hr></a>
				</div>
			</div>
			<div class="card">
				<div class="board">
					<h3>
						<a href="/370469">장터게시판</a>
					</h3>
					<a class="list" href="/370469/v/348618811"><time>07/11
							14:03</time>
						<p>현미 발아 햇반 팝니다</p>
						<hr></a><a class="list" href="/370469/v/348610576"><time>07/11
							11:34</time>
						<p>전세 팝니다</p>
						<hr></a><a class="list" href="/370469/v/348574529"><time>07/10
							21:12</time>
						<p>문행 족보</p>
						<hr></a><a class="list" href="/370469/v/348571731"><time>07/10
							20:29</time>
						<p>미소사 족보 팔아요</p>
						<hr></a>
				</div>
			</div>
			<div class="card">
				<div class="board">
					<h3>
						<a href="/258596">정보게시판</a>
					</h3>
					<a class="list" href="/258596/v/348351145"><time>07/07
							19:40</time>
						<p>컴퓨터 산학캡스톤 디자인 12번 하실 분 없나요?</p>
						<hr></a><a class="list" href="/258596/v/347858799"><time>07/01
							14:46</time>
						<p>(재택근무) 대학생 에브리타임 모니터링단 모집합니다.</p>
						<hr></a><a class="list" href="/258596/v/347485842"><time>06/27
							13:08</time>
						<p>2024 KDB 스타트업 프로그램 참가팀 모집 (~7/4)</p>
						<hr></a><a class="list" href="/258596/v/347475805"><time>06/27
							11:02</time>
						<p>🌟매트/기구 필라테스 지도자 과정🌟</p>
						<hr></a>
				</div>
			</div>
			<div class="card">
				<div class="board">
					<h3>
						<a href="/370497">취업·진로</a>
					</h3>
					<a class="list" href="/370497/v/347814705"><time>07/01
							00:58</time>
						<p>h모빌리티 하반기</p>
						<hr></a><a class="list" href="/370497/v/347812223"><time>07/01
							00:34</time>
						<p>이직 시 혹은 취업 시 필요한 정보 얻어가세요(독취사)</p>
						<hr></a><a class="list" href="/370497/v/347636771"><time>06/28
							22:33</time>
						<p>회계랑 마케팅중에</p>
						<hr></a><a class="list" href="/370497/v/347451779"><time>06/27
							00:40</time>
						<p>신세계 인터내셔날 비디비치 마케팅팀 디자인 인턴 채용!</p>
						<hr></a>
				</div>
			</div>
			<div class="card">
				<div class="board">
					<h3>
						<a href="/484852">peet</a>
					</h3>
					<a class="list" href="/484852/v/281923077"><time>23/01/03
							00:11</time>
						<p>하위</p>
						<hr></a><a class="list" href="/484852/v/204003657"><time>21/08/15
							19:21</time>
						<p>다들 오늘 잘봤나요??ㅠㅠㅠ저는 개망...</p>
						<hr></a><a class="list" href="/484852/v/198185323"><time>21/07/01
							16:37</time>
						<p>내년이 마지막...</p>
						<hr></a><a class="list" href="/484852/v/196574995"><time>21/06/21
							16:00</time>
						<p>피트 물리 화학 질문 받습니다.</p>
						<hr></a>
				</div>
			</div>
			<div class="card">
				<div class="board">
					<h3>
						<a href="/519822">전문직 시험(공무원 제외)</a>
					</h3>
					<a class="list" href="/519822/v/348033043"><time>07/03
							12:38</time>
						<p>손사 공부하시는분</p>
						<hr></a><a class="list" href="/519822/v/344249774"><time>05/29
							01:15</time>
						<p>세무사 공부하시는 분 있나요!?</p>
						<hr></a><a class="list" href="/519822/v/340195279"><time>04/21
							15:27</time>
						<p>학교에 세무사 고시반 있나요?</p>
						<hr></a><a class="list" href="/519822/v/337595590"><time>03/29
							18:40</time>
						<p>cpa 1차합하신분들</p>
						<hr></a>
				</div>
			</div>
			<div class="card">
				<div class="board">
					<h3>
						<a href="/519889">로스쿨 게시판</a>
					</h3>
					<a class="list" href="/519889/v/311389026"><time>23/08/02
							20:33</time>
						<p>이번 리트 보신 분 없나요?</p>
						<hr></a>
				</div>
			</div>
			<div class="card">
				<div class="board">
					<h3>
						<a href="/520134">기술고시</a>
					</h3>
					<a class="list" href="/520134/v/282370062"><time>23/01/07
							16:28</time>
						<p>Hi</p>
						<hr></a>
				</div>
			</div>
			<div class="card">
				<div class="board">
					<h3>
						<a href="/367423">홍보게시판</a>
					</h3>
					<a class="list" href="/367423/v/348621547"><time>07/11
							14:48</time>
						<p>AI 인공지능 활용 아이디어 공모전(총상금 1300만원)</p>
						<hr></a><a class="list" href="/367423/v/348620999"><time>07/11
							14:39</time>
						<p>[EN/KO] 🚀 외국인 유학생들! 비자 관련 궁금한 것이 있다면 무엇이</p>
						<hr></a><a class="list" href="/367423/v/348611962"><time>07/11
							12:00</time>
						<p>🎭 극예술연구회 는(=)에서 배우&amp;스태프를 모집합니다! 🎭</p>
						<hr></a><a class="list" href="/367423/v/348610402"><time>07/11
							11:30</time>
						<p>고잔동 수학 학원 알바</p>
						<hr></a>
				</div>
			</div>
			<div class="card">
				<div class="board">
					<h3>
						<a href="/418756">동아리·학회</a>
					</h3>
					<a class="list" href="/418756/v/348616614"><time>07/11
							13:25</time>
						<p>외국인이랑 교류하는 동아리</p>
						<hr></a><a class="list" href="/418756/v/348565831"><time>07/10
							18:52</time>
						<p>☁️ 구름톤 유니브 한양대 에리카 ☁️</p>
						<hr></a><a class="list" href="/418756/v/348492872"><time>07/09
							18:39</time>
						<p>🚨전국 유일무이 엔터테인먼트 클럽 엥크레🚨 광야 내손으로 기획해보자고~!</p>
						<hr></a><a class="list" href="/418756/v/348467456"><time>07/09
							11:39</time>
						<p>논리,구조 없는 기획은 이제 그만😱 기획 연합 동아리, ⚔️팔랑크스⚔️ 여</p>
						<hr></a>
				</div>
			</div>
			<hr>
			<div class="bookstore">
				<a class="item" href="https://bookstore.everytime.kr"><div
						class="image"
						style="background-image: url(&quot;https://cf-cii.everytime.kr/8b46ba32e83b9974789415d1cf0ad7e6498e553a72b17192241d8fee4cd8c659/1720673867612_0_thumb.jpg&quot;);"></div>
					<h4>일반물리학 1</h4>
					<span class="price">18,000원</span></a><a class="item"
					href="https://bookstore.everytime.kr"><div class="image"
						style="background-image: url(&quot;https://cf-cii.everytime.kr/9e9be678de8d5b3e9172fdb6216e89f45db656b89f9920472c29351513780b12/1720169470742_0_thumb.jpg&quot;);"></div>
					<h4>생명의 위대한 비밀</h4>
					<span class="price">10,000원</span></a><a class="item"
					href="https://bookstore.everytime.kr"><div class="image"
						style="background-image: url(&quot;https://cf-cii.everytime.kr/b3f7ed46df6685e6722bf793dab12e81d88f67029a6d268a649f3081f37382b6/1720169195399_0_thumb.jpg&quot;);"></div>
					<h4>생명의 위대한 비밀</h4>
					<span class="price">10,000원</span></a><a class="item"
					href="https://bookstore.everytime.kr"><div class="image"
						style="background-image: url(&quot;https://cf-cii.everytime.kr/0e6aaaebf442db3284c4e9ea0290951308ba6549e833c62d5ed37408527a1296/1719766494384_0_thumb.jpg&quot;);"></div>
					<h4>파이썬인공지능COS Pro 2급</h4>
					<span class="price">5,000원</span></a>
			</div>
		</div>
	</div>
	
</body>
</html>