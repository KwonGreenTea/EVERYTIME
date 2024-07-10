package com.everytime.web.persistence;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.everytime.web.domain.CourseVO;


@Mapper
public interface CourseMapper {
    
    // 검색 기능
    List<CourseVO> selectCourse(@Param("type") String type ,@Param("keyword") String keyword);

    
    CourseVO selectOne(int courseId);
    
    int updateCourseRate(@Param("courseId") int courseId, @Param("courseRate") int courseRate);
}
