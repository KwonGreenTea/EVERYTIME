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
// - 스프링 MVC에서 JSP 뷰와 상호작용하여 서비스를 호출하는 객체
@RequestMapping
@Log4j

public class BoardController {
   
   @Autowired
   private PostService postService; 
   
   // post_list.jsp 페이지 호출
   @GetMapping("/main")
   public String postList(Model model) {
      log.info("postList()");

      // 게시물 목록 조회
      List<PostVO> postList = postService.getAllPosts(1);

//      PageMaker pageMaker = new PageMaker();
//      pageMaker.setPagination(pagination);
//      pageMaker.setTotalCount(boardService.getTotalCount());

//      model.addAttribute("pageMaker", pageMaker);
      model.addAttribute("postList", postList); // 스프링 모델 객체에 저장
      
      return "board/main";
   }

}
