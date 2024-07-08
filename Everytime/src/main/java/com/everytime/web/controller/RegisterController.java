package com.everytime.web.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.everytime.web.domain.RegisterVO;
import com.everytime.web.service.RegisterService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class RegisterController {
    
    @Autowired
    private RegisterService registerService;
    
    // 회원가입 페이지 이동(GET)
    @GetMapping("/register")
    public void registerGET() {
        log.info("registerGET()");
    }
    
    // 회원 정보 등록(POST)
    @PostMapping("/register")
    public String registerPOST(RegisterVO registerVO, RedirectAttributes reAttr) {
        log.info("registerPost()");
        int result = registerService.createRegister(registerVO);
        log.info(result + " 행 등록");
        
        return "redirect:/login";
    }
    
    // 아이디 중복 확인(POST)
    @PostMapping("/checkId")
    @ResponseBody
    public int checkId(@RequestParam("memberId") String memberId, RedirectAttributes reAttr) {
    	log.info("checkId()");
    	int result = registerService.checkId(memberId);
    	return result;
    }

    
    // 로그인 페이지 이동(GET)
    @GetMapping("/login")
    public void loginGET() {
        log.info("loginGET()");
    }
    
    // 로그인 처리(POST)
    @PostMapping("/login")
    public String loginPOST(String memberId, String password, HttpServletRequest request, RedirectAttributes reAttr) {
        log.info("loginPOST()");
        
        RegisterVO registerVO = registerService.getRegisterById(memberId);
        if (registerVO != null && registerVO.getPassword().equals(password)) {
            // 세션에 로그인 정보 저장
            HttpSession session = request.getSession();
            session.setMaxInactiveInterval(3600);
            session.setAttribute("memberId", memberId);
            
            // 로그인 성공 시 성공 메시지를 리다이렉트 시킴
            reAttr.addFlashAttribute("successMessage", "로그인 되었습니다.");
            return "redirect:/main";
        } else {
            // 로그인 실패 시 에러 메시지를 리다이렉트 시킴
            reAttr.addFlashAttribute("errorMessage", "아이디 또는 비밀번호가 잘못되었습니다.");
            return "redirect:/login";
        }
    }
    
    // 로그아웃 처리
    @GetMapping("/logout")
    public String logout(HttpServletRequest request, RedirectAttributes reAttr) throws Exception{
        log.info("logout()");
        HttpSession session = request.getSession();
        if(session.getAttribute("memberId") != null) {
           session.removeAttribute("memberId");
           session.invalidate(); // 세션 무효화
        }
        return "redirect:/login";
    }
    
    // 아이디/비밀번호 찾기(GET)
    @GetMapping("/forgot")
    public void forgotGET() {
    	log.info("forgotGET()");
    }
    
    // 아이디/비밀번호 찾기(POST)
    @GetMapping("/forgot/password")
    public void forgotPwGET() {
    	log.info("forgotPwGET()");
    }
    
	
}