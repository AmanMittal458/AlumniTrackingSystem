<%
String uname =(String) session.getAttribute("uname");
if(uname==null){
	response.sendRedirect("signIn.jsp");
}
%>
<ul>
<li><a href="viewAllAlumni.jsp">ViewAllAlumni</a><li>
<li><a href="signOut.jsp">SignOut</a><li>
</ul>