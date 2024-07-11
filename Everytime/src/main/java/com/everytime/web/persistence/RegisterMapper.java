package com.everytime.web.persistence;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.everytime.web.domain.RegisterVO;

@Mapper
public interface RegisterMapper {
   int insert(RegisterVO registerVO); // ȸ       

   RegisterVO selectByRegisterId(String memberId); //    ̵    ȸ

   List<Integer> selectIdList(); //

   int update(RegisterVO registerVO); // ȸ       

   int delete(String memberId); // ȸ   Ż  

   int updatePassword(RegisterVO registerVO);

   int updateEmail(RegisterVO registerVO);

   int updateNickname(RegisterVO registerVO);

   int checkId(String memberId);

   int verifyPw(RegisterVO registerVO);

   int updatePassword(@Param("memberId") String memberId, @Param("password") String password);

   int updateEmail(@Param("memberId") String memberId, @Param("email") String email);

   int updateNickname(@Param("memberId") String memberId, @Param("nickname") String nickname);

   String getNameById(String memberId);
   
   int checkEmail(String email);
   
   String getMemberIdByEmail(String email);

}