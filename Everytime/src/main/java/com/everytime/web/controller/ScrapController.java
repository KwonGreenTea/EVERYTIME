package com.everytime.web.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.everytime.web.domain.PostVO;
import com.everytime.web.domain.ReviewVO;
import com.everytime.web.domain.ScrapVO;
import com.everytime.web.service.PostService;
import com.everytime.web.service.RegisterService;
import com.everytime.web.service.ScrapService;

import lombok.extern.log4j.Log4j;

@Controller // @Component
// - 스프링 MVC에서 JSP 뷰와 상호작용하여 서비스를 호출하는 객체
@RequestMapping
@Log4j

public class ScrapController {
	@Autowired
	private RegisterService registerService;

	@Autowired
	private ScrapService scrapService;

	@Autowired
	private PostService postService;

	@GetMapping("/myscrap")
	public String myscrapGet(Model model, HttpServletRequest request) {
		log.info("myscrapGet()");
		HttpSession session = request.getSession();
		String memberId = (String) session.getAttribute("memberId");
		String nickname = registerService.getNicknameById(memberId);

		List<ReviewVO> reviewList = postService.selectReview();
		List<Integer> scrapPostId = scrapService.selectScrapById(memberId);

		List<PostVO> postList = new ArrayList<>();
		for (int postId : scrapPostId) {
			postList.add(postService.getPostDataByPostId(postId));
		}
		
		List<PostVO> hotPostList = postService.selectHotPost();

		model.addAttribute("nickname", nickname);
		model.addAttribute("postList", postList);
		model.addAttribute("reviewList", reviewList);
		model.addAttribute("hotPostList", hotPostList);

		return "board/myscrap";
	}

	@PostMapping("/post/postScrap")
	public ResponseEntity<Integer> postScrapPost(@RequestBody ScrapVO scrapVO, HttpServletRequest request) {
		log.info("postScrapPost");

		HttpSession session = request.getSession();
		String memberId = (String) session.getAttribute("memberId");

		scrapVO.setMemberId(memberId);

		int postId = scrapVO.getPostId();

		int checkResult = scrapService.checkIfPostScraped(postId, memberId);

		int result = 0;

		if (checkResult == 0) {
			result = scrapService.postScrap(scrapVO);

			return new ResponseEntity<Integer>(result, HttpStatus.OK);
		}

		return new ResponseEntity<Integer>(result, HttpStatus.OK);

	}

	@PostMapping("/post/postCancelScrap")
	public ResponseEntity<Integer> postCancelScrap(@RequestBody ScrapVO scrapVO, HttpServletRequest request) {
		log.info("postScrapPost");
		HttpSession session = request.getSession();
		String memberId = (String) session.getAttribute("memberId");
		scrapVO.setMemberId(memberId);
		int result = scrapService.postCancelScrap(scrapVO);

		return new ResponseEntity<Integer>(result, HttpStatus.OK);

	}

	@PostMapping("/post/getScrapStatus")
	public ResponseEntity<Integer> getScrapStatus(@RequestBody ScrapVO scrapVO, HttpServletRequest request) {
		log.info("getScrapStatus");
		HttpSession session = request.getSession();
		String memberId = (String) session.getAttribute("memberId");
		scrapVO.setMemberId(memberId);
		int result = scrapService.postChkScrap(scrapVO);

		return new ResponseEntity<Integer>(result, HttpStatus.OK);

	}
}
