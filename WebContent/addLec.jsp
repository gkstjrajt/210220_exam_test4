<%@page import="ncs_java_yhs4.dao.LecturerDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	LecturerDao dao = LecturerDao.getInstance();
	
	int idx = dao.getNextIdx();
%>
<h2>강사 추가</h2>
<form action="/ncs_java_yhs4/join.jsp" method="post" id="join">
	<table>
		<tr>
			<td>강사번호</td>
			<td><input type="text" id="idx" name="idx" value="<%=idx %>" readonly></td>
		</tr>
		<tr>
			<td>강사명</td>
			<td><input type="text" id="name" name="name"></td>
		</tr>
		<tr>
			<td>전공</td>
			<td><input type="text" id="major" name="major"></td>
		</tr>
		<tr>
			<td>세부전공</td>
			<td><input type="text" id="field" name="field"></td>
		</tr>
	</table>
</form>
<div>
	<button type="submit" onclick="join()">추가</button>
</div>