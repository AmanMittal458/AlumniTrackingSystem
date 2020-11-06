<%@page import="com.alumni_track.student.StudentDao"%>
<%@page import="com.alumni_track.student.StudentDto"%>
<%@page import="com.alumni_track.college.CollegeDto"%>
<%@page import="com.alumni_track.college.CollegeDao"%>
<%@page import="java.util.ArrayList"%>
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
	%>
	<jsp:useBean id="dto"
		class="com.alumni_track.student.StudentDto"></jsp:useBean>
	<jsp:setProperty property="*" name="dto" />
	<%
		if (new StudentDao().addStudent(dto)) {
				response.sendRedirect("signIn.jsp");
			} else {
				out.print("failed");
			}
		}
String student_email=request.getParameter("student_email");
if(student_email!=null){
	%>
	
<form action="addStudent.jsp" method="post">
<center><h1>Student Registrtion</h1></center>
<fieldset>
<table cellspacing="30">
<tr>
<td>STUDENT_ID :</td>
<td><input type="text" name="student_id"></td>
</tr>
 <tr>
 <td>STUDENT EMAIL :</td> 
  <td><input type="text" name="student_email" value="<%=student_email%>" readonly></td>
  </tr>
  <tr>
<tr>
<td>STUDENT NAME:</td>
<td><input type="text" name="student_name"></td>
</tr>

<tr>
<td>STUDENT CONTACT:</td>
 <td><input type="text" name="student_phoneno"></td>
 </tr>
 
 <%ArrayList<CollegeDto> al = new CollegeDao().getAllColleges();
 %>
 <tr>
 <td>COllEGE_NAME</td>
  <td> <select name="col_id">
   <option value="">----SelectCollege----</option>
   <%for(CollegeDto dto:al){ %>
   <option value=<%=dto.getCol_id() %>><%=dto.getCol_name() %></option>
   <%} %>
   </select></td>
   </tr>
<tr>
<td>SEMESTER :</td>
 <td> <input type="text" name="student_sem"></td>
 </tr>
 <tr>
 <td>PASSING YEAR :</td>
  <td><input type="text" name="student_yop"></td>
  </tr>
  <tr>
  <td>GENDER :</td>
<td>  <select name="student_gender">
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
<%} %>
</body>
</html>