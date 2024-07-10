package com.everytime.web.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.everytime.web.domain.RegisterVO;

import lombok.extern.log4j.Log4j;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import javax.mail.internet.MimeMessage;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;

@Log4j
@Controller
public class EmailController {

    @Autowired
    private JavaMailSender mailSender;
    
    
    @RequestMapping(value = "/sendConfirmNumber", method = RequestMethod.POST)
    @ResponseBody
    public Map emailSend(RegisterVO registerVO, Model model) {
        Map map= new HashMap();
    	log.info("emailSend()");
    	
        Random random = new Random();
        int confirmNumber = random.nextInt(999999);

        StringBuilder stringBuilder = new StringBuilder();
        String setFrom = "soldeskedu@gmail.com";
        String tomail = registerVO.getEmail();
        String title = "[에브리타임] 이메일 인증 안내";
        stringBuilder.append(String.format("안녕하세요, 에브리타임입니다.\n"));
        stringBuilder.append(String.format("이메일 인증 번호는 %06d입니다.", confirmNumber));
        String content = stringBuilder.toString();

        log.info(tomail);
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
    } // end emailSend()

}
