package com.everytime.web.config;

import javax.servlet.Filter;

import org.springframework.web.filter.CharacterEncodingFilter;
import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

//web.xml을 대체하는 클래스
public class WebConfig extends AbstractAnnotationConfigDispatcherServletInitializer {

    // root application context(Root WebApplicationContext)를 설정하는 메서드
    @Override
    protected Class<?>[] getRootConfigClasses() {
        return new Class[] { RootConfig.class }; // RootConfig 클래스를 반환
    }

    // servlet application context(Servlet WebApplicationContext)를 설정하는 메서드
    @Override
    protected Class<?>[] getServletConfigClasses() {
        return new Class[] { ServletConfig.class }; // ServletConfig 클래스를 반환
    }

    // Servlet Mapping을 설정하는 메서드
    @Override
    protected String[] getServletMappings() {
        return new String[] { "/" }; // 기본 경로를 설정
    }   
    
    // Filter 설정을 위한 메서드
    @Override
    protected Filter[] getServletFilters() {
        CharacterEncodingFilter encodingFilter = new CharacterEncodingFilter();
        encodingFilter.setEncoding("UTF-8");
        encodingFilter.setForceEncoding(true);
        
        return new Filter[] { encodingFilter };
    }
}
