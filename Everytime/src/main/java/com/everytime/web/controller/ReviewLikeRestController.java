
package com.everytime.web.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.everytime.web.domain.PostLikeVO;
import com.everytime.web.domain.ReviewLikeVO;
import com.everytime.web.service.LikeService;

import lombok.extern.log4j.Log4j;

@RestController
@Log4j
public class ReviewLikeRestController {

	@Autowired
	LikeService likeService;
	// 좋아요 추가

	@PostMapping("/reviewLike")
	public ResponseEntity<Integer> insert(@RequestBody ReviewLikeVO reviewLikeVO, HttpServletRequest request) {
		log.info("insert()");

		HttpSession session = request.getSession();
		String memberId = (String) session.getAttribute("memberId");

		reviewLikeVO.setMemberId(memberId);

		int reviewId = reviewLikeVO.getReviewId();
		
		int checkResult = likeService.checkIfLiked(reviewId, memberId);
		
		int result = 0;
		
		if (checkResult == 0) {
			result = likeService.insert(reviewLikeVO);
			
			return new ResponseEntity<Integer>(result, HttpStatus.OK);
		} 
		
		return new ResponseEntity<Integer>(result, HttpStatus.OK);
		
	}
	
	@PostMapping("post/postLike")
	public ResponseEntity<Integer> postLike(@RequestBody PostLikeVO postLikeVO, HttpServletRequest request){
		log.info("postLike");
		
		HttpSession session = request.getSession();
		String memberId = (String) session.getAttribute("memberId");
		
		postLikeVO.setMemberId(memberId);
		
		int postId = postLikeVO.getPostId();
		
		int checkResult =likeService.checkIfPostLiked(postId, memberId);
		
		int result = 0;
		
		if (checkResult == 0) {
			result = likeService.postLike(postLikeVO);
			
			return new ResponseEntity<Integer>(result, HttpStatus.OK);
		} 
		
		return new ResponseEntity<Integer>(result, HttpStatus.OK);
		
	}

	

}
