<%@page import="java.util.ArrayList"%>
<%@page import="com.alumni_track.college.CollegeDao"%>
<%@page import="com.alumni_track.college.CollegeDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		if (request.getMethod().equalsIgnoreCase("post")) {
	%>
	<jsp:useBean id="d1" class="com.alumni_track.college.CollegeDto"></jsp:useBean>
	<jsp:setProperty property="*" name="d1" />
	<%
		if (new CollegeDao().updateCollege(d1)) {
				response.sendRedirect("viewAllColleges.jsp");
			} else {
				out.print("failed");
			}
		}
		String col_id = request.getParameter("col_id");
		if (col_id != null) {
			ArrayList<CollegeDto> list = new CollegeDao().getCollege(col_id);
			if (list != null) {
				for (CollegeDto dto : list) {%>
<form method="post" action="updateCollege.jsp">
<input type="hidden" name="col_id" value="<%=dto.getCol_id()%>"><br> <br>
 <input type="text" name="col_name" value="<%=dto.getCol_name() %>"><br>
  <input type="text" name="col_city" value="<%=dto.getCol_city()%>"><br>
		
	<input type="text" name="col_phoneno" value="<%=dto.getCol_phoneno() %>"><br> 
	<input type="text" name="col_email" value="<%= dto.getCol_email()%>"><br>
	  <input type="submit" value="REGISTER">					
					
					
			<% 	}
			} else {
				response.sendRedirect("index1.jsp");
			}
		}
	%>
</body>
</html>