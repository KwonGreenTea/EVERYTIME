package com.everytime.web.persistence;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.everytime.web.domain.PostVO;
import com.everytime.web.domain.RegisterVO;

@Mapper
public interface BoardMapper {

	
	RegisterVO selectRegisterById(String memberId); // 사용자 정보 불러오기
	
	List<PostVO> selectPostList(int boardId); // 전체 게시글 조회
	
}
