<%@page import="com.alumni_track.login.LoginDto" %>
<%@page import="com.alumni_track.login.LoginDao" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
<%if(request.getMethod().equalsIgnoreCase("post")){ %>
<jsp:useBean id="dto" class="com.alumni_track.login.LoginDto"></jsp:useBean>
<jsp:setProperty name="dto" property="*"></jsp:setProperty>
<jsp:useBean id="dto1" class="com.alumni_track.login.LoginDao"></jsp:useBean>
<% String type=dto1.checkUser(dto);
if(type!=null){
if(type.equalsIgnoreCase("Alumni")){
	session.setAttribute("uname", dto.getUname());
	session.setAttribute("type", dto.getType());
	response.sendRedirect("alumniMenu.jsp");
}else if(type.equalsIgnoreCase("Student")){
	session.setAttribute("uname", dto.getUname());
	session.setAttribute("type", dto.getType());
	response.sendRedirect("studentMenu.jsp");
}else if(type.equalsIgnoreCase("College")){
	session.setAttribute("uname", dto.getUname());
	session.setAttribute("type", dto.getType());
	response.sendRedirect("collegeMenu.jsp");
}
}else{
	out.print("<script>alert('Please Enter valid Login Details')</script>");
}
}
%>
<form action ="signIn.jsp" method="post">
<fieldset><center>
<table cellspacing="22">
<tr><td><input type="email" name="uname" placeholder="Email" required=""></td></tr>
<tr><td><input type="password" name="pwd" placeholder="Password" required=""></td></tr>

</table>

<input type="submit" value="Login">
</center>
</fieldset>
</form>
</body>
</html>