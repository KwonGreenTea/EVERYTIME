package com.everytime.web.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.everytime.web.domain.PostVO;
import com.everytime.web.domain.ProfileVO;
import com.everytime.web.domain.RegisterVO;
import com.everytime.web.domain.ReviewVO;
import com.everytime.web.service.BoardService;
import com.everytime.web.service.PostService;
import com.everytime.web.service.ProfileService;
import com.everytime.web.service.RegisterService;
import com.everytime.web.service.ScrapService;

import lombok.extern.log4j.Log4j;

@Controller // @Component
// - 스프링 MVC에서 JSP 뷰와 상호작용하여 서비스를 호출하는 객체
@RequestMapping
@Log4j

public class BoardController {

	@Autowired
	private BoardService boardService;
	
	@Autowired
	private RegisterService registerService;

	@Autowired
	private ProfileService profileService;

	@Autowired
	private ScrapService scrapService;

	@Autowired
	private PostService postService;

	// post_list.jsp 페이지 호출
	@GetMapping("/main")
	public String postList(Model model, HttpServletRequest request) {
		log.info("postList()");
		HttpSession session = request.getSession();
		String memberId = (String) session.getAttribute("memberId");

		RegisterVO registerVO = boardService.selectRegisterById(memberId);

		log.info("registerVO : " + registerVO);
		// 게시물 목록 조회
		List<PostVO> postListNum1 = boardService.getAllPosts(1);
		List<PostVO> postListNum2 = boardService.getAllPosts(2);
		List<PostVO> postListNum3 = boardService.getAllPosts(3);
		List<PostVO> postListNum4 = boardService.getAllPosts(4);

		List<ReviewVO> reviewList = boardService.selectReview();
		log.info("postList1 : " + postListNum1);

		List<PostVO> hotPostList = postService.selectHotPost();

		log.info("hotPostList : " + hotPostList);

		ProfileVO profileVO = profileService.getProfileById(memberId);

		String imgSource;
		if (profileVO != null) {
			// 파일의 경로를 가져옴
			String profilePath = profileVO.getProfilePath();
			// 파일 참조를 위해 파일 경로 파싱
			String[] parts = profilePath.split("\\\\");
			String year = parts[0];
			String month = parts[1];
			String day = parts[2];

			// 파일의 확장명을 가져옴
			String profileExtension = profileVO.getProfileExtension();

			// 파일의 이름을 가져옴
			String profileName = profileVO.getProfileRealName();

			imgSource = "image/" + year + "/" + month + "/" + day + "/" + profileName + "." + profileExtension;
		} else {
			// 기본 이미지 경로
			imgSource = "image/imageDir/profile.png";
		}

		model.addAttribute("imgSource", imgSource);

//      PageMaker pageMaker = new PageMaker();
//      pageMaker.setPagination(pagination);
//      pageMaker.setTotalCount(boardService.getTotalCount());

//      model.addAttribute("pageMaker", pageMaker);

		model.addAttribute("registerVO", registerVO);
		model.addAttribute("postListNum1", postListNum1); // 스프링 모델 객체에 저장
		model.addAttribute("postListNum2", postListNum2);
		model.addAttribute("postListNum3", postListNum3);
		model.addAttribute("postListNum4", postListNum4);
		model.addAttribute("reviewList", reviewList);
		model.addAttribute("hotPostList", hotPostList);
		return "board/main";
	}

	@GetMapping("/myscrap")
	public String myscrapGet(Model model, HttpServletRequest request) {
		log.info("myscrapGet()");
		HttpSession session = request.getSession();
		String memberId = (String) session.getAttribute("memberId");
		String nickname = registerService.getNicknameById(memberId);

		List<Integer> scrapPostId = scrapService.selectScrapById(memberId);

		List<PostVO> postList = new ArrayList<>();
		for (int postId : scrapPostId) {
			postList.add(postService.getPostDataByPostId(postId));
		}
		
		List<PostVO> hotPostList = postService.selectHotPost();

		model.addAttribute("nickname", nickname);
		model.addAttribute("postList", postList);
		model.addAttribute("hotPostList", hotPostList);

		return "board/myscrap";
	}

}
