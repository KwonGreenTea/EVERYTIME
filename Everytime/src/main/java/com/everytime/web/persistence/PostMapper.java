package com.everytime.web.persistence;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.everytime.web.domain.FileVO;
import com.everytime.web.domain.PostVO;
import com.everytime.web.util.Pagination;

@Mapper
public interface PostMapper {
	// 메소드 이름은 BoardMapper.xml에서 SQL 쿼리 정의 태그의 id 값과 동일
	// 매개변수는 BoardMapper.xml에서 #{변수명}과 동일(클래스 타입은 각 멤버변수명과 매칭)
	int insert(PostVO PostVO); // 게시글 등록
	
	List<PostVO> selectPostList(int boardId); // 전체 게시글 조회
	
	PostVO selectOne(int boardId); // 특정 게시글 조회
	
	int update(PostVO boardVO); // 특정 게시글 수정
	
	// 전체 게시글 페이징 처리
	
	List<PostVO> selectListByPagination(Pagination pagination);
	
	int selectTotalCount();
	
	int delete(int boardId, int postId);
	
	PostVO getPostById(@Param("postId") int postId, @Param("boardId") int boardId);
	
	// 게시글 좋아요 업데이트
	
	int updatePostLike(int postId);

	int insertFile(FileVO fileVO);
	
	int postIdByMemberId(String memberId);

	
	
	List<FileVO> selectPostImgList(Integer boardId);

	List<FileVO> getImgById(@Param("boardId") int boardId, @Param("postId") int postId);

	String getId(@Param("boardId") int boardId, @Param("postId") int postId);

	int updatePostScrap(int postId);

	PostVO getPostDataByPostId(int postId);
	
}