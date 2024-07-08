package com.everytime.web.service;

import java.util.List;

import com.everytime.web.domain.FriendVO;
import com.everytime.web.domain.RegisterVO;

public interface FriendService {

    // 친구 추가 메서드
    int createFriend(String requestId, String responseId, String requestName, String responseName);
    
    // 친구 요청 조회 메서드
    List<FriendVO> checkRequest(String requestId);
    
    // 사용자가 수락한 친구 목록 조회 메서드
    List<String> UserAccept(String requestId);
    
    // 친구 요청 수락 메서드
    FriendVO FriendAccept(String requestId, String responseId);
    
    // 이미 친구인지 확인 메서드
    List<FriendVO> checkFriend(String requestId, String responseId);
    
    // 친구 요청 수락 메서드
    int acceptFriend(String requestId, String responseId);
    
    // 친구 요청 삭제 메서드
    int deleteFriend(String requestId, String responseId);

    RegisterVO getRegisterById(String memberId);

	int deleteUser(String memberId);
}
