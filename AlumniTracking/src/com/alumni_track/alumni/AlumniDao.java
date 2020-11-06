package com.alumni_track.alumni;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.alumni_track.db.AlumniDb;

public class AlumniDao {
	private Connection conn = null;
	private PreparedStatement ps = null;
	private ResultSet rs = null;

	public boolean addAlumni(AlumniDto dto) {
		boolean flag = false;
		if (conn == null) {
			conn = AlumniDb.getAlumniDb();
		}
		try {
			String query = "insert into alumni_master (alumni_id,alumni_name, current_comp,col_id, alumni_post, alumni_yop, alumni_experience,alumni_gender) values(?,?,?,?,?,?,?,?)";
			ps = conn.prepareStatement(query);
			ps.setString(1, dto.getAlumni_id());
			ps.setString(2, dto.getAlumni_name());
			ps.setString(3, dto.getCurrent_comp());
			ps.setString(4, dto.getCol_id());
			ps.setString(5, dto.getAlumni_post());
			ps.setString(6, dto.getAlumni_yop());
			ps.setString(7, dto.getAlumni_experience());
			ps.setString(8, dto.getAlumni_gender());
			if (ps.executeUpdate() > 0) {
				flag = true;
			}

		} catch (Exception e) {
			System.out.println("Exception at addAlumni()" + e);
		} finally {
			ps = null;
			conn = null;
			return flag;
		}
	}

	public boolean updateAlumni(AlumniDto dto) {
		boolean flag = false;
		if (conn == null) {
			conn = AlumniDb.getAlumniDb();
		}
		try {
			String query = "update alumni_master set alumni_name=?, current_comp=?,col_id=?, alumni_post=?, alumni_yop=?, alumni_experience=?, alumni_gender=? where alumni_id=?";
			ps = conn.prepareStatement(query);
			ps.setString(1, dto.getAlumni_name());
			ps.setString(2, dto.getCurrent_comp());
			ps.setString(3, dto.getCol_id());
			ps.setString(4, dto.getAlumni_post());
			ps.setString(5, dto.getAlumni_yop());
			ps.setString(6, dto.getAlumni_experience());
			ps.setString(7, dto.getAlumni_gender());
			ps.setString(8, dto.getAlumni_id());
			if (ps.executeUpdate() > 0) {
				flag = true;
			}
		} catch (Exception e) {
			System.out.println("Exception at updateAlumni()" + e);
		} finally {
			ps = null;
			conn = null;
			return flag;
		}
	}

	public boolean deleteAlumni(String alumni_id) {
		boolean flag = false;
		if (conn == null) {
			conn = AlumniDb.getAlumniDb();
		}
		try {
			String query = "delete from alumni_master where alumni_id=?";
			ps = conn.prepareStatement(query);
			ps.setString(1, alumni_id);
			if (ps.executeUpdate() > 0) {
				flag = true;
			}
		} catch (Exception e) {
			System.out.println("Exception at deleteAlumni()" + e);
		} finally {
			ps = null;
			conn = null;
			return flag;
		}
	}

	public ArrayList<AlumniDto> getAllAlumni() {
		ArrayList<AlumniDto> list = new ArrayList<AlumniDto>();
		if (conn == null) {
			conn = AlumniDb.getAlumniDb();
		}
		try {
			String query = "select * from alumni_master";
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();
			AlumniDto dto;
			while (rs.next()) {
				dto = new AlumniDto();
				dto.setAlumni_id(rs.getString("alumni_id"));
				dto.setAlumni_name(rs.getString("alumni_name"));
				dto.setCurrent_comp(rs.getString("current_comp"));
				dto.setCol_id(rs.getString("col_id"));
				dto.setAlumni_post(rs.getString("alumni_post"));
				dto.setAlumni_yop(rs.getString("alumni_yop"));
				dto.setAlumni_experience(rs.getString("alumni_experience"));
				dto.setAlumni_gender(rs.getString("alumni_gender"));
				list.add(dto);
			}
		} catch (Exception e) {
			System.out.println("Exception at deleteAlumni()" + e);
		} finally {
			ps = null;
			rs = null;
			conn = null;
			return list;
		}
	}

	public ArrayList<AlumniDto> getAlumni(String alumni_id) {
		ArrayList<AlumniDto> list = new ArrayList<AlumniDto>();
		if (conn == null) {
			conn = AlumniDb.getAlumniDb();
		}
		try {
			String query = "select * from alumni_master where alumni_id=?";
			ps = conn.prepareStatement(query);
			ps.setString(1, alumni_id);
			rs = ps.executeQuery();
			AlumniDto dto;
			while (rs.next()) {
				dto = new AlumniDto();
				dto.setAlumni_id(rs.getString("alumni_id"));
				dto.setAlumni_name(rs.getString("alumni_name"));
				dto.setCurrent_comp(rs.getString("current_comp"));
				dto.setCol_id(rs.getString("col_id"));
				dto.setAlumni_post(rs.getString("alumni_post"));
				dto.setAlumni_yop(rs.getString("alumni_yop"));
				dto.setAlumni_experience(rs.getString("alumni_experience"));
				dto.setAlumni_gender(rs.getString("alumni_gender"));
				list.add(dto);
			}
		} catch (Exception e) {
			System.out.println("Exception at deleteAlumni()" + e);
		} finally {
			ps = null;
			rs = null;
			conn = null;
			return list;
		}
	}

}
