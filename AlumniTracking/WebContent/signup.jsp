<%@page import="com.alumni_track.login.LoginDto" %>
<%@page import="com.alumni_track.login.LoginDao" %>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Insert title here</title>
        <link href="css/login_style.css" type="text/css" rel="stylesheet">
        
    </head>
    
    <body>
      <h2 style="text-align:center;">Alumni Tracking System</h2>
        <script type="text/javascript">
        function Validate() {
            var password = document.getElementById("pwd").value;
            var confirmPassword = document.getElementById("cnf_pwd").value;
            if (password != confirmPassword) {
                alert("Passwords do not match.");
                return false;
            }
            return true;
        }
        </script>
        
        
        <form class="box" action="LoginController" method="post">
        <ul class="log_signup">
                <li><a href="signIn.jsp">LogIn</a></li>
                <li>/</li>
                <li><a href="signup.jsp">SignUp</a></li>
            </ul>
            <input type="radio" name="type" value="College">College
            <input type="radio" name="type" value="Student">Student
            <input type="radio" name="type" value="Alumni">Alumni
        <input type="email" name="uname" placeholder="Username">
        <input type="password" id ="pwd" name="pwd"  placeholder="password">
        <input type="password" id="cnf_pwd" name="cnf_pwd" placeholder="confirm password">
        <input type="submit" name="" value="SignUp"  onclick="return Validate()">
        </form>
    </body>
</html>