package com.everytime.web.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.everytime.web.domain.PostVO;
import com.everytime.web.domain.RegisterVO;
import com.everytime.web.persistence.PostMapper;
import com.everytime.web.util.Pagination;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class PostServiceImple implements PostService {
    
    @Autowired
    private PostMapper postMapper;
    
    @Override
    public int createPost(PostVO postVO) {
        log.info("createPost()");
        return postMapper.insert(postVO);
    }

    @Override
    public List<PostVO> getAllPosts(int boardId) {
        log.info("getAllPosts()");
        return postMapper.selectPostList(boardId);
    }

    @Override
    public PostVO getPostById(@Param("boardId") int boardId, @Param("postId") int postId) {
        log.info("getPostById()");
        log.info("postId = " + postId + ", boardId = " + boardId);
        log.info(log);
        
        PostVO result = postMapper.getPostById(postId, boardId);
        log.info(result);
        return result;
        
    }

    @Override
    public int updatePost(PostVO postVO) {
        log.info("updatePost()");
        return postMapper.update(postVO);
    }

    @Override
    public int deletePost(int boardId, int postId) {
        log.info("deletePost()");
        return postMapper.delete(boardId, postId);
    }

    @Override
    public List<PostVO> getPagingPosts(Pagination pagination) {
        log.info("getPagingPosts()");
        return postMapper.selectListByPagination(pagination);
    }

    @Override
    public int getTotalCount() {
        log.info("getTotalCount()");
        return postMapper.selectTotalCount();
    }

	

}
