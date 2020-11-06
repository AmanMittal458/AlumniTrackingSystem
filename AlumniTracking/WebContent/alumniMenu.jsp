<%
String uname=(String) session.getAttribute("uname");
if(uname == null){
	response.sendRedirect("signIn.jsp");
}


%>
<ul>
<li><a href="viewAllAlumni.jsp">viewAllAlumni</a></li>
<li><a href="signOut.jsp">SignOUt</a></li>
</ul>