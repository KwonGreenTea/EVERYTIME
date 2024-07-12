package com.everytime.web.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class FileUploadController {

	@Autowired
	private String uploadPath; // Bean으로 설정된 uploadPath() 객체 주입

	// 단일 파일 업로드 수신 및 파일 저장
	@PostMapping("/imgUpload")
	public ResponseEntity<String> imgUploadPOST(@RequestParam("imgFile") MultipartFile file) { // 전송된 파일 객체 저장
		log.info("imgUploadPOST()");
		log.info("파일 이름 : " + file.getOriginalFilename());
		log.info("파일 크기 : " + file.getSize());

		// 현재 날짜를 기반으로 디렉토리 경로 생성 (예: yyyy/MM/dd)
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
        String datePath = sdf.format(new Date());

        // 날짜별 디렉토리 생성
        File dateDir = new File(uploadPath, datePath);
        if (!dateDir.exists()) {
            dateDir.mkdirs(); // 디렉토리 생성
        }
		
		// File 객체에 파일 경로 및 파일명 설정
        File savedFile = new File(dateDir, file.getOriginalFilename());
		try {
			file.transferTo(savedFile); // 실제 경로에 파일 저장
			return ResponseEntity.ok("파일 업로드 성공!"); // 성공 시 파일 업로드 성공 문자 반환
		} catch (Exception e) {
			log.error(e.getMessage());
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("파일 업로드 실패: " + e.getMessage()); // 실패 시 오류 내역 반환
		}
	} // end uploadPOST()

	// 다중 파일 업로드 수신 및 파일들 저장
	@PostMapping("/imgUploads")
	public void uploadsPost(MultipartFile[] files) { // 배열에 전송된 파일들 적용
		for (MultipartFile file : files) {
			log.info(file.getOriginalFilename());
			log.info("파일 이름 : " + file.getOriginalFilename());
			log.info("파일 크기 : " + file.getSize());
			
			// 현재 날짜를 기반으로 디렉토리 경로 생성 (예: yyyy/MM/dd)
	        SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
	        String datePath = sdf.format(new Date());

	        // 날짜별 디렉토리 생성
	        File dateDir = new File(uploadPath, datePath);
	        if (!dateDir.exists()) {
	            dateDir.mkdirs(); // 디렉토리 생성
	        }
	        
			File savedFile = new File(uploadPath, file.getOriginalFilename());
			try {
				file.transferTo(savedFile); // 실제 경로에 파일 저장
			} catch (Exception e) {
				log.error(e.getMessage());
			}
		}
	} // end uploadsPost()

} // end FileUploadController