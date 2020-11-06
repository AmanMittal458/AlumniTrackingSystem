<%@page import="java.util.ArrayList"%>
<%@page import="com.alumni_track.student.StudentDto" %>
<%@page import="com.alumni_track.student.StudentDao" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form method="post" action ="viewAllStudent.jsp">
<%ArrayList<StudentDto> list = new StudentDao().getAllStudents(); %>

<table border="1">
<tr>
<th>Student_Id</th>
<th>Student_Name</th>
<th>College_ID</th>
<th>Student_Contact</th>
<th>Student_Yop</th>
<th>Student_Sem</th>
<th>GENDER</th>
<th>Operation</th>
</tr>
<%for(StudentDto dto :list){ %>
<tr>
<td><%=dto.getStudent_id()%></td>
<td><%=dto.getStudent_name()%></td>
<td><%=dto.getCol_id()%></td>
<td><%=dto.getStudent_phoneno()%></td>
<td><%=dto.getStudent_yop()%></td>
<td><%=dto.getStudent_sem()%></td>
<td><%=dto.getStudent_gender()%></td>
<td><a href="updateStudent.jsp?student_id=<%=dto.getStudent_id()%>">Edit</a>
<a href="deleteStudent.jsp?student_id=<%=dto.getStudent_id() %>">Delete</a>
</td>
</tr>
<%} %>
</table>

</form>
</body>
</html>