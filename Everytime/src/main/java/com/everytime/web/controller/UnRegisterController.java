package com.everytime.web.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.everytime.web.service.FriendService;
import com.everytime.web.service.ProfileService;
import com.everytime.web.service.RegisterService;
import com.everytime.web.service.ScheduleService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class UnRegisterController {

	@Autowired
	private RegisterService registerService;

	@Autowired
	private ScheduleService scheduleService;

	@Autowired
	private FriendService friendService;

	@Autowired
	private ProfileService profileService;

	// 회원 탈퇴(GET)
	@GetMapping("/unregister")
	public String unregister() {
		log.info("unregisterGET()");
		return "mypage/unregister";
	}

	// 회원 탈퇴(POST)
	@PostMapping("/unregister")
	public String unregisterPOST(String password, HttpSession session, RedirectAttributes reAttr) throws Exception {
		log.info("unregisterPOST()");

		// 세션에서 사용자 아이디 가져오기
		String memberId = (String) session.getAttribute("memberId");

		boolean success = registerService.unregister(memberId, password);
		if (success) {
			int result;
			result = friendService.deleteUser(memberId);
			result = scheduleService.deleteUser(memberId);
			result = profileService.deleteProfile(memberId);

			log.info(result + "명의 회원 탈퇴");

			session.invalidate(); // 세션 무효화
			reAttr.addFlashAttribute("successMessage", "회원 탈퇴되었습니다.");
			return "redirect:/login";
		} else {
			reAttr.addFlashAttribute("errorMessage", "계정 비밀번호가 올바르지 않습니다.");
			return "redirect:/unregister";
		}
	}
}
