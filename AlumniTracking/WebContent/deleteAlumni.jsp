
<%@page import="com.alumni_track.alumni.AlumniDao"%>
<%
String alumni_id=request.getParameter("alumni_id");
if(alumni_id != null){
	out.print(alumni_id);
	if(new AlumniDao().deleteAlumni(alumni_id)){
		response.sendRedirect("viewAllAlumni.jsp");
	}else{
		out.print("Failed");
	}
}

%>