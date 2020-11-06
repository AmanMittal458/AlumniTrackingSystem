package com.alumni_track.student;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.alumni_track.db.AlumniDb;

public class StudentDao {
	private Connection conn = null;
	private PreparedStatement ps = null;
	private ResultSet rs = null;

	public boolean addStudent(StudentDto dto) {
		boolean flag = false;
		if (conn == null) {
			conn = AlumniDb.getAlumniDb();
		}

		try {
			String query = "insert into student_master (student_id,student_name, student_phoneno,col_id,  student_sem, student_yop,student_gender,student_email) values(?,?,?,?,?,?,?,?)";
			ps = conn.prepareStatement(query);
			ps.setString(1, dto.getStudent_id());
			ps.setString(2, dto.getStudent_name());
			ps.setString(3, dto.getStudent_phoneno());
			ps.setString(4, dto.getCol_id());
			ps.setString(5, dto.getStudent_sem());
			ps.setString(6, dto.getStudent_yop());
			ps.setString(7, dto.getStudent_gender());
			ps.setString(8, dto.getStudent_email());
			if (ps.executeUpdate() > 0) {
				flag = true;
			}
		} catch (Exception e) {
			System.out.println("Exception at AddStudent()" + e);

		} finally {
			ps = null;
			conn = null;
			return flag;
		}

	}

	public ArrayList<StudentDto> getAllStudents() {
		ArrayList<StudentDto> list = new ArrayList<StudentDto>();
		if (conn == null) {
			conn = AlumniDb.getAlumniDb();
		}
		try {
			String query = "select * from student_master";
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();
			StudentDto dto;
			while (rs.next()) {
				dto = new StudentDto();
				dto.setStudent_id(rs.getString("Student_id"));
				dto.setStudent_name(rs.getString("student_name"));
				dto.setCol_id(rs.getString("col_id"));
				dto.setStudent_phoneno(rs.getString("student_phoneno"));
				dto.setStudent_sem(rs.getString("student_sem"));
				dto.setStudent_yop(rs.getString("student_yop"));
				dto.setStudent_gender(rs.getString("student_gender"));
				dto.setStudent_email(rs.getString("student_email"));
				list.add(dto);
			}
		} catch (Exception e) {
			System.out.println("Exception at getAllStudents()" + e);
		} finally {
			ps = null;
			rs = null;
			conn = null;
			return list;
		}

	}

	public ArrayList<StudentDto> getStudents(String student_id) {
		ArrayList<StudentDto> list = new ArrayList<StudentDto>();
		if (conn == null) {
			conn = AlumniDb.getAlumniDb();
		}
		try {
			String query = "select * from student_master where student_id=?";
			ps = conn.prepareStatement(query);
			ps.setString(1, student_id);
			rs = ps.executeQuery();
			StudentDto dto;
			while (rs.next()) {
				dto = new StudentDto();
				dto.setStudent_id(rs.getString("Student_id"));
				dto.setStudent_name(rs.getString("student_name"));
				dto.setCol_id(rs.getString("col_id"));
				dto.setStudent_phoneno(rs.getString("student_phoneno"));
				dto.setStudent_sem(rs.getString("student_sem"));
				dto.setStudent_yop(rs.getString("student_yop"));
				dto.setStudent_gender(rs.getString("student_gender"));
				dto.setStudent_email(rs.getString("student_email"));
				list.add(dto);
			}
		} catch (Exception e) {
			System.out.println("Exception at getStudents()" + e);
		} finally {
			ps = null;
			rs = null;
			conn = null;
			return list;
		}

	}

	public boolean updateStudent(StudentDto dto) {
		boolean flag = false;
		if (conn == null) {
			conn = AlumniDb.getAlumniDb();
		}
		try {
			String query = "update student_master set student_name=?, student_phoneno=?,col_id=?, student_sem=?, student_yop=?, student_gender=? where student_id=? ";
			ps = conn.prepareStatement(query);
			ps.setString(1, dto.getStudent_name());
			ps.setString(2, dto.getStudent_phoneno());
			ps.setString(3, dto.getCol_id());
			ps.setString(4, dto.getStudent_sem());
			ps.setString(5, dto.getStudent_yop());
			ps.setString(6, dto.getStudent_gender());
			ps.setString(7, dto.getStudent_id());
			if (ps.executeUpdate() > 0) {
				flag = true;
			}
		} catch (Exception e) {
			System.out.println("Exception at updateStudent()" + e);
		} finally {
			ps = null;
			conn = null;
			return flag;
		}
	}

	public boolean deleteStudent(String student_id) {
		boolean flag = false;
		if (conn == null) {
			conn = AlumniDb.getAlumniDb();
		}
		try {
			String query = "delete from student_master where student_id=?";
			ps = conn.prepareStatement(query);
			ps.setString(1, student_id);
			if (ps.executeUpdate() > 0) {
				flag = true;
			}
		} catch (Exception e) {
			System.out.println("Exception at updateStudent()" + e);
		} finally {
			ps = null;
			conn = null;
			return flag;
		}

	}

}
