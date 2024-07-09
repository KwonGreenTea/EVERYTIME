package com.everytime.web.domain;

import java.sql.Timestamp;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class ReplyVO {
    private int replyId;
    private int postId;
    private int boardId;
    private String memberId;
    private String nickname;
    private int replyDepth;
    private String replyDeleted;
    private String replyAnonymous;
    private String replyContent;
    private Timestamp replyDateCreated;
    private int replyLikeCount;
}
