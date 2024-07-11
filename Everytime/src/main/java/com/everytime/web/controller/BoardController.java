package com.everytime.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.everytime.web.domain.PostVO;
import com.everytime.web.service.PostService;
import com.everytime.web.util.PageMaker;
import com.everytime.web.util.Pagination;

import lombok.extern.log4j.Log4j;

@Controller // @Component
// - �겢�씪�씠�뼵�듃(JSP �럹�씠吏� �벑)�� service瑜� �뿰寃고븯�뒗 �뿭�븷
@RequestMapping
@Log4j

public class BoardController {

	@Autowired
	private PostService postService;

	// post_list.jsp �럹�씠吏� �샇異�
	@GetMapping("/main")
	public void main() {
		log.info("main()");
	}

	// post_list.jsp �럹�씠吏� �샇異�
	@GetMapping("/freeBoard")
	public String postList(Model model) {
		log.info("postList()");

		//
		List<PostVO> postList = postService.getAllPosts(1);

//		PageMaker pageMaker = new PageMaker();
//		pageMaker.setPagination(pagination);
//		pageMaker.setTotalCount(boardService.getTotalCount());

//		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("postList", postList); // �겢�씪�씠�뼵�듃濡� 媛앹껜 �쟾�떖

		return "board/post_list";
	}

}