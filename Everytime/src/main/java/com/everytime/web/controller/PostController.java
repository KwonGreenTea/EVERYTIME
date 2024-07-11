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
import com.everytime.web.domain.RegisterVO;
import com.everytime.web.service.PostService;
import com.everytime.web.util.PageMaker;
import com.everytime.web.util.Pagination;

import lombok.extern.log4j.Log4j;

@Controller // @Component
// - �겢�씪�씠�뼵�듃(JSP �럹�씠吏� �벑)�� service瑜� �뿰寃고븯�뒗 �뿭�븷	
@RequestMapping(value = "/post") // url : /post
@Log4j

public class PostController {

	@Autowired
	private PostService postService;

	// 寃뚯떆湲� �엯�젰 (泥섎━)
	@PostMapping("create")
	public String createPOST(PostVO postVO, RedirectAttributes reAttr) {
		log.info("createPOST()");
		log.info("postVO = " + postVO.toString());
		int result = postService.createPost(postVO);
		log.info(result + "�뻾 �벑濡�");
		return "board/post_list";
	}

	// 寃뚯떆湲� �닔�젙 (�솕硫�)
	@GetMapping("modify_form")
	public void modify() {
		log.info("modify()");
	}

	// 寃뚯떆湲� �닔�젙 (泥섎━)
	@GetMapping("update")
	public String modifyPOST(PostVO postVO, RedirectAttributes reAttr) {
		log.info("modifyPOST()");
		int result = postService.updatePost(postVO);
		log.info(result + "�뻾 �닔�젙");
		return "redirect:/board/post_list";
	}

	// 寃뚯떆湲� �궘�젣 (泥섎━)
	@GetMapping("delete")
	public String delete(Integer boardId, Integer postId, RedirectAttributes reAttr) {
		log.info("delete()");
		int result = postService.deletePost(boardId, postId);
		log.info(result + "�뻾 �궘�젣");

		if (boardId == 2) {
			return "redirect:/board/post_list_secret"; // 鍮꾨� 寃뚯떆�뙋
		} else {
			return "redirect:/board/post_list";
		}

	}

	// 寃뚯떆湲� 議고쉶 (�솕硫�)
	@GetMapping("detail")
	public String detail(@RequestParam("boardId") int boardId, @RequestParam("postId") int postId, Model model) {
		log.info("detail()");
		PostVO postVO = postService.getPostById(boardId, postId);
		model.addAttribute("postVO", postVO);
		return "/board/detail";
	}
}