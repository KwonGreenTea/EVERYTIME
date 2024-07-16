package com.everytime.web.controller;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.everytime.web.domain.FileVO;
import com.everytime.web.domain.PostVO;
import com.everytime.web.domain.ProfileVO;
import com.everytime.web.domain.ReviewVO;
import com.everytime.web.domain.ScrapVO;
import com.everytime.web.service.PostService;
import com.everytime.web.service.ProfileService;
import com.everytime.web.service.ScrapService;
import com.everytime.web.util.FileUploadUtil;

import lombok.extern.log4j.Log4j;
import oracle.jdbc.proxy.annotation.Post;

@Controller // @Component
// - 모든종류(JSP 페이지 매핑)에 service를 호출하는 객체
@RequestMapping(value = "/post") // url : /post
@Log4j

public class PostController {

	@Autowired
	private String uploadPath;

	@Autowired
	private PostService postService;

	@Autowired
	private ProfileService profileService;

	@Autowired
	private ScrapService scrapService;

	@GetMapping("post_list")
	public String post_ListGET(Model model, Integer boardId, HttpServletRequest request) {
		log.info("post_ListGET");

		HttpSession session = request.getSession();
		String memberId = (String) session.getAttribute("memberId");

		// 게시물 목록 조회
		List<PostVO> postList = postService.getAllPosts(boardId);
		
		if (postList.isEmpty()) {
			log.info("postList 없어 !!!");
		}

		// 게시물 ID별로 이미지 파일을 그룹화
		List<FileVO> allPostImgs = postService.getAllPostImgs(boardId);

		// 게시물 ID별로 첫 번째 이미지만 선택
		Map<Integer, FileVO> firstImageMap = new LinkedHashMap<>();
		for (FileVO file : allPostImgs) {
			if (!firstImageMap.containsKey(file.getPostId())) {
				firstImageMap.put(file.getPostId(), file);
			}
		}

		// 첫 번째 이미지만 포함된 리스트
		List<FileVO> postImgListData = new ArrayList<>(firstImageMap.values());

		List<FileVO> postImgList = new ArrayList<>();
		if (postImgListData != null) {
			for (FileVO file : postImgListData) {
				String filePath = file.getPostPath();
				String[] parts = filePath.split("\\\\");
				String year = parts[0];
				String month = parts[1];
				String day = parts[2];

				String fileExtension = file.getPostExtension();
				String fileName = file.getPostRealName();

				String imgSource = "image/" + year + "/" + month + "/" + day + "/" + fileName + "." + fileExtension;
				file.setImgSource(imgSource);
				postImgList.add(file);
			}
		}

		// rightSide 리뷰리스트
		List<ReviewVO> reviewList = postService.selectReview();
		
		// rightSide hot 게시글
		List<PostVO> hotPostList = postService.selectHotPost();
		
		log.info("hotPostList : " + hotPostList);
		
		model.addAttribute("postList", postList);
		model.addAttribute("postImgList", postImgList);
		model.addAttribute("boardId", boardId);
		model.addAttribute("memberId", memberId);
		model.addAttribute("reviewList", reviewList);
		model.addAttribute("hotPostList", hotPostList);
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
		ProfileVO profileVO = profileService.getProfileById(postService.getId(boardId, postId));
		
		List<ReviewVO> reviewList = postService.selectReview();
		log.info("reviewList : " +reviewList);
		String profileImgSource;
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

			profileImgSource = "image/" + year + "/" + month + "/" + day + "/" + profileName + "." + profileExtension;
		} else {
			// 기본 이미지 경로
			profileImgSource = "image/imageDir/profile.png";
		}

		List<String> imgSource = new ArrayList<>();
		if (fileVO != null) {
			for (FileVO imgData : fileVO) {
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
		model.addAttribute("reviewList", reviewList);
		model.addAttribute("imgSource", imgSource);
		model.addAttribute("profileImgSource", profileImgSource);
		model.addAttribute("postVO", postVO);
		return "/board/detail";
	}

	@PostMapping("postScrap")
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

	@PostMapping("postCancelScrap")
	public ResponseEntity<Integer> postCancelScrap(@RequestBody ScrapVO scrapVO, HttpServletRequest request) {
		log.info("postScrapPost");
		HttpSession session = request.getSession();
		String memberId = (String) session.getAttribute("memberId");
		scrapVO.setMemberId(memberId);
		int result = scrapService.postCancelScrap(scrapVO);

		return new ResponseEntity<Integer>(result, HttpStatus.OK);

	}

	@PostMapping("getScrapStatus")
	public ResponseEntity<Integer> getScrapStatus(@RequestBody ScrapVO scrapVO, HttpServletRequest request) {
		log.info("getScrapStatus");
		HttpSession session = request.getSession();
		String memberId = (String) session.getAttribute("memberId");
		scrapVO.setMemberId(memberId);
		int result = scrapService.postChkScrap(scrapVO);

		return new ResponseEntity<Integer>(result, HttpStatus.OK);

	}

	@PostMapping("/search/all")
	public String searchAllPOST(String keyword, Model model, RedirectAttributes reAttr) {
		log.info("searchAllPOST()");

		List<PostVO> searchList = postService.searchPost(keyword);

		log.info("searchList : " + searchList);

		model.addAttribute("searchList", searchList);

		return "/board/search";

	}

	@GetMapping("hotpost")
		 public String hotpost(Model model) {
			 log.info("hotpost");
			 
			 List<PostVO> hotPostList = postService.selectHotPost();
			 List<ReviewVO> reviewList = postService.selectReview();
			 
			 
			 model.addAttribute("hotPostList", hotPostList);
			 model.addAttribute("reviewList", reviewList);
			 
			 return "board/hotpost";
		 }
	
	
	@GetMapping("myPost")
		public String myPost(Model model,HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		String memberId = (String) session.getAttribute("memberId");
		
		log.info("myPost()");
		
		List<PostVO> myPostList = postService.selectMyPost(memberId);
		List<ReviewVO> reviewList = postService.selectReview();
		
		// rightSide hot 게시글
				List<PostVO> hotPostList = postService.selectHotPost();
				
		model.addAttribute("myPostList", myPostList);
		model.addAttribute("reviewList", reviewList);
		model.addAttribute("hotPostList", hotPostList);
		
		
		return "board/myPost";
	}
	
}
