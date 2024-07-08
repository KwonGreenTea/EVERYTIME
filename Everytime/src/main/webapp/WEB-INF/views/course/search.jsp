<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>	    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table>
		<thead>
			<tr>
				<th style="width : 120px">강의명</th>
				<th style="width : 100px">교수명</th>
				<th style="width : 100px">전공</th>
				<th style="width : 100px">학년</th>
				
				
			</tr>
		</thead>
		<tbody>
			<c:forEach var="courseVO" items="${courseList }">
				<tr>
					<td><a href="view?courseId=${courseVO.courseId }">${courseVO.courseName}</a></td>
					<td>${courseVO.professor }</td>
					<td>${courseVO.major }</td>
					<td>${courseVO.grade }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

	
</body>
</html>