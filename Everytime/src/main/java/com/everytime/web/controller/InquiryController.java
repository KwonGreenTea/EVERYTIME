package com.everytime.web.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.everytime.web.domain.InquiryVO;
import com.everytime.web.domain.RegisterVO;
import com.everytime.web.service.InquiryService;
import com.everytime.web.service.RegisterService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class InquiryController {

	@Autowired
	private RegisterService registerService;

	@Autowired
	private InquiryService inquiryService;

	@GetMapping("inquiry")
	public String inquiryGET(HttpServletRequest request, Model model) {
		log.info("inquiryGET()");

		HttpSession session = request.getSession();
		String memberId = (String) session.getAttribute("memberId");

		if (memberId == null) {
			session.removeAttribute("memberId");
			session.invalidate();
			return "redirect:/login";
		} else {
			RegisterVO registerVO = registerService.getRegisterById(memberId);
			log.info(registerVO);
			model.addAttribute("registerVO", registerVO);
		}
		return "mypage/inquiry";
	}

	@PostMapping("inquiry")
	public String inquiryPOST(InquiryVO inquiryVO, RedirectAttributes reAttr) throws Exception {
		log.info("inquiryPOST()");
		int result = inquiryService.createInquiry(inquiryVO);
		log.info(result + "개 문의 성공");
		
		return "redirect:/main";
	}
}
