
package com.everytime.web.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.everytime.web.domain.ScrapVO;
import com.everytime.web.persistence.PostMapper;
import com.everytime.web.persistence.ScrapMapper;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class ScrapServiceImple implements ScrapService {
	
	@Autowired
	private ScrapMapper scrapMapper;
	
	@Autowired
	private PostMapper postMapper;
	
	@Override
	public int checkIfPostScraped(int postId, String memberId) {
		return scrapMapper.checkIfPostScraped(postId, memberId);
	}

	@Transactional(value = "transactionManager") 
	@Override
	public int postScrap(ScrapVO scrapVO) {
		log.info("postScrap()");
		int insertPostScrapResult = scrapMapper.postScrap(scrapVO);
		log.info(insertPostScrapResult + "행 스크랩 정보 등록");
		 
		int postId = scrapVO.getPostId(); 
		int updatePostScrape = postMapper.updatePostScrap(postId);
		log.info(updatePostScrape + "행 스크랩 업데이트 완료");
		return 1;
	}

	@Override
	public List<Integer> selectScrapById(String memberId) {
		return scrapMapper.selectScrapById(memberId);
	}
	
	@Transactional(value = "transactionManager") 
	@Override
	public int postCancelScrap(ScrapVO scrapVO) {
		log.info("postCancelScrap()");
		int deletePostScrapResult = scrapMapper.postDeleteScrap(scrapVO);
		log.info(deletePostScrapResult + "행 스크랩 삭제");
		
		int postId = scrapVO.getPostId(); 
		int deletePostScrape = postMapper.deletePostScrap(postId);
		log.info(deletePostScrape + "행 스크랩 업데이트 완료");
		return 1;
	}

	@Override
	public int postChkScrap(ScrapVO scrapVO) {
		return scrapMapper.postChkScrap(scrapVO);
	}
	
}
