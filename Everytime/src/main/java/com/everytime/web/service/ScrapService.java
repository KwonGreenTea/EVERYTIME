package com.everytime.web.service;

import java.util.List;

import com.everytime.web.domain.ScrapVO;

public interface ScrapService {

	int checkIfPostScraped(int postId, String memberId);

	int postScrap(ScrapVO scrapVO);

	List<Integer> selectScrapById(String memberId);

}
