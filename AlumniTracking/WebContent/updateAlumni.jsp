<%@page import="com.alumni_track.college.CollegeDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.alumni_track.alumni.AlumniDao"%>
<%@page import="com.alumni_track.alumni.AlumniDto"%>
<%@page import="com.alumni_track.college.CollegeDto"%>
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
	<jsp:useBean id="dto" class="com.alumni_track.alumni.AlumniDto"></jsp:useBean>
	<jsp:setProperty name="dto" property="*"></jsp:setProperty>
	<%
		if (new AlumniDao().updateAlumni(dto)) {
				response.sendRedirect("viewAllAlumni.jsp");
			} else {
				out.print("failed");
			}
		}

		String alumni_id = request.getParameter("alumni_id");
		if (alumni_id != null) {
			ArrayList<AlumniDto> list = new AlumniDao()
					.getAlumni(alumni_id);
			if (list != null) {
				for (AlumniDto d1 : list) {
	%>

<form method="post" action ="updateAlumni.jsp">
<form action ="addAlumni.jsp" method="post">
<input type="hidden" name="alumni_id" value="<%=d1.getAlumni_id()%>">
<input type="text" name ="alumni_name" value="<%=d1.getAlumni_name()%>" required="">
<input type="text" name ="current_comp"value="<%=d1.getCurrent_comp()%>" required="">
<select name="col_id" >
<option>----select_college----</option>
<%ArrayList<CollegeDto> l1 = new CollegeDao().getAllColleges(); %>
<% for(CollegeDto dto : l1){%>

<option value="<%=dto.getCol_id()%>"><%= dto.getCol_name()%></option>

	<%}%>
	</select>
<input type="text" name ="alumni_post" value="<%=d1.getAlumni_post()%>" required="">
<input type="text" name ="alumni_yop" value="<%=d1.getAlumni_yop()%>" required="">
<input type="text" name ="alumni_experience" value="<%=d1.getAlumni_experience()%>" required="">
 <select name="alumni_gender">
   <option >----Select Gender----</option>
  <option value="male">Male</option>
  <option value="female">Female</option>
  <option value="other">other</option>
  </select>
<input type="submit" value="Register">

</form>
	<%
		}

			}
		} else {
			response.sendRedirect("index1.jsp");
		}
	%>
</body>
</html>