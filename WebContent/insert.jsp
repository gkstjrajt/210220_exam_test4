<%@page import="ncs_java_yhs4.dto.Course"%>
<%@page import="ncs_java_yhs4.dao.CourseDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String type = request.getParameter("update");
	String bId = request.getParameter("bId");
	
	CourseDao cDao = CourseDao.getInstance();
	
%>

<%
	if (type.equals("y")) {
		String cId = request.getParameter("cId");
		Course course = cDao.selectCourseById(cId);
		System.out.println(course);
		course.setId(request.getParameter("upId"));
		course.setName(request.getParameter("name"));
		course.setCredit(Integer.parseInt(request.getParameter("credit")));
		course.setLecturer(request.getParameter("lecturer"));
		course.setWeek(Integer.parseInt(request.getParameter("week")));
		course.setStart_hour(Integer.parseInt(request.getParameter("start_hour")));
		course.setEnd_end(Integer.parseInt(request.getParameter("end_end")));
		cDao.updateCourse(course, cId);
		
%>
<%
	cDao.updateCourse(course, bId);
%>

<script type="text/javascript">
	alert("수정완료!");
	location.href = "/ncs_java_yhs4/index.jsp?pp=list";
</script>

<%
	} else if (type.equals("n")) {
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		int credit = Integer.parseInt(request.getParameter("credit"));
		String lecturer = request.getParameter("lecturer");
		int week = Integer.parseInt(request.getParameter("week"));
		int start_hour = Integer.parseInt(request.getParameter("start_hour"));
		int end_end = Integer.parseInt(request.getParameter("end_end"));
		Course course = new Course(id, name, credit, lecturer, week, start_hour, end_end);
	cDao.insertCourse(course);
%>

<script type="text/javascript">
	alert("작성완료!");
	location.href = "/ncs_java_yhs4/index.jsp?pp=list";
</script>

<%
	} else {
	cDao.deleteCourse(bId);
%>

<script type="text/javascript">
	alert("삭제완료!");
	location.href = "/ncs_java_yhs4/index.jsp?pp=list";
</script>

<%
	}
%>

