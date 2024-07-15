
package com.everytime.web.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.everytime.web.domain.PostLikeVO;
import com.everytime.web.domain.ReviewLikeVO;
import com.everytime.web.persistence.PostLikeMapper;
import com.everytime.web.persistence.PostMapper;
import com.everytime.web.persistence.ReviewLikeMapper;
import com.everytime.web.persistence.ReviewMapper;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class LikeServiceImple implements LikeService {

	@Autowired
	private ReviewLikeMapper reviewLikeMapper;

	@Autowired
	private ReviewMapper reviewMapper;
	
	@Autowired PostLikeMapper postLikeMapper;
	
	@Autowired PostMapper postMapper;
	
	// 리뷰 좋아요 메소드
	
	@Transactional(value = "transactionManager") 
	@Override
	public int insert(ReviewLikeVO reviewLikeVO) {
		log.info("insert()");
		int insertReviewLikeResult = reviewLikeMapper.insert(reviewLikeVO);
		log.info(insertReviewLikeResult + "행 좋아요 정보 등록");
		 
		int reviewId =  reviewLikeVO.getReviewId();
		int updateReviewLike = reviewMapper.updateReviewLike(reviewId);
		log.info(updateReviewLike + "행 좋아요 업데이트 완료");
		return 1;
		
	}

	@Override
	public int selectLikeCountByReveiwId(int reviewid) {
		log.info("selectLikeCountByReveiwId()");
		return reviewLikeMapper.selectLikeCountByReviewId(reviewid);
	}

	@Override
	public int deleteLike(int reviewId, String memberId) {
		log.info("deleteLike()");
		return reviewLikeMapper.deleteLike(reviewId, memberId);
	}

	@Override
	public int checkIfLiked(int reviewId, String memberId) {
		log.info("checkIdLiked()");
		return reviewLikeMapper.checkIfLiked(reviewId, memberId);
	}

	
	// 게시글 좋아요 메소드
	
	@Transactional(value = "transactionManager") 
	@Override
	public int postLike(PostLikeVO postLikeVO) {
		log.info("postLike()");
		int insertPostLikeResult = postLikeMapper.likePost(postLikeVO);
		log.info(insertPostLikeResult + "행 좋아요 정보 등록");
		 
		int postId = postLikeVO.getPostId(); 
		int updatePostLike = postMapper.updatePostLike(postId);
		log.info(updatePostLike + "행 좋아요 업데이트 완료");
		return 1;
	}

	@Override
	public int selectLikeCountByPostId(int postId) {
		log.info("selectLikeCountByPostId");
		return postLikeMapper.selectLikeCountByPostId(postId);
	}

	@Override
	public int checkIfPostLiked(int postId, String memberId) {
		log.info("checkIfPostLiked");
		return postLikeMapper.checkIfPostLiked(postId, memberId);
	}
	
	
	
	

}
