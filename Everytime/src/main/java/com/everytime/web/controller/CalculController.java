package com.everytime.web.controller;

import java.util.ArrayList;
import java.util.HashSet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.everytime.web.domain.CalculatorVO;
import com.everytime.web.domain.ScheduleVO;
import com.everytime.web.service.CalculatorService;
import com.everytime.web.service.ScheduleService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class CalculController {

	@Autowired
	private CalculatorService calculatorService;

	@Autowired
	private ScheduleService scheduleService;

	@GetMapping("/calculator")
	public String calculatorGET(Model model, RedirectAttributes reAttr, HttpServletRequest request) {
		log.info("calculatorGET()");

		HttpSession session = request.getSession();
		String memberId = (String) session.getAttribute("memberId");

		if (memberId == null) {
			session.removeAttribute("memberId");
			session.invalidate();
			return "redirect:/login";
		}

		ArrayList<CalculatorVO> list = calculatorService.selectAllDataByMemberId(memberId);
		
		if (!list.isEmpty()) {
		    model.addAttribute("calculatorList", list);
		} else {
		    ArrayList<ScheduleVO> tmpList = scheduleService.selectSchedulesByMemberId(memberId);

		    if (tmpList != null) {
		        HashSet<String> courseNames = new HashSet<>();
		        ArrayList<ScheduleVO> scheduleList = new ArrayList<>();

		        for (ScheduleVO scheduleVO : tmpList) {
		            if (courseNames.add(scheduleVO.getCourseName())) {
		                scheduleList.add(scheduleVO);
		                int result = calculatorService.insertTimeTable(scheduleVO);
		                log.info(result + "개 시간표 입력 성공");
		            }
		        }
		        ArrayList<CalculatorVO> calculatorList = calculatorService.selectAllDataByMemberId(memberId);
		        model.addAttribute("calculatorList", calculatorList);
		    }
		}
		return "calculator/calculator";
	}

	@PostMapping("calculator/update")
	public ResponseEntity<Integer> calculatorUpdatePOST(HttpServletRequest request, @RequestBody CalculatorVO calculatorVO) {
		log.info("calculatorUpdatePOST");
		
		HttpSession session = request.getSession();
		String memberId = (String) session.getAttribute("memberId");
		
		calculatorVO.setMemberId(memberId);
		int num, result = 0;
		log.info(result);
		if(calculatorVO.getCalNo() == 0) {
			result = calculatorService.insert(calculatorVO);
			num = calculatorService.selectFinalCalNo(memberId);
		} else {
			result = calculatorService.update(calculatorVO);
			num = calculatorVO.getCalNo();
		}	
		
		return new ResponseEntity<Integer>(num, HttpStatus.OK);
	}
	
	@PostMapping("calculator/delete")
	public ResponseEntity<Integer> calculatorDeletePOST(HttpServletRequest request) {
		log.info("calculatorDeletePOST");
		
		HttpSession session = request.getSession();
		String memberId = (String) session.getAttribute("memberId");
		
		int result = calculatorService.delete(memberId);
		
		return new ResponseEntity<Integer>(result, HttpStatus.OK);
	}
}
