package com.everytime.web.util;

import java.io.File;
import java.io.IOException;
import java.text.DecimalFormat;
import java.util.Calendar;

import org.apache.commons.io.FilenameUtils;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.log4j.Log4j;

@Log4j
public class FileUploadUtil {
    
    /**
     * 파일 이름에서 확장자를 제외한 실제 파일 이름을 추출
     * 
     * @param fileName 파일 이름
     * @return 실제 파일 이름
     */
    public static String subStrName(String fileName) {
    	// FilenameUtils.normalize() : 파일 이름 정규화 메서드
        String normalizeName = FilenameUtils.normalize(fileName);
        int dotIndex = normalizeName.lastIndexOf('.');

        String realName = normalizeName.substring(0, dotIndex);
        return realName;
    }
    
    /**
     * 파일 이름에서 확장자를 추출
     * 
     * @param fileName 파일 이름
     * @return 확장자
     */
    public static String subStrExtension(String fileName) {
        // 파일 이름에서 마지막 '.'의 인덱스를 찾습니다.
        int dotIndex = fileName.lastIndexOf('.');

        // '.' 이후의 문자열을 확장자로 추출합니다.
        String extension = fileName.substring(dotIndex + 1);

        return extension;
    }
    
    /**
     * 파일이 저장되는 폴더 이름을 날짜 형식(yyyy/MM/dd)으로 생성
     * 
     * @return 날짜 형식의 폴더 이름
     */
    public static String makeDatePath() {
        Calendar calendar = Calendar.getInstance();
        
        String yearPath = String.valueOf(calendar.get(Calendar.YEAR));
        log.info("yearPath: " + yearPath);
        
        String monthPath = yearPath
                + File.separator
                + new DecimalFormat("00")
                    .format(calendar.get(Calendar.MONTH) + 1);
        log.info("monthPath: " + monthPath);
        
        
        String datePath = monthPath
                + File.separator
                + new DecimalFormat("00")
                    .format(calendar.get(Calendar.DATE));
        log.info("datePath: " + datePath);
        
        return datePath;
    }
    
    /**
     * 파일을 저장
     * 
     * @param uploadPath 파일 업로드 경로
     * @param file 업로드된 파일
     * @param uuid UUID
     */
    public static void saveFile(String uploadPath, MultipartFile file, String uuid) {
        
        File realUploadPath = new File(uploadPath, makeDatePath());
        if (!realUploadPath.exists()) {
            realUploadPath.mkdirs();
            log.info(realUploadPath.getPath() + " successfully created.");
        } else {
            log.info(realUploadPath.getPath() + " already exists.");
        }
        
        File saveFile = new File(realUploadPath, uuid);
        try {
            file.transferTo(saveFile);
            log.info("file upload scuccess");
        } catch (IllegalStateException e) {
            log.error(e.getMessage());
        } catch (IOException e) {
            log.error(e.getMessage());
        } 
        
    }
    
    /**
     * 파일을 삭제
     * 
     * @param uploadPath 파일 업로드 경로
     * @param path 파일이 저장된 날짜 경로
     * @param chgName 저장된 파일 이름
     */
    public static void deleteFile(String uploadPath, String path, String chgName) {
        // 삭제할 파일의 전체 경로 생성
        String fullPath = uploadPath + File.separator + path + File.separator + chgName;
        
        // 파일 객체 생성
        File file = new File(fullPath);
        
        // 파일이 존재하는지 확인하고 삭제
        if(file.exists()) {
            if(file.delete()) {
                System.out.println(fullPath + " file delete success.");
            } else {
                System.out.println(fullPath + " file delete failed.");
            }
        } else {
            System.out.println(fullPath + " file not found.");
        }
    }
    
}
