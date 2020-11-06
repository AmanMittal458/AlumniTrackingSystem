<%@page import="com.alumni_track.college.CollegeDto"%>
<%@page import="com.alumni_track.college.CollegeDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
	<%
		if (request.getMethod().equalsIgnoreCase("post")) {
			{
	%>
	<jsp:useBean id="dto" class="com.alumni_track.college.CollegeDto"></jsp:useBean>
	<jsp:setProperty property="*" name="dto" />
		<%
			if (new CollegeDao().addCollege(dto)) {
						response.sendRedirect("signIn.jsp");
					} else {
						out.print("Failed");
					}
				}
			}
	String col_email = request.getParameter("col_email");
	if(col_email!=null){
		%>
		<form action="addCollege.jsp" method="post">
		<fieldset>
		<table cellspacing="25">
		<tr>
		<td>COLLEGE_ID:</td>
		<td><input type="text" name="col_id"></td>
		</tr>
		<tr>
		<td>COLLEGE NAME:</td>
		<td><input type="text" name="col_name"></td>
		</tr>
		<tr>
		<td>COLLEGE CITY :</td>
		<td><input type="text" name="col_city"></td>
		</tr>
		<tr>
		<td>COLLEGE CONTACT :</td>
		<td><input type="text" name="col_phoneno"></td>
		</tr>
		<tr>
		<td>COLLEGE EMAIL</td>
		<td><input type="text" name="col_email" value="<%=col_email%>" readonly></td></tr>
		</table>
			<input type="submit" value="REGISTER">
				</fieldset>
		</form>
		<%} %></body>
</html>