<%@page import="java.util.ArrayList"%>
<%@page import="com.alumni_track.student.StudentDao"%>
<%@page import="com.alumni_track.student.StudentDto"%>
<%@page import="com.alumni_track.college.CollegeDto"%>
<%@page import="com.alumni_track.college.CollegeDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%if(request.getMethod().equalsIgnoreCase("post")){ %>
<jsp:useBean id="d1" class="com.alumni_track.student.StudentDto"></jsp:useBean>
<jsp:setProperty property="*" name="d1"/>

<%
if(new StudentDao().updateStudent(d1)){
	response.sendRedirect("viewAllStudent.jsp");
}else{
	out.println("Failed");
}
}

String student_id =request.getParameter("student_id");
if(student_id!=null){
	ArrayList<StudentDto> list = new StudentDao().getStudents(student_id);
	if(list!=null){
		for(StudentDto dto : list){
%>

<form action ="updateStudent.jsp" method="post">

<fieldset>
<input type="hidden" name="student_id" value="<%=dto.getStudent_id()%>">
<input type="text" name="student_name" value="<%=dto.getStudent_name()%>"><br>
 <input type="text" name="student_phoneno" value="<%=dto.getStudent_phoneno() %>"><br>
 <%ArrayList<CollegeDto> al = new CollegeDao().getAllColleges();
 %>
   <select name="col_id">
   <option value="">----SelectCollege----</option>
   <%for(CollegeDto dt:al){ %>
   <option value=<%=dt.getCol_id() %>><%=dt.getCol_name() %></option>
   <%} %>
   </select>

  <input type="text" name="student_sem" value="<%=dto.getStudent_sem() %>"><br>
  <input type="text" name="student_yop" value="<%=dto.getStudent_yop() %>"><br>
  <select name="student_gender">
   <option >----Select Gender----</option>
  <option value="male">Male</option>
  <option value="female">Female</option>
  <option value="other">other</option>
  </select>
<input type="submit" value="submit">
<%}}else{
	response.sendRedirect("index1.jsp");
	}}%>
</fieldset>


</form>
</body>
</html>