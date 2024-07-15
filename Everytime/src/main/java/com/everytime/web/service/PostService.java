package com.everytime.web.service;

import java.util.List;

import com.everytime.web.domain.FileVO;
import com.everytime.web.domain.PostVO;
import com.everytime.web.util.Pagination;

public interface PostService {
    int createPost(PostVO postVO);
    
    List<PostVO> getAllPosts(int boardId);
    
    
    int updatePost(PostVO postVO);
    
    List<PostVO> getPagingPosts(Pagination pagination);
    
    int getTotalCount();
    
	PostVO getPostById(int boardId, int postId);
	
	int deletePost(int boardId, int postId);

	int createPostFile(FileVO fileVO);

	int postIdByMemberId(String memberId);

	List<FileVO> getAllPostImgs(Integer boardId);

	List<FileVO> getImgById(int boardId, int postId);

	String getId(int boardId, int postId);

	PostVO getPostDataByPostId(int postId);
	
	//////////////////////////////////////////
	
	
}
