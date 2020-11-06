<%@page import="java.util.ArrayList"%>
<%@page import="com.alumni_track.alumni.AlumniDto" %>
<%@page import="com.alumni_track.alumni.AlumniDao" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="viewAllColleges.jsp" method="post">
<%ArrayList<AlumniDto> list = new AlumniDao().getAllAlumni();  %>

<table border="1">
<tr>
<th>Alumni_Id</th>
<th>Alumni_Name</th>
<th>Current_Comp</th>
<th>College_ID</th>
<th>Designation</th>
<th>Alumni_YOP</th>
<th>Alumni_Experience</th>
<th>Alumni_gender</th>
<th>OperationS</th>
</tr>
<% for(AlumniDto dto : list){%>
<tr>

<td><%=dto.getAlumni_id()%></td>
<td><%=dto.getAlumni_name()%></td>
<td><%=dto.getCurrent_comp()%></td>
<td><%=dto.getCol_id()%></td>
<td><%=dto.getAlumni_post()%></td>
<td><%=dto.getAlumni_yop()%></td>
<td><%=dto.getAlumni_experience()%></td>
<td><%=dto.getAlumni_gender()%></td>
<td>
<a href="updateAlumni.jsp?alumni_id=<%=dto.getAlumni_id()%>">Edit</a>
<a href="deleteAlumni.jsp?alumni_id=<%=dto.getAlumni_id()%>">delete</a>
</td>
</tr>
<% }%>
</table>


</form>
</body>
</html>
