<%@page import="ncs_java_yhs4.dto.Course"%>
<%@page import="ncs_java_yhs4.dto.Lecturer"%>
<%@page import="java.util.List"%>
<%@page import="ncs_java_yhs4.dao.CourseDao"%>
<%@page import="ncs_java_yhs4.dao.LecturerDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	LecturerDao lDao = LecturerDao.getInstance();
	CourseDao cDao = CourseDao.getInstance();
	String lecName = request.getParameter("idx");
	String id = request.getParameter("id");
	System.out.println(id);
	
	Course course = cDao.selectCourseById(id);
	List<Lecturer> lList = lDao.selectLecturerByAll();
%>
 
<h2>교과목 수정</h2>
<form action="/ncs_java_yhs4/insert.jsp?update=y&cId=<%=id %>" method="post" id="insert">
	<table>
		<tr>
			<td>교과목 코드</td>
			<td><input type="text" id="upId" name="upId" value="<%=id %>"></td>
		</tr>
		<tr>
			<td>과목명</td>
			<td><input type="text" id="name" name="name" value="<%=course.getName() %>"></td>
		</tr>
		<tr>
			<td>담당강사</td>
			<td>
				<select name="lecturer">
					<% for(Lecturer lecturer : lList) { 
						if(lecturer.getName().equals(lecName)) { %>
							<option selected value="<%=lecturer.getIdx()%>"><%=lecturer.getName() %>
						<% } else { %>
							<option value="<%=lecturer.getIdx()%>"><%=lecturer.getName() %>
						<% } %>
					<% } %>
				</select>
			</td>
		</tr>
		<tr>
			<td>학점</td>
			<td><input type="text" id="credit" name="credit" value="<%=course.getCredit() %>"></td>
		</tr>
		<tr>
			<td>요일</td>
			<td>
			<% for(int i = 1; i < 7; i++) { 
				String[] weeks ={"0", "월", "화", "수", "목", "금", "토"};
				 if(course.getWeek()==i){ %>
				<input type="radio" id="week" name="week" value="<%=i %>" checked="checked"><%=weeks[i] %>
				<% } else { %>
				<input type="radio" id="week" name="week" value="<%=i %>"><%=weeks[i] %>
				<% } %>
			<% } %>
			</td>
		</tr>
		<tr>
			<td>시작</td>
			<td><input type="text" id="start_hour" name="start_hour" value="<%=String.format("%04d", course.getStart_hour()) %>"></td>
		</tr>
		<tr>
			<td>종료</td>
			<td><input type="text" id="end_end" name="end_end" value="<%=String.format("%04d", course.getEnd_end()) %>"></td>
		</tr>
	</table>
</form>
<div>
	<button type="button" onclick="toList()">목록</button>
	<button type="button" onclick="toBack()">취소</button>
	<button type="submit" onclick="toInsert()">완료</button>
</div>