
package com.everytime.web.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.everytime.web.domain.ReviewLikeVO;
import com.everytime.web.persistence.ReviewLikeMapper;
import com.everytime.web.persistence.ReviewMapper;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class ReviewLikeServiceImple implements ReviewLikeService {

	@Autowired
	private ReviewLikeMapper reviewLikeMapper;

	@Autowired
	private ReviewMapper reviewMapper;
	
	
	
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

}
