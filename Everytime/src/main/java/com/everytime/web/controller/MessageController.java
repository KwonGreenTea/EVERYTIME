package com.everytime.web.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.everytime.web.domain.MessageVO;
import com.everytime.web.service.MessageService;
import com.everytime.web.service.RegisterService;

import lombok.extern.log4j.Log4j;

@Controller // @Component
// - 모든종류(JSP 페이지 매핑)에 service를 호출하는 객체
@RequestMapping
@Log4j

public class MessageController {

	@Autowired
	private MessageService messageService;

	@Autowired
	private RegisterService registerService;

	@GetMapping("/message")
	public String chatGet(Model model, HttpServletRequest request) throws Exception {
		log.info("chatGet()");
		HttpSession session = request.getSession();
		String memberId = (String) session.getAttribute("memberId");
	
		Set<String> responeIdList = messageService.getMsgList(memberId);
		
		List<MessageVO> msgList = new ArrayList<>();
		for(String responseId : responeIdList) {
			MessageVO messageVO = messageService.getAllDataByResponeId(memberId, responseId);
			messageVO.setNickname(registerService.getNicknameById(responseId));
			msgList.add(messageVO);
		}

		model.addAttribute("msgList", msgList);
		
		return "chat/message";
	}

	@PostMapping("/messageSend")
	public String messageSendPost(@RequestParam("message") String message,
			@RequestParam("responseId") String responseId, Model model, RedirectAttributes reAttr,
			HttpServletRequest request) {
		log.info("messageSendPost()");

		HttpSession session = request.getSession();
		String memberId = (String) session.getAttribute("memberId");

		MessageVO messageVO = new MessageVO();
		messageVO.setMessageRequest(memberId);
		messageVO.setMessageResponse(responseId);
		messageVO.setContent(message);

		log.info(messageService.sendMsg(messageVO) + "건의 메세지가 전달되었습니다.");

		return "chat/message";
	}
}
