
package com.everytime.web.service;

import com.everytime.web.domain.ReviewLikeVO;

public interface ReviewLikeService {

	int insert(ReviewLikeVO reviewLikeVO);

	int selectLikeCountByReveiwId(int reviewid);

	int deleteLike(int reviewId, String memberId);

	int checkIfLiked(int reviewId, String memberId);

	
	
}
