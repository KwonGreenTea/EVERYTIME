
  package com.everytime.web.persistence;
  
  import org.apache.ibatis.annotations.Mapper; import
  org.apache.ibatis.annotations.Param;
  
  import com.everytime.web.domain.ReviewLikeVO;
  
  @Mapper public interface ReviewLikeMapper {
  
  // 좋아요 추가
	  int insert(ReviewLikeVO reviewLikeVO);
  
  // 좋아요 갯수 조회 
	  int selectLikeCountByReviewId(int reviewId);
  
  // 좋아요 취소 
	  int deleteLike(@Param("reviewId") int reviewId, @Param("memberId")String memberId); 
  
  // 이미 누른 좋아요 인지 체크
  
  int checkIfLiked(@Param("reviewId") int reviewId, @Param("memberId") String
  memberId);
  
  
  
  }
 