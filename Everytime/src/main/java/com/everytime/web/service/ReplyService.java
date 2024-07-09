package com.everytime.web.service;

import java.util.List;
import com.everytime.web.domain.ReplyVO;

public interface ReplyService {
	int createReply(ReplyVO replyVO);
    ReplyVO getReplyById(int replyId);
    List<ReplyVO> getRepliesByPostId(int postId);
    void removeReply(int replyId);
}
