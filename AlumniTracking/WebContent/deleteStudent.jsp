<%@page import="com.alumni_track.student.StudentDao"%>
<%
String student_id = request.getParameter("student_id");
if(student_id!=null){
	if(new StudentDao().deleteStudent(student_id)){
		response.sendRedirect("viewAllStudent.jsp");
	}
	else{
		out.print("failed");
	}
	
}

%>