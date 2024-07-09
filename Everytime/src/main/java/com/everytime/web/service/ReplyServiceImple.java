package com.everytime.web.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.everytime.web.domain.ReplyVO;
import com.everytime.web.persistence.ReplyMapper;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class ReplyServiceImple implements ReplyService {

    @Autowired
    private ReplyMapper replyMapper;

    @Override
    public int createReply(ReplyVO replyVO) {
    	log.info("createReply()");
    	log.info(replyVO);
        int result = replyMapper.insertReply(replyVO);
        log.info(result);
        return result;
    }

    @Override
    public ReplyVO getReplyById(int replyId) {
        return replyMapper.getReplyById(replyId);
    }

    @Override
    public List<ReplyVO> getRepliesByPostId(int postId) {
        return replyMapper.getRepliesByPostId(postId);
    }

    @Override
    public void removeReply(int replyId) {
        replyMapper.deleteReply(replyId);
    }
}
