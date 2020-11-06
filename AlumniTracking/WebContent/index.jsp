<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Insert title here</title>
        <link href="css/login_style.css" type="text/css" rel="stylesheet">
    </head>
    <body>
        <h1 style="text-align:center;">Alumni Tracking System</h1>
        <form class="box" action="index.jsp" method="post">
        <ul class="log_signup">
                <li><a href="index.html">LogIn</a></li>
                <li>/</li><li><a href="signup.jsp">SignUp</a></li>
            </ul>
        <input type="email" name="uname" placeholder="Username">
        <input type="password" name="pwd"placeholder="password">
        <input type="submit" value="Sign In">
        </form>
    </body>
</html>