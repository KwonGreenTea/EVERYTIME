package com.everytime.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.everytime.web.domain.ReplyVO;
import com.everytime.web.service.ReplyService;

import lombok.extern.log4j.Log4j;


@Controller // @Component
//- 클라이언트(JSP 페이지 등)와 service를 연결하는 역할	
@RequestMapping(value = "/reply")
@Log4j
public class ReplyController {

	@Autowired
	private ReplyService replyService;
	
	@PostMapping("create")
	public String createPOST(ReplyVO replyVO, RedirectAttributes reAttr) {
		log.info("createReply()");
		log.info("postVO = " + replyVO.toString());
		int result = replyService.createReply(replyVO);
		log.info(result + "행 등록");
		return "redirect:/post/detail";
	}
}
