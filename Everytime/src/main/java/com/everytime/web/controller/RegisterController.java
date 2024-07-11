package com.everytime.web.controller;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
    
    @Autowired
    private JavaMailSender mailSender;
    
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
    
 // 이메일 인증 및 이메일 중복 확인
 	@RequestMapping(value = "/sendConfirmNumber", method = RequestMethod.POST)
     @ResponseBody
     public Map emailSend(RegisterVO registerVO, Model model) {
         Map map= new HashMap();
     	log.info("emailSend()");
        
         String tomail = registerVO.getEmail();

         log.info(tomail);
         int result = registerService.checkEmail(tomail);
         if(result > 0) {
         	map.put("status", "exists");
         	map.put("message", "이미 사용 중인 이메일입니다. 아이디 찾기로 이동하시겠습니까?");
         	return map;
         } else {
         	
         	Random random = new Random();
             int confirmNumber = random.nextInt(999999);
             
         	StringBuilder stringBuilder = new StringBuilder();
             String setFrom = "soldeskedu@gmail.com";
     		String title = "[에브리타임] 이메일 인증 안내";
             stringBuilder.append(String.format("안녕하세요, 에브리타임입니다.\n"));
             stringBuilder.append(String.format("이메일 인증 번호는 %06d입니다.", confirmNumber));
             String content = stringBuilder.toString();
             log.info(confirmNumber);
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
         	map.put("confirmNumber", confirmNumber);
         	
         	return map;
         }
         
     } // end emailSend()
    
	
}