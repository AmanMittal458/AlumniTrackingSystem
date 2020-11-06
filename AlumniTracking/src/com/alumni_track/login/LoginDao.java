package com.alumni_track.login;



import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.alumni_track.db.AlumniDb;
import com.alumni_track.utility.AlumniPassword;

public class LoginDao {
	private PreparedStatement ps=null;
	private Connection conn=null;
	private ResultSet rs=null;
	
	
	//check user
	public String checkUser(LoginDto ld) {
		String type=null;
		if(conn==null) {
			conn=AlumniDb.getAlumniDb();
		}
		try {
			ps=conn.prepareStatement("select type from login_master where uname=? and pwd=?");
			ps.setString(1, ld.getUname());
			ps.setString(2,AlumniPassword.encrypt(ld.getPwd()));
			rs=ps.executeQuery();
			if(rs.next()) {
				type=rs.getString("type");
			}
		}catch (Exception e) {
			System.out.println("Exception at checkUser():" + e);
		}
		 finally {
	            rs = null;
	            conn = null;
	            return type;
	        }
	}
	
	//add login details
	public boolean addLogin(String uname,String pwd ,String type) {
		boolean flag =false;
		if(conn==null) {
			conn=AlumniDb.getAlumniDb();
		}
		try {
			ps=conn.prepareStatement("insert into login_master(uname,pwd,type) values(?,?,?)");
			ps.setString(1,uname);
			ps.setString(2,AlumniPassword.encrypt(pwd));
			ps.setString(3,type);
			if(ps.executeUpdate()>0) {
				flag=true;
			}
		}catch (Exception e) {
			System.out.println("exception at addLogin()" + e);
		}finally {
			ps=null;
			conn=null;
			return flag;
		}
		
	}
	
}
