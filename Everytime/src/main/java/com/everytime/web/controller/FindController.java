package com.everytime.web.controller;

import java.util.HashMap;
import java.util.Map;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.everytime.web.domain.RegisterVO;
import com.everytime.web.service.RegisterService;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class FindController {
	
	@Autowired
	private RegisterService registerService;
	
	@Autowired
    private JavaMailSender mailSender;
	
	// 아이디 찾기(GET)
	@RequestMapping(value = "/findId", method = RequestMethod.GET)
	public void findIdGET() { log.info("findIdGET()"); } // end findIdGET()
		
	// 아이디 찾기(POST)
	@RequestMapping(value = "/findId", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> findId(RegisterVO registerVO, Model model) {
		Map<String, Object> map = new HashMap<>();
		log.info("findId()");
		
		String tomail = registerVO.getEmail();
		log.info(tomail);
		int result = registerService.checkEmail(tomail);
		if (result > 0) {
			String memberId = registerService.getMemberIdByEmail(tomail);

			StringBuilder stringBuilder = new StringBuilder();
			String setFrom = "soldeskedu@gmail.com";
			String title = "[에브리타임] 아이디 찾기 안내";
			stringBuilder.append(String.format("안녕하세요, 에브리타임입니다.\n"));
			stringBuilder.append(String.format("본 이메일에 해당하는 아이디는 %s입니다.", memberId));
			String content = stringBuilder.toString();
			log.info(memberId);

			try {
				MimeMessage msg = mailSender.createMimeMessage();
				MimeMessageHelper msgHelper = new MimeMessageHelper(msg, true, "UTF-8");
					
				msgHelper.setFrom(setFrom);
				msgHelper.setTo(tomail);
				msgHelper.setSubject(title);
				msgHelper.setText(content);
					
				mailSender.send(msg); // 이메일 보내기
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
			map.put("status", "success");
			map.put("memberId", memberId);
		} else {
			map.put("status", "fail");
			map.put("message", "등록된 회원 정보를 찾을 수 없습니다.");
		}
		return map;
	}
}
