package com.alumni_track.college;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.alumni_track.db.AlumniDb;

public class CollegeDao {
	private Connection conn = null;
	private PreparedStatement ps = null;
	private ResultSet rs = null;

	public boolean addCollege(CollegeDto dto) {
		boolean flag = false;
		if (conn == null) {
			conn = AlumniDb.getAlumniDb();
		}
		try {
			String query = "insert into college_master(col_id, col_name, col_city, col_phoneno, col_email) values(?,?,?,?,?)";
			ps = conn.prepareStatement(query);
			ps.setString(1, dto.getCol_id());
			ps.setString(2, dto.getCol_name());
			ps.setString(3, dto.getCol_city());
			ps.setString(4, dto.getCol_phoneno());
			ps.setString(5, dto.getCol_email());
			if (ps.executeUpdate() > 0) {
				flag = true;
			}
		} catch (Exception e) {
			System.out.println("Exception at AddCollege()" + e);
		} finally {
			ps = null;
			conn = null;
			return flag;
		}
	}

	public ArrayList<CollegeDto> getAllColleges() {
		ArrayList<CollegeDto> list = new ArrayList<CollegeDto>();
		if (conn == null) {
			conn = AlumniDb.getAlumniDb();
		}
		try {
			String query = "select * from college_master";
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();
			CollegeDto dto;
			while (rs.next()) {
				dto = new CollegeDto();
				dto.setCol_id(rs.getString("col_id"));
				dto.setCol_name(rs.getString("col_name"));
				dto.setCol_city(rs.getString("col_city"));
				dto.setCol_phoneno(rs.getString("col_phoneno"));
				dto.setCol_email(rs.getString("col_email"));
				list.add(dto);
			}
		} catch (Exception e) {
			System.out.println("Exception at getAllColleges()" + e);
		} finally {
			rs = null;
			ps = null;
			conn = null;
			return list;
		}
	}

	public ArrayList<CollegeDto> getCollege(String col_id) {
		ArrayList<CollegeDto> list = new ArrayList<CollegeDto>();
		if (conn == null) {
			conn = AlumniDb.getAlumniDb();
		}
		try {
			String query = "select * from college_master where col_id=?";
			ps = conn.prepareStatement(query);
			ps.setString(1, col_id);
			rs = ps.executeQuery();
			CollegeDto dto;
			while (rs.next()) {
				dto = new CollegeDto();
				dto.setCol_id(rs.getString("col_id"));
				dto.setCol_name(rs.getString("col_name"));
				dto.setCol_city(rs.getString("col_city"));
				dto.setCol_phoneno(rs.getString("col_phoneno"));
				dto.setCol_email(rs.getString("col_email"));
				list.add(dto);
			}

		} catch (Exception e) {
			System.out.println("Exception at getCollege()" + e);
		} finally {
			rs = null;
			ps = null;
			conn = null;
			return list;
		}
	}

	public boolean updateCollege(CollegeDto dto) {
		boolean flag = false;
		if (conn == null) {
			conn = AlumniDb.getAlumniDb();
		}
		try {
			String query = "update college_master set col_name=?, col_city=?, col_phoneno=?, col_email=? where col_id=?";
			ps = conn.prepareStatement(query);
			ps.setString(1, dto.getCol_name());
			ps.setString(2, dto.getCol_city());
			ps.setString(3, dto.getCol_phoneno());
			ps.setString(4, dto.getCol_email());
			ps.setString(5, dto.getCol_id());
			if (ps.executeUpdate() > 0) {
				flag = true;
			}
		} catch (Exception e) {
			System.out.println("exception at updateCollege"+e);
		} finally {
			ps = null;
			conn = null;
			return flag;
		}
	}

	public boolean deleteCollege(String col_id) {
		boolean flag = false;
		if (conn == null) {
			conn = AlumniDb.getAlumniDb();
		}
		try {
			String query = "delete  from college_master where col_id=?";
			ps = conn.prepareStatement(query);
			ps.setString(1, col_id);
			if (ps.executeUpdate() > 0) {
				flag = true;
			}
		} catch (Exception e) {
			System.out.println("Exception at deleteCollege()" + e);
		} finally {
			ps = null;
			conn = null;
			return flag;
		}
	}
}
