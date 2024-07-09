package com.everytime.web.controller;

import java.util.ArrayList;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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
   public String searchPOST(String type, String keyword, Model model) { // 여기에 과목명 or 교수명 그리고 검색한 text 불러옴 
      log.info("searchPOST");
      log.info("type : " + type + " keyword : " + keyword);
      
      List<CourseVO> courseList = new ArrayList<CourseVO>();
      if(type.equals("courseName")) {
         courseList = courseService.courseName_search(keyword);
      } else if(type.equals("professor")) {
         courseList = courseService.professor_search(keyword);
      } else {
         log.info("검색 타입을 선택해주세요");
      }
      log.info(courseList);
      
      model.addAttribute("courseList", courseList);
      // model - keyword, type , list결과를 보내줌
      return "lecture/search";
   }
   
   @GetMapping("/search")
   public void searchGET() { // keyword,type,list를 받고
      log.info("searchGET");
     
      
   }
   
   
   
   

}