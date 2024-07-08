package com.everytime.web.controller;

import java.util.UUID;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.everytime.web.domain.InquiryVO;
import com.everytime.web.domain.ProfileVO;
import com.everytime.web.domain.RegisterVO;
import com.everytime.web.service.FriendService;
import com.everytime.web.service.InquiryService;
import com.everytime.web.service.ProfileService;
import com.everytime.web.service.RegisterService;
import com.everytime.web.service.ScheduleService;
import com.everytime.web.util.FileUploadUtil;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class MypageController {

	@Autowired
	private String uploadPath;
	
	@Autowired
	private RegisterService registerService;
	
	@Autowired
	private InquiryService inquiryService;
	
	@Autowired
    private ScheduleService scheduleService;
    
    @Autowired
    private FriendService friendService;
    
    @Autowired
    private ProfileService profileService;

	@GetMapping("/mypage")
	public String mypageGET(Model model, HttpServletRequest request, RedirectAttributes reAttr) throws Exception {
		log.info("mypage()");
		HttpSession session = request.getSession();
		String memberId = (String) session.getAttribute("memberId");
		
		RegisterVO registerVO;
		if (memberId == null) {
			session.removeAttribute("memberId");
			session.invalidate();
			return "redirect:/login";
		} else {
			registerVO = registerService.getRegisterById(memberId);
			ProfileVO profileVO = profileService.getProfileById(memberId);
			
			String imgSource;
	        if (profileVO != null) {
	            // 파일의 경로를 가져옴
	        	// 파일 참조를 위해 "\" -> "/"로 수정
	        	String profilePath = profileVO.getProfilePath();
	        	 // 문자열을 분리
	        	String[] parts = profilePath.split("\\\\");
	        	String year = parts[0];
	            String month = parts[1];
	            String day = parts[2];
	        	
	        	// 파일의 확장명을 가져옴
	            String profileExtension = profileVO.getProfileExtension();
	            
	            // 파일의 이름을 가져옴
	            String profileName = profileVO.getProfileRealName();
	            
	            imgSource = "profileImage/" + year + "/" + month + "/" + day + "/" + profileName + "." + profileExtension;
	        } else { 
	        	// 기본 이미지 경로
	            imgSource = "profileImage/profile/profile.png";
	        }
	        
			model.addAttribute("imgSource", imgSource);
			model.addAttribute("registerVO", registerVO);
		}

		return "mypage/mypage";
	}

	@PostMapping("/mypage/verifyPw")
	public ResponseEntity<Integer> verifyPw(@RequestBody RegisterVO registerVO) {
		// log.info("verifyPw()");

		int result = registerService.verifyPw(registerVO);

		return new ResponseEntity<Integer>(result, HttpStatus.OK);
	}

	@PostMapping("/mypage/password")
	public String changePwPOST(Model model, HttpServletRequest request, RedirectAttributes reAttr,
			@RequestParam("id") String memberId, @RequestParam("pw") String password) throws Exception {
		HttpSession session = request.getSession();
		String sessionChk = (String) session.getAttribute("memberId");
		if (sessionChk == null) {
			session.removeAttribute("memberId");
			session.invalidate();
			return "redirect:/login";
		} else {
			log.info("changePwPOST()");
			RegisterVO registerVO = new RegisterVO(memberId, password, "", "", "", "");
			model.addAttribute("registerVO", registerVO);
			return "mypage/changePw";
		}
	}

	@PostMapping("/mypage/password/do")
	public String changePwDataPOST(HttpServletRequest request, RedirectAttributes reAttr,
			@RequestParam("id") String memberId, @RequestParam("newPw") String password) throws Exception {
		HttpSession session = request.getSession();
		String sessionChk = (String) session.getAttribute("memberId");
		if (sessionChk == null) {
			session.removeAttribute("memberId");
			session.invalidate();
			return "redirect:/login";
		} else {
			log.info("changePwDataPOST()");
			int rsl = registerService.updatePassword(memberId, password);
			log.info("아이디 : " + memberId + ", 새로운 비밀번호 : " + password + "으로 변경. " + rsl + "행 수정 완료");
			return "redirect:/main";
		}
	}

	@PostMapping("/mypage/email")
	public String changeEmailPOST(Model model, HttpServletRequest request, RedirectAttributes reAttr,
			@RequestParam("id") String memberId, @RequestParam("email") String email) throws Exception {
		HttpSession session = request.getSession();
		String sessionChk = (String) session.getAttribute("memberId");
		if (sessionChk == null) {
			session.removeAttribute("memberId");
			session.invalidate();
			return "redirect:/login";
		} else {
			log.info("changeEmailPOST()");
			RegisterVO registerVO = new RegisterVO(memberId, "", "", "", email, "");
			model.addAttribute("registerVO", registerVO);
			return "mypage/changeEmail";
		}
	}

	@PostMapping("/mypage/email/do")
	public String changeEmailDataPOST(HttpServletRequest request, RedirectAttributes reAttr,
			@RequestParam("id") String memberId, @RequestParam("newEmail") String email) throws Exception {
		HttpSession session = request.getSession();
		String sessionChk = (String) session.getAttribute("memberId");
		if (sessionChk == null) {
			session.removeAttribute("memberId");
			session.invalidate();
			return "redirect:/login";
		} else {
			log.info("changeNickDataPOST()");
			int rsl = registerService.updateEmail(memberId, email);
			log.info("아이디 : " + memberId + ", 새로운 이메일 : " + email + "으로 변경. " + rsl + "행 수정 완료");
			return "redirect:/main";
		}
	}

	@PostMapping("/mypage/nickname")
	public String changeNickPOST(Model model, HttpServletRequest request, RedirectAttributes reAttr,
			@RequestParam("id") String memberId, @RequestParam("nickname") String nickname) throws Exception {
		HttpSession session = request.getSession();
		String sessionChk = (String) session.getAttribute("memberId");
		if (sessionChk == null) {
			session.removeAttribute("memberId");
			session.invalidate();
			return "redirect:/login";
		} else {
			log.info("changeNickPOST()");
			RegisterVO registerVO = new RegisterVO(memberId, "", nickname, "", "", "");
			model.addAttribute("registerVO", registerVO);
			return "mypage/changeNick";
		}
	}

	@PostMapping("/mypage/nickname/do")
	public String changeNickDataPOST(HttpServletRequest request, RedirectAttributes reAttr,
			@RequestParam("id") String memberId, @RequestParam("newNickname") String nickname) throws Exception {
		HttpSession session = request.getSession();
		String sessionChk = (String) session.getAttribute("memberId");
		if (sessionChk == null) {
			session.removeAttribute("memberId");
			session.invalidate();
			return "redirect:/login";
		} else {
			log.info("changeNickDataPOST()");
			int rsl = registerService.updateNickname(memberId, nickname);
			log.info("아이디 : " + memberId + ", 새로운 닉네임 : " + nickname + "으로 변경. " + rsl + "행 수정 완료");
			return "redirect:/main";
		}
	}
	
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
		 
		return "redirect:/main";
	}
	
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
        	
        	log.info(result + "명의 회원 탈퇴");
        	
            session.invalidate(); // 세션 무효화
            reAttr.addFlashAttribute("successMessage", "회원 탈퇴되었습니다.");
            return "redirect:/login";
        } else {
            reAttr.addFlashAttribute("errorMessage", "계정 비밀번호가 올바르지 않습니다.");
            return "redirect:/unregister";
        }
    }
    
    // 첨부 파일 업로드 처리(POST)
 	@PostMapping("/imgAttach")
 	public String imgAttachPOST(ProfileVO profileVO) {
 		log.info("imgAttachPOST()");
 		log.info("profileDTO = " + profileVO);
 		MultipartFile file = profileVO.getFile();
 		
 		// UUID 생성
 		String chgName = UUID.randomUUID().toString();
 		// 파일 저장
 		FileUploadUtil.saveFile(uploadPath, file, chgName);

 		// 파일 경로 설정
 		profileVO.setProfilePath(FileUploadUtil.makeDatePath());
 		// 파일 실제 이름 설정
 		profileVO.setProfileRealName(FileUploadUtil.subStrName(file.getOriginalFilename()));
 		// 파일 변경 이름(UUID) 설정
 		profileVO.setProfileChgName(chgName);
 		// 파일 확장자 설정
 		profileVO.setProfileExtension(FileUploadUtil.subStrExtension(file.getOriginalFilename()));
 		// DB에 첨부 파일 정보 저장
 		log.info(profileService.createProfile(profileVO) + "행 등록");

 		return "redirect:/mypage";
 	} // end imgAttachPOST()
}
