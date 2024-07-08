package com.everytime.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.everytime.web.domain.PostVO;
import com.everytime.web.service.PostService;

import lombok.extern.log4j.Log4j;

@Controller // @Component
// - 클라이언트(JSP 페이지 등)와 service를 연결하는 역할
@RequestMapping // url : /ex02/board
@Log4j

public class BoardController {

	@Autowired
	private PostService postService;

	// 메인화면(GET)
	@GetMapping("main")
	public String mainGET(Model model) {
		log.info("mainGET()");

		List<PostVO> postList = postService.getAllPosts(1);

//			PageMaker pageMaker = new PageMaker();
//			pageMaker.setPagination(pagination);
//			pageMaker.setTotalCount(boardService.getTotalCount());

//			model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("postList", postList); // 클라이언트로 객체 전달

		return "post_list";
	}

}
