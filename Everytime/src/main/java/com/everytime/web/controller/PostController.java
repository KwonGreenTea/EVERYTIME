package com.everytime.web.controller;

import java.util.List;

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
import com.everytime.web.util.PageMaker;
import com.everytime.web.util.Pagination;

import lombok.extern.log4j.Log4j;

@Controller // @Component
// - 모든종류(JSP 페이지 매핑)에 service를 호출하는 객체
@RequestMapping(value = "/post") // url : /post
@Log4j

public class PostController {

	@Autowired
	private PostService postService;

	// 게시글 등록 (처리)
	@PostMapping("create")
	public String createPOST(PostVO postVO, RedirectAttributes reAttr) {
		log.info("createPOST()");
		log.info("postVO = " + postVO.toString());
		int result = postService.createPost(postVO);
		log.info(result + "번 글 등록");
		return "board/post_list";
	}

	// 게시글 수정 (폼)
	@GetMapping("modify_form")
	public void modify() {
		log.info("modify()");
	}

	// 게시글 수정 (처리)
	@GetMapping("update")
	public String modifyPOST(PostVO postVO, RedirectAttributes reAttr) {
		log.info("modifyPOST()");
		int result = postService.updatePost(postVO);
		log.info(result + "번 글 수정");
		return "redirect:/board/post_list";
	}

	// 게시글 삭제 (처리)
	@GetMapping("delete")
	public String delete(Integer boardId, Integer postId, RedirectAttributes reAttr) {
		log.info("delete()");
		int result = postService.deletePost(boardId, postId);
		log.info(result + "번 글 삭제");

		if (boardId == 2) {
			return "redirect:/board/post_list_secret"; // 비밀글 목록
		} else {
			return "redirect:/board/post_list";
		}

	}

	// 게시글 상세보기 (폼)
	@GetMapping("detail")
	public String detail(@RequestParam("boardId") int boardId, @RequestParam("postId") int postId, Model model) {
		log.info("detail()");
		PostVO postVO = postService.getPostById(boardId, postId);
		model.addAttribute("postVO", postVO);
		return "/board/detail";
	}
}
