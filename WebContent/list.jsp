<%@page import="ncs_java_yhs4.dto.Course"%>
<%@page import="java.util.List"%>
<%@page import="ncs_java_yhs4.dao.CourseDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	CourseDao dao = CourseDao.getInstance();
	
	int count = dao.getCourseCount();
	
	List<Course> list = dao.selectCourseByAll();
%>
