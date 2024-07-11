
package com.everytime.web.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.catalina.connector.Response;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.everytime.web.domain.ReviewLikeVO;
import com.everytime.web.service.ReviewLikeService;

import lombok.extern.log4j.Log4j;

@RestController
@Log4j
public class ReviewLikeRestController {

	@Autowired
	private ReviewLikeService reviewLikeService;

	// 좋아요 추가

	@PostMapping("/reviewLike")
	public ResponseEntity<Integer> insert(@RequestBody ReviewLikeVO reviewLikeVO, HttpServletRequest request) {
		log.info("insert()");

		HttpSession session = request.getSession();
		String memberId = (String) session.getAttribute("memberId");

		reviewLikeVO.setMemberId(memberId);

		int reviewId = reviewLikeVO.getReviewId();
		
		int checkResult = reviewLikeService.checkIfLiked(reviewId, memberId);
		
		int result = 0;
		
		if (checkResult == 0) {
			result = reviewLikeService.insert(reviewLikeVO);
			
			return new ResponseEntity<Integer>(result, HttpStatus.OK);
		} 
		
		return new ResponseEntity<Integer>(result, HttpStatus.OK);
		
	}

	

}
