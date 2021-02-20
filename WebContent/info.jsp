<%@page import="ncs_java_yhs4.dto.Course"%>
<%@page import="ncs_java_yhs4.dao.CourseDao"%>
<%@page import="java.util.List"%>
<%@page import="ncs_java_yhs4.dao.LecturerDao"%>
<%@page import="ncs_java_yhs4.dto.Lecturer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String lecturer = request.getParameter("lecturer");
	LecturerDao lDao = LecturerDao.getInstance();
	List<Lecturer> list = lDao.selectLecturerByAll();
	
	String idx = null;
	for(Lecturer lec : list) {
		if(lecturer.equals(lec.getName())){
			idx = String.format("%s",lec.getIdx());
		}
	}
	
	
	CourseDao cDao = CourseDao.getInstance();
	List<Course> course = cDao.selectCoursesOfLecturer(idx);
%>
<table border="1px solid black"> 
	<thead align="center">
		<tr>
			<td>과목명</td>
			<td>학점</td>
			<td>강사</td>
		</tr>
	</thead>
	<tbody align="center">
	<% if(course != null){ %>
		<% for(Course cour : course) { %>
			<tr>
				<td><%=cour.getName() %></td>
				<td><%=cour.getCredit() %></td>
				<td><%=cour.getLecturer() %></td>
			</tr>
		<% } %>
	<% } else { %>
		<tr>
			<td>과목이 없습니다.</td>
		</tr>
	<% } %>
	</tbody>
</table>