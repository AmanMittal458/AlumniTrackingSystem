package com.alumni_track.college;

import java.io.Serializable;

public class CollegeDto implements Serializable{
	private String col_id, col_name, col_city, col_phoneno, col_email;
	public CollegeDto(){}
	public String getCol_id() {
		return col_id;
	}
	public void setCol_id(String col_id) {
		this.col_id = col_id;
	}
	
	public String getCol_name() {
		return col_name;
	}
	public void setCol_name(String col_name) {
		this.col_name = col_name;
	}
	public String getCol_city() {
		return col_city;
	}
	public void setCol_city(String col_city) {
		this.col_city = col_city;
	}
	public String getCol_phoneno() {
		return col_phoneno;
	}
	public void setCol_phoneno(String col_phoneno) {
		this.col_phoneno = col_phoneno;
	}
	public String getCol_email() {
		return col_email;
	}
	public void setCol_email(String col_email) {
		this.col_email = col_email;
	}
	
	
}
