<%@page import="java.util.ArrayList"%>
<%@page import="com.alumni_track.alumni.AlumniDto" %>
<%@page import="com.alumni_track.alumni.AlumniDao" %>
<%@page import="com.alumni_track.college.CollegeDto" %>
<%@page import="com.alumni_track.college.CollegeDao" %>

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
if(request.getMethod().equalsIgnoreCase("post")){
%>
<jsp:useBean id="dto" class="com.alumni_track.alumni.AlumniDto"></jsp:useBean>
<jsp:setProperty property="*" name="dto"/>
<%if(new AlumniDao().addAlumni(dto)){
	response.sendRedirect("signIn.jsp");}
	else{
	out.print("Failed");
	}%>
<%} 

String alumni_id =request.getParameter("alumni_id");
if(alumni_id!=null){
%>
<form action ="addAlumni.jsp" method="post">
<fieldset>
<table cellspacing="22">
<tr>
<td>ALUMNI EMAIL:</td>
<td><input type="text" name="alumni_id" value="<%=alumni_id%>" readonly></td>
</tr>
<tr>
<td>ALUMNI NAME:</td>
<td><input type="text" name ="alumni_name" required=""></td>
</tr>
<tr>
<td>ALUMNI CURRENT COMPANY:</td>
<td><input type="text" name ="current_comp" required=""></td>
</tr>
<tr>
<td>COLLEGE NAME:</td>
<td><select name="col_id">
<option>----select_college----</option>
<%ArrayList<CollegeDto> list = new CollegeDao().getAllColleges(); %>
<% for(CollegeDto dto : list){%>

<option value="<%=dto.getCol_id()%>"><%= dto.getCol_name()%></option>

	<%}%>
	</select></td>
	</tr>
	<tr>
<td>ALUMNI DESIGNATION:</td>
<td><input type="text" name ="alumni_post" 	 required=""></td>
</tr>
<tr>
<td>PASSED YEAR:</td>
<td><input type="text" name ="alumni_yop" required=""></td>
</tr>
<tr>
<td>ALUMNI EXPERIENCE:</td>
<td><input type="text" name ="alumni_experience" placeholder ="IN YEARS" required=""></td>
</tr>
<tr>
<td>ALUMNI GENDER:</td>
 <td><select name="alumni_gender">
   <option >----Select Gender----</option>
  <option value="male">Male</option>
  <option value="female">Female</option>
  <option value="other">other</option>
  </select></td>
  </tr>
  </table>
<input type="submit" value="Register">
</fieldset>
</form>
<% }%>
</body>
</html>