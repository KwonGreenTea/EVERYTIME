package com.everytime.web.controller;

import java.util.List;
import java.util.Set;

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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.everytime.web.domain.ChatListVO;
import com.everytime.web.domain.ChatVO;
import com.everytime.web.domain.RegisterVO;
import com.everytime.web.service.ChatListService;
import com.everytime.web.service.ChatService;
import com.everytime.web.service.MessageService;
import com.everytime.web.service.RegisterService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping
@Log4j
public class ChatController {

	@Autowired
	private RegisterService registerService;

	@Autowired
	private ChatService chatService;

	@Autowired
	private ChatListService chatListService;

	@Autowired
	private MessageService messageService;
	
	@GetMapping("/chat")
	public String chatGet(Model model, HttpServletRequest request) throws Exception {
		log.info("chatGet()");
		HttpSession session = request.getSession();
		String memberId = (String) session.getAttribute("memberId");
		if (memberId == null) {
			session.removeAttribute("memberId");
			session.invalidate();
			return "redirect:/login";
		} else {
			RegisterVO registerVO = registerService.getRegisterById(memberId);
			List<ChatListVO> chatList = chatListService.allRoom();
			Set<String> msgList = messageService.getMsgList(memberId);
			
			model.addAttribute("msgList", msgList);
			model.addAttribute("chatList", chatList);
			model.addAttribute("registerVO", registerVO);

			return "chat/chat";
		}
	}

	@PostMapping("/chat/create")
	public ResponseEntity<Integer> roomMakePost(@RequestParam("roomName") String chat_title) {
		log.info("roomMakePost()");

		int result = chatListService.createRoom(chat_title);

		return new ResponseEntity<Integer>(result, HttpStatus.OK);
	}

	@PostMapping("/chat/insert")
	public ResponseEntity<Integer> chatInsertPost(@RequestBody ChatVO chatVO) {
		log.info("chatInsertPost()");

		int result = chatService.insert(chatVO);

		return new ResponseEntity<Integer>(result, HttpStatus.OK);
	}

}
