<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="index.jsp" method="post">
		<div style="margin-top:15%">
			<center>
				<div style="width: 50%">
					<fieldset>
					<table>
							<tr>
								<h2>Verify Email</h2>
							</tr>
							<tr>
								<input type="text" name="otp" Placeholder="ENTER OTP" required>
							</tr><br><br>
							<tr align="right">
								<input type="submit" name="submit" value="SUBMIT">
							</tr>
					</table>
					</fieldset>
				</div>

			</center>
		</div>
	</form>
</body>
</html>