package com.everytime.web.persistence;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;


import com.everytime.web.domain.CourseVO;

@Mapper
public interface CourseMapper {
    
    // 과목명으로 검색
    List<CourseVO> courseName_search(String courseName);

    // 교수명으로 검색
    List<CourseVO> professor_search(String professor);

    CourseVO selectOne(int courseId);
    
}
