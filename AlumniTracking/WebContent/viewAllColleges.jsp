<%@page import="java.util.ArrayList"%>
<%@page import="com.alumni_track.college.CollegeDto" %>
<%@page import="com.alumni_track.college.CollegeDao" %>
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

<table border="1">
<tr>
<th>College_Id</th>
<th>College_Name</th>
<th>College_City</th>
<th>College_Contact</th>
<th>College_Email</th>
<th>Operation</th>
</tr>
<%ArrayList<CollegeDto> list = new CollegeDao().getAllColleges();  %>
<% for(CollegeDto dto : list){%>
<tr>
<td><%=dto.getCol_id()%></td>
<td><%=dto.getCol_name()%></td>
<td><%=dto.getCol_city()%></td>
<td><%=dto.getCol_phoneno()%></td>
<td><%=dto.getCol_email()%></td>
<td>
<a href="updateCollege.jsp?col_id=<%=dto.getCol_id() %>">Edit</a>

</td>
</tr>
<% }%>
</table>


</form>
</body>
</html>