<%
String uname=(String) session.getAttribute("uname");
if(uname == null){
	response.sendRedirect("signIn.jsp");
}


%>
<ul>
<li><a href="viewAllStudent.jsp">viewAllStudent</a></li>
<li><a href="viewAllAlumni.jsp">viewAllAlumni</a></li>
</ul>