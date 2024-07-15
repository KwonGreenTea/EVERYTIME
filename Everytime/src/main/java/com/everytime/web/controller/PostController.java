package com.everytime.web.controller;

import java.util.ArrayList;
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

import com.everytime.web.domain.FileVO;
import com.everytime.web.domain.PostVO;
import com.everytime.web.service.PostService;
import com.everytime.web.util.FileUploadUtil;

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
	public String post_ListGET(Model model, Integer boardId, HttpServletRequest request) {
		log.info("post_ListGET");

		HttpSession session = request.getSession();
		String memberId = (String) session.getAttribute("memberId");

		// 게시물 목록 조회
		List<PostVO> postList = postService.getAllPosts(boardId);
		List<FileVO> postImgList = postService.getAllPostImgs(boardId);

		model.addAttribute("postList", postList);
		model.addAttribute("postImgList", postImgList);
		model.addAttribute("boardId", boardId);
		model.addAttribute("memberId", memberId);

		return "board/post_list";
	}

	// 게시글 등록 (처리)
	@PostMapping("create")
	public String createPOST(PostVO postVO, @RequestParam("imgFiles") MultipartFile[] files,
			RedirectAttributes reAttr) {
		log.info("createPOST()");
		log.info(postService.createPost(postVO) + "행 등록");
		postVO.setPostId(postService.postIdByMemberId(postVO.getMemberId()));
		
		if (files != null && files.length > 0) {
			int result = 0;
			for (MultipartFile file : files) {
				if (!file.isEmpty()) {
					FileVO fileVO = new FileVO();
					fileVO.setBoardId(postVO.getBoardId());
					fileVO.setPostId(postVO.getPostId());

					String chgName = UUID.randomUUID().toString();
					FileUploadUtil.saveFile(uploadPath, file, chgName);

					fileVO.setPostPath(FileUploadUtil.makeDatePath());
					fileVO.setPostRealName(FileUploadUtil.subStrName(file.getOriginalFilename()));
					fileVO.setPostChgName(chgName);
					fileVO.setPostExtension(FileUploadUtil.subStrExtension(file.getOriginalFilename()));

					result += postService.createPostFile(fileVO);
				}
			}
			log.info(result + "개의 파일 등록 완료");
		}
		return "redirect:/post/post_list?boardId=" + postVO.getBoardId();
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
		List<FileVO> fileVO = postService.getImgById(boardId, postId);
		
		List<String> imgSource = new ArrayList<>();
		if (fileVO != null) {
			for(FileVO imgData : fileVO) {
				// 파일의 경로를 가져옴
				String postPath = imgData.getPostPath();
				// 파일 참조를 위해 파일 경로 파싱
				String[] parts = postPath.split("\\\\");
				String year = parts[0];
				String month = parts[1];
				String day = parts[2];

				// 파일의 확장명을 가져옴
				String postExtension = imgData.getPostExtension();

				// 파일의 이름을 가져옴
				String postName = imgData.getPostRealName();

				imgSource.add("image/" + year + "/" + month + "/" + day + "/" + postName + "." + postExtension);
			}
		} 

		model.addAttribute("imgSource", imgSource);	
		model.addAttribute("postVO", postVO);
		return "/board/detail";
	}
}
