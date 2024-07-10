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
import com.everytime.web.service.CourseService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping
@Log4j
public class CourseController {

   @Autowired
   private CourseService courseService;
   
   @PostMapping("/search")
   public String searchPOST(String type, String keyword, Model model, RedirectAttributes reAttr) { // 여기에 과목명 or 교수명 그리고 검색한 text 불러옴 
      log.info("searchPOST");
      log.info("type : " + type + " keyword : " + keyword);
      if(keyword.isEmpty()) {
    	 log.info("키워드 입력안함");
    	 reAttr.addFlashAttribute("errorMessage", "검색어를 입력해주세요");
         
         return "redirect:/lecture";
      } 
      List<CourseVO> courseList = courseService.selectCourse(type, keyword);
	  log.info(courseList);
     
      model.addAttribute("keyword" , keyword);
      model.addAttribute("courseList", courseList);
      // model - keyword, type , list결과를 보내줌
      return "course/search";
   }
   
   
   
   

}