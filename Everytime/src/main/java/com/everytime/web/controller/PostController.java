package com.everytime.web.controller;

import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.everytime.web.domain.PostVO;
import com.everytime.web.service.PostService;
import com.everytime.web.util.FileUploadUtil;
import com.everytime.web.util.PageMaker;
import com.everytime.web.util.Pagination;

import lombok.extern.log4j.Log4j;

@Controller // @Component
// - 모든종류(JSP 페이지 매핑)에 service를 호출하는 객체
@RequestMapping(value = "/post") // url : /post
@Log4j

public class PostController {

	@Autowired
	private String uploadPath;
	
	@Autowired
	private PostService postService;

	
	@GetMapping("post_list")
	public String post_ListGET(Model model, Integer boardId,HttpServletRequest request) {
		log.info("post_ListGET");
		
		HttpSession session = request.getSession();
		String memberId = (String) session.getAttribute("memberId");
		
		// 게시물 목록 조회
		List<PostVO> postList = postService.getAllPosts(boardId);
		
		model.addAttribute("postList", postList);
		model.addAttribute("boardId", boardId);
		model.addAttribute("memberId",memberId);
		
		return "board/post_list";
	}
	
	
	// 게시글 등록 (처리)
	@PostMapping("create")
	public String createPOST(PostVO postVO, RedirectAttributes reAttr) {
		log.info("createPOST()");
		
		MultipartFile file = postVO.getFile();

		if(file != null) {
			// UUID 생성
			String chgName = UUID.randomUUID().toString();
			// 파일 저장
			FileUploadUtil.saveFile(uploadPath, file, chgName);

			// 파일 경로 설정
			postVO.setPostPath(FileUploadUtil.makeDatePath());
			// 파일 실제 이름 설정
			postVO.setPostRealName(FileUploadUtil.subStrName(file.getOriginalFilename()));
			// 파일 변경 이름(UUID) 설정
			postVO.setPostChgName(chgName);
			// 파일 확장자 설정
			postVO.setPostExtension(FileUploadUtil.subStrExtension(file.getOriginalFilename()));
		}
		
		log.info(postVO);
		
		log.info(postService.createPost(postVO) + "행 등록");
		return "freeBoard";
		// return "redirect:/freeBoard";
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
