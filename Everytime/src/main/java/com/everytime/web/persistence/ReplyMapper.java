package com.everytime.web.persistence;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.everytime.web.domain.ReplyVO;
import com.everytime.web.util.Pagination;

@Mapper
public interface ReplyMapper {
	int insertReply(ReplyVO reply);
    ReplyVO getReplyById(int replyId);
    List<ReplyVO> getRepliesByPostId(int postId);
    void deleteReply(int replyId);
}
