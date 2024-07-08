package com.everytime.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.everytime.web.domain.PostVO;
import com.everytime.web.service.PostService;

import lombok.extern.log4j.Log4j;

@Controller // @Component
// - 클라이언트(JSP 페이지 등)와 service를 연결하는 역할	
@RequestMapping // url : /post
@Log4j

public class PostController {

	@Autowired
	private PostService postService;

	// 게시글 입력 (처리)
	@PostMapping("/post/create")
	public String createPOST(PostVO postVO, RedirectAttributes reAttr) {
		log.info("createPOST()");
		log.info("postVO = " + postVO.toString());
		int result = postService.createPost(postVO);
		log.info(result + "행 등록");
		return "redirect:/post_list";
	}

	// 게시글 수정 (화면)
	@GetMapping("/post/modify_form")
	public void modify() {
		log.info("modify()");
	}

	// 게시글 수정 (처리)
	@GetMapping("/post/update")
	public String modifyPOST(PostVO postVO, RedirectAttributes reAttr) {
		log.info("modifyPOST()");
		int result = postService.updatePost(postVO);
		log.info(result + "행 수정");
		return "redirect:/post_list";
	}

	// 게시글 삭제 (처리)
	@GetMapping("/post/delete")
	public String delete(Integer boardId, Integer postId, RedirectAttributes reAttr) {
		log.info("delete()");
		int result = postService.deletePost(boardId, postId);
		log.info(result + "행 삭제");

		if (boardId == 2) {
			return "redirect:/post_list_secret"; // 비밀 게시판
		} else {
			return "redirect:/post_list";
		}

	}

	// 게시글 조회 (화면)
	@GetMapping("/post/detail")
	public String detail(@RequestParam("boardId") int boardId, @RequestParam("postId") int postId, Model model) {
		log.info("detail()");
		PostVO postVO = postService.getPostById(boardId, postId);
		model.addAttribute("postVO", postVO);
		return "detail";
	}
}