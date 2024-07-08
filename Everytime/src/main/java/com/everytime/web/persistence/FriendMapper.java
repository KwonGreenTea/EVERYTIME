package com.everytime.web.persistence;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.everytime.web.domain.FriendVO;

@Mapper
public interface FriendMapper {

    // 친구 추가 메서드
    int insert(@Param("requestId") String requestId, @Param("responseId") String responseId, @Param("requestName") String requestName, @Param("responseName") String responseName);

    // 친구 요청 조회 메서드
    List<FriendVO> checkRequest(String requestId);

    // 친구 목록 조회 메서드
    List<String> UserAccept(String requestId);

    FriendVO FriendAccept(@Param("requestId") String requestId, @Param("responseId") String responseId);

    // 친구 요청 여부 확인 메서드
    List<FriendVO> checkFriend(@Param("requestId") String requestId, @Param("responseId") String responseId);

    // 친구 요청 수락 메서드
    int acceptFriend(@Param("requestId") String requestId, @Param("responseId") String responseId);

    // 친구 요청 거절 메서드, 친구 삭제 메서드
    int deleteFriend(@Param("requestId") String requestId, @Param("responseId") String responseId);

	int deleteUser(@Param("memberId") String memberId);
}
