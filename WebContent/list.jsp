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
총 <%=count %>개의 교과목이 있습니다.
<table border="1px solid black">
	<thead align="center">
		<tr>
			<td>과목코드</td>
			<td>과목명</td>
			<td>학점</td>
			<td>담당강사</td>
			<td>요일</td>
			<td>시작시간</td>
			<td>종료시간</td>
			<td>관리</td>
		</tr>
	</thead>
	<tbody align="center">
		<% for(Course course : list) { %>
			<tr>
				<td><%=course.getId() %></td>
				<td><%=course.getName() %></td>
				<td><%=course.getCredit() %></td>
				<td><a href="/ncs_java_yhs4/index.jsp?pp=info&lecturer=<%=course.getLecturer()%>"><%=course.getLecturer() %></a></td>
				<% if(course.getWeek() == 1){ %>
					<td>월</td>
				<% } else if (course.getWeek() == 2){ %>
					<td>화</td>
				<% } else if (course.getWeek() == 3){ %>
					<td>수</td>
				<% } else if (course.getWeek() == 4){ %>
					<td>목</td>
				<% } else if (course.getWeek() == 5){ %>
					<td>금</td>
				<% } else {%>
					<td>토</td>
				<% } %>
				<td><%= String.format("%04d", course.getStart_hour()) %></td>
				<td><%= String.format("%04d", course.getEnd_end()) %></td>
				<td><a href="/ncs_java_yhs4/index.jsp?pp=update&id=<%=course.getId()%>&idx=<%=course.getLecturer()%>">수정</a> / <a href="/ncs_java_yhs4/insert.jsp?update=d&bId=<%=course.getId()%>">삭제</a></td>
			</tr>
		<% } %>
	</tbody>
</table>
<div>
	<button type="button" onclick="toWrite()">작성</button>
	<button type="button" onclick="toAddLec()">강사 추가</button>
</div>

