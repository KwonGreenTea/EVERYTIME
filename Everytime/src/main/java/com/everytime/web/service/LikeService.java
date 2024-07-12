
package com.everytime.web.service;

import com.everytime.web.domain.PostLikeVO;
import com.everytime.web.domain.ReviewLikeVO;

public interface LikeService {

	// 리뷰 좋아요
	int insert(ReviewLikeVO reviewLikeVO);

	int selectLikeCountByReveiwId(int reviewid);

	int deleteLike(int reviewId, String memberId);

	int checkIfLiked(int reviewId, String memberId);

	
	// 게시글 좋아요
	
	int postLike(PostLikeVO postLikeVO);
	
	int selectLikeCountByPostId(int postId);
	
	int checkIfPostLiked(int postId, String memberId);
	
	
}
