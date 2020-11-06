package com.alumni_track.login;

import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alumni_track.login.*;

@WebServlet(name = "LoginController", urlPatterns = { "/LoginController" })
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		try {

			String uname = req.getParameter("uname");
			String pwd = req.getParameter("pwd");
			String type = req.getParameter("type");
			LoginDto dto = new LoginDto();
			dto.setUname(uname);
			dto.setPwd(pwd);
			dto.setType(type);
	
			LoginDto dt = new LoginDto();
			if (new LoginDao().addLogin(uname, pwd, type)) {
			
				if (type.equals("Student")) 
					resp.sendRedirect("addStudent.jsp?student_email="+uname);

				 else if (type.equals("College")) 
					 resp.sendRedirect("addCollege.jsp?col_email="+uname);

				 else 
					 resp.sendRedirect("addAlumni.jsp?alumni_id="+uname);
				
			} else {
				resp.sendRedirect("signup.jsp?msg=Email Already exist");
			}

		} catch (Exception e) {
			System.out.println(e);
		}
	}
}
