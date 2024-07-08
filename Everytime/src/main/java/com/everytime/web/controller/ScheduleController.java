package com.everytime.web.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.everytime.web.domain.FriendVO;
import com.everytime.web.domain.ScheduleVO;
import com.everytime.web.service.ScheduleService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class ScheduleController {

	@Autowired
	private ScheduleService scheduleService;

	@GetMapping("/time")
	public String timeGET(Model model, RedirectAttributes reAttr, HttpServletRequest request) {
		log.info("timeGET()");

		HttpSession session = request.getSession();
		String memberId = (String) session.getAttribute("memberId");

		if (memberId == null) {
			session.removeAttribute("memberId");
			session.invalidate();
			return "redirect:/login";
		}

		ArrayList<ScheduleVO> scheduleList = scheduleService.selectSchedulesByMemberId(memberId);

		if (scheduleList != null) {
			model.addAttribute("scheduleList", scheduleList);
		}

		return "timetable/time";
	}

	@PostMapping("/timetable")
	public String createTimetable(@ModelAttribute ScheduleVO scheduleVO, RedirectAttributes reAttr,
			HttpServletRequest request) {
		log.info("createTimetable()");

		HttpSession session = request.getSession();
		String memberId = (String) session.getAttribute("memberId");

		if (memberId == null) {
			session.removeAttribute("memberId");
			session.invalidate();
			return "redirect:/login";
		}

		scheduleVO.setMemberId(memberId);

		int result = scheduleService.createSchedule(scheduleVO);

		log.info(result + "행 시간표 테이블 추가완료");

		return "redirect:/time";
	}

	@PostMapping("/deleteSchedule")
	public ResponseEntity<Integer> deleteSchedule(@RequestBody ScheduleVO scheduleVO) {
		log.info("deleteSchedule()");

		log.info(scheduleVO);

		int result = scheduleService.deleteSchedule(scheduleVO);

		return new ResponseEntity<Integer>(result, HttpStatus.OK);
	}

	@PostMapping("/frdTime")
	public String frdtimePOST(Model model, @RequestParam("requestId") String requestId,
			@RequestParam("requestName") String requestName) {
		log.info("frdtimePOST()");

		ArrayList<ScheduleVO> scheduleList = scheduleService.selectSchedulesByMemberId(requestId);
		
		FriendVO friendVO = new FriendVO();
		friendVO.setRequestId(requestId);
		friendVO.setRequestName(requestName);
		model.addAttribute("friendVO", friendVO);
		
		if (scheduleList != null) {
			model.addAttribute("scheduleList", scheduleList);
		}

		return "friend/frdTime";
	}
}
