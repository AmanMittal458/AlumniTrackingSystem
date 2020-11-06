package com.alumni_track.db;

import java.sql.Connection;
import java.sql.DriverManager;

public class AlumniDb implements dbData {
	private static Connection conn = null;

	private AlumniDb() {

	}

	public static Connection getAlumniDb() {
		return conn;
	}

	static {
		try {
			Class.forName(DRIVER);
			conn = DriverManager.getConnection(URL, USER, PWD);
		} catch (Exception e) {
			System.out.println("Error in AlumniDb" + e);
		}

	}

	public static void main(String args[]) {
		System.out.println(getAlumniDb());
	}
}
