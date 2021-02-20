<%@page import="ncs_java_yhs4.dto.Lecturer"%>
<%@page import="ncs_java_yhs4.dao.LecturerDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	LecturerDao dao = LecturerDao.getInstance();
	
	int idx = Integer.parseInt(request.getParameter("idx"));
	String name = request.getParameter("name");
	String major = request.getParameter("major");
	String field = request.getParameter("field");
	Lecturer lecturer = new Lecturer(idx, name, major, field);
	
%>
<script type="text/javascript">
	alert("추가완료!");
</script>

<% dao.insertLecturer(lecturer); %>

<script type="text/javascript">
	location.href = "/ncs_java_yhs4/index.jsp?pp=list";
</script>