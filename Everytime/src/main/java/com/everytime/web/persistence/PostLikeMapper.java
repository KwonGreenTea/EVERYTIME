package com.everytime.web.persistence;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.everytime.web.domain.PostLikeVO;

@Mapper
public interface PostLikeMapper {

	// 좋아요 추가
		  int likePost(PostLikeVO postLikeVO);
	  
	  // 좋아요 갯수 조회 
		  int selectLikeCountByPostId(int postId);
	  
	  // 좋아요 취소 
		  int deleteLike(@Param("postId") int postId, @Param("memberId")String memberId); 
	  
	  // 이미 누른 좋아요 인지 체크
	  
	  int checkIfPostLiked(@Param("postId") int postId, @Param("memberId") String  memberId);
	  
	
}
