package com.alumni_track.alumni;

import java.io.Serializable;

public class AlumniDto implements Serializable {
	private String alumni_id, alumni_name, current_comp,col_id, alumni_post, alumni_yop, alumni_experience,alumni_gender;

	public String getAlumni_gender() {
		return alumni_gender;
	}
	public void setAlumni_gender(String alumni_gender) {
		this.alumni_gender = alumni_gender;
	}
	public AlumniDto(){}
	public String getAlumni_id() {
		return alumni_id;
	}

	public void setAlumni_id(String alumni_id) {
		this.alumni_id = alumni_id;
	}

	public String getAlumni_name() {
		return alumni_name;
	}

	public void setAlumni_name(String alumni_name) {
		this.alumni_name = alumni_name;
	}

	public String getCurrent_comp() {
		return current_comp;
	}

	public void setCurrent_comp(String current_comp) {
		this.current_comp = current_comp;
	}


	public String getCol_id() {
		return col_id;
	}

	public void setCol_id(String col_id) {
		this.col_id = col_id;
	}

	public String getAlumni_post() {
		return alumni_post;
	}

	public void setAlumni_post(String alumni_post) {
		this.alumni_post = alumni_post;
	}

	public String getAlumni_yop() {
		return alumni_yop;
	}

	public void setAlumni_yop(String alumni_yop) {
		this.alumni_yop = alumni_yop;
	}

	public String getAlumni_experience() {
		return alumni_experience;
	}

	public void setAlumni_experience(String alumni_experience) {
		this.alumni_experience = alumni_experience;
	}
	
}

