package com.everytime.web.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.everytime.web.domain.CourseVO;
import com.everytime.web.domain.ReviewLikeVO;
import com.everytime.web.domain.ReviewVO;
import com.everytime.web.service.ReviewService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping
@Log4j

public class ReviewController {

	@Autowired
	private ReviewService reviewService;

	@GetMapping("/lecture")
	public String lectureGET(Model model) {
		log.info("lectureGET()");
		// 모든 리뷰를 가져온다
		List<ReviewVO> reviewList = reviewService.selectReview();

		
		log.info(reviewList);
		model.addAttribute("reviewList", reviewList);
		
		return "course/lecture";
	
	}

	@GetMapping("/write")
	public String writeGET(Integer courseId, Model model) {
		log.info("writeGET()");

		CourseVO courseVO = reviewService.getCourseById(courseId);
		log.info(courseVO.getCourseId());
		log.info(courseVO.getCourseName());
		log.info(courseVO.getProfessor());
		model.addAttribute(courseVO);
		
		return "course/write";
	}

	@PostMapping("/write")
	public String writePOST(ReviewVO reviewVO, RedirectAttributes reAttr, Model model) {
		log.info("writePOST()");
		log.info("ReviewVO : " + reviewVO.toString());

		// review 테이블에 리뷰 삽입
		int result = reviewService.insertReview(reviewVO);
		
		// course 테이블에 courseRate값 업데이트
		int courseId = reviewVO.getCourseId();
		int courseRate = reviewVO.getCourseRate();
		
		log.info("courseId");
		log.info("courseRate");
		reviewService.updateCourseRate(courseId, courseRate);
		
		log.info(result + "행 등록");

		return "redirect:/view?courseId=" + reviewVO.getCourseId();
	}

	@GetMapping("/view")
	public String viewGET(Model model, Integer courseId) { // 강의 이름을 입력받아서 조회
		log.info("viewGET()");
		List<ReviewVO> reviewListByCourseId = new ArrayList<ReviewVO>();
		List<ReviewVO> topLikeReviewList = new ArrayList<ReviewVO>();
		if (courseId != null) {
			CourseVO courseVO = reviewService.getCourseById(courseId);
			reviewListByCourseId = reviewService.selectReviewByCourseId(courseId);
			topLikeReviewList = reviewService.selectTopLikeReviewByCourseId(courseId);
			log.info("courseVO : " + courseVO);
			log.info("reviewVO : " + reviewListByCourseId);
			log.info("topLike : " + topLikeReviewList);

			log.info(reviewListByCourseId.size());

			if (courseVO != null) {
				model.addAttribute("courseVO", courseVO);
				model.addAttribute("reviewListByCourseId", reviewListByCourseId);
				model.addAttribute("topLikeReviewList", topLikeReviewList);
				return "course/view";
			} else {
				log.info("존재하지않는 강의");
				return "";
			}
		} else {
			log.info("존재하지않는 강의");
			return "";
		}
	}

	@GetMapping("/review")
	public String reviewGET(Model model, Integer courseId) {
		log.info("reviewGET()");

		log.info("courseId : " + courseId);
		List<ReviewVO> reviewListByCourseId = reviewService.selectReviewByCourseId(courseId);
		
		CourseVO courseVO = reviewService.getCourseById(courseId);
		model.addAttribute("courseVO", courseVO);
		model.addAttribute("reviewListByCourseId", reviewListByCourseId);
	
		return "course/review";
	}

	
	@PostMapping("/rateFilter")
	public String rateFilterPOST(Model model, Integer courseId, Integer courseRate,RedirectAttributes reAttr) {
		log.info("rateFilterPOST()");
		log.info("courseId : " + courseId + " courseRate : " + courseRate);
		
		if(courseRate == 0) {
			return "redirect:/review?courseId=" + courseId; 
		} 
		
		List<ReviewVO> reviewListByCourseId = reviewService.selectRateFilterdReview(courseId, courseRate);
		log.info("reviewListBycourseId : " + reviewListByCourseId);
		
		if(reviewListByCourseId.isEmpty()) {
			log.info("데이터없음");
			reAttr.addFlashAttribute("errorMessage", "조건에 맞는 데이터가 없습니다.");
			return "redirect:/review?courseId=" + courseId; 
		}
		
		CourseVO courseVO = reviewService.getCourseById(courseId);
		
		model.addAttribute("courseVO", courseVO);
		model.addAttribute("reviewListByCourseId", reviewListByCourseId);
		
		
		return "course/review";
	}
	
	
	@PostMapping("/sortFilter")
	public String sortFilterPOST(Model model, Integer courseId, String sortCondition) {
		log.info("sortFilterPOST()");
		
		log.info("courseId : " + courseId + " sortCondtion : " + sortCondition);
		
		List<ReviewVO> reviewListByCourseId = reviewService.selectSortFilterReview(courseId, sortCondition);
		CourseVO courseVO = reviewService.getCourseById(courseId);
		
		model.addAttribute("courseVO", courseVO);
		model.addAttribute("reviewListByCourseId", reviewListByCourseId);
		
		return "course/review";
		
	}
	
}
