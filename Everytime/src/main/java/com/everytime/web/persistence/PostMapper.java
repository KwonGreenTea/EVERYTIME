package com.everytime.web.persistence;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.everytime.web.domain.FileVO;
import com.everytime.web.domain.PostVO;
import com.everytime.web.util.Pagination;

@Mapper
public interface PostMapper {

	// 게시글 등록
	int insert(PostVO PostVO); 
	
	// 전체 게시글 조회
	List<PostVO> selectPostList(int boardId); 
	
	// 특정 게시글 조회
	PostVO selectOne(int boardId); 
	
	// 특정 게시글 수정
	int update(PostVO boardVO); 
	
	// 전체 게시글 페이징 처리
	List<PostVO> selectListByPagination(Pagination pagination);
	
	int selectTotalCount();
	
	// 특정 게시글 삭제
	int delete(int boardId, int postId);
	
	// 게시판 별로 게시글 조회
	PostVO getPostById(@Param("postId") int postId, @Param("boardId") int boardId);
	
	// 게시글 좋아요 업데이트
	int updatePostLike(int postId);
	
	// 파일 삽입
	int insertFile(FileVO fileVO);
	
	int postIdByMemberId(String memberId);

	
	
	List<FileVO> selectPostImgList(Integer boardId);

	// 특정 게시글 이미지 불러오기
	List<FileVO> getImgById(@Param("boardId") int boardId, @Param("postId") int postId);

	String getId(@Param("boardId") int boardId, @Param("postId") int postId);

	int updatePostScrap(int postId);

	PostVO getPostDataByPostId(int postId);
	
	
	// 모든 게시글 검색
	List<PostVO> searchPost(String keyword);
	
	
	
}