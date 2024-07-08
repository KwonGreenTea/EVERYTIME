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
import com.everytime.web.domain.ReviewVO;
import com.everytime.web.service.ReviewService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping
@Log4j

public class ReviewController {

   @Autowired
   private ReviewService reviewService;

   @GetMapping("/course")
   public String courseGET(Model model) {
      log.info("courseGET()");
      // 모든 리뷰를 가져온다
      // List<ReviewVO> reviewList = reviewService.selectAllReview();

      // model.addAttribute("reviewList", reviewList);
      
      return "course/course";
   }

   @GetMapping("write")
   public void writeGET(Integer courseId, Model model) {
      log.info("writeGET()");
      
      CourseVO courseVO = reviewService.getCourseById(courseId);
      log.info(courseVO.getCourseId());
      log.info(courseVO.getProfessor());
      model.addAttribute(courseVO);
   }
   
   @PostMapping("/write")
   public String writePOST(ReviewVO reviewVO, RedirectAttributes reAttr , Model model) {
      log.info("writePOST()");
      log.info("ReviewVO : " + reviewVO.toString());

      int result = reviewService.insertReview(reviewVO);
      log.info(result + "행 등록");
      
      
      return "redirect:/view";
   }

   @GetMapping("/view")
   public void viewGET(Model model, Integer courseId) { // 강의 이름을 입력받아서 조회

      List<ReviewVO> reviewList = new ArrayList<ReviewVO>();
      
      if (courseId != null) {
         CourseVO courseVO = reviewService.getCourseById(courseId);
         reviewList = reviewService.selectAllReview(courseId);
         if (courseVO != null) {
            model.addAttribute("courseVO" , courseVO);
            model.addAttribute("reviewList", reviewList);
         } else {
            log.info("존재하지않는 강의");
         }
      } else {
         log.info("존재하지않는 강의");
      }
   }

}