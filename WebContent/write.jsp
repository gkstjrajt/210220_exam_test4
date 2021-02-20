<%@page import="ncs_java_yhs4.dto.Lecturer"%>
<%@page import="java.util.List"%>
<%@page import="ncs_java_yhs4.dao.LecturerDao"%>
<%@page import="ncs_java_yhs4.dao.CourseDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	CourseDao cDao = CourseDao.getInstance();
	LecturerDao lDao = LecturerDao.getInstance();
	
	List<Lecturer> lList = lDao.selectLecturerByAll();
	
%>
<h2>교과목 추가</h2>
<form action="/ncs_java_yhs4/insert.jsp?update=n" method="post" id="insert">
	<table>
		<tr>
			<td>교과목 코드</td>
			<td><input type="text" id="id" name="id"></td>
		</tr>
		<tr>
			<td>과목명</td>
			<td><input type="text" id="name" name="name"></td>
		</tr>
		<tr>
			<td>담당강사</td>
			<td>
				<select name="lecturer">
					<option hidden>담당강사선택</option>
					<% for(Lecturer lecturer : lList){ %>
						<option id="lecturer" name="lecturer" value="<%=lecturer.getIdx() %>"><%=lecturer.getName() %></option>
					<% } %>
				</select>
			</td>
		</tr>
		<tr>
			<td>학점</td>
			<td><input type="text" id="credit" name="credit"></td>
		</tr>
		<tr>
			<td>요일</td>
			<td>
				<input type="radio" id="week" name="week" value="1">월
				<input type="radio" id="week" name="week" value="2">화
				<input type="radio" id="week" name="week" value="3">수
				<input type="radio" id="week" name="week" value="4">목
				<input type="radio" id="week" name="week" value="5">금
				<input type="radio" id="week" name="week" value="6">토
			</td>
		</tr>
		<tr>
			<td>시작</td>
			<td><input type="text" id="start_hour" name="start_hour"></td>
		</tr>
		<tr>
			<td>종료</td>
			<td><input type="text" id="end_end" name="end_end"></td>
		</tr>
	</table>
</form>
<div>
	<button type="button" onclick="toList()">목록</button>
	<button type="submit" onclick="toInsert(); return false">완료</button>
</div>