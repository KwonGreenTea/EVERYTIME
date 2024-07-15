package com.everytime.web.persistence;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.everytime.web.domain.ScrapVO;

@Mapper
public interface ScrapMapper {

	int checkIfPostScraped(@Param("postId") int postId, @Param("memberId") String memberId);

	int postScrap(ScrapVO scrapVO);

	List<Integer> selectScrapById(String memberId);
	
}
