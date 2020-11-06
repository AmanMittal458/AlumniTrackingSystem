package com.alumni_track.student;

public class StudentDto {
	private String  student_name, student_phoneno, col_id, student_sem, student_yop,student_id,student_gender,student_email;
	public String getStudent_email() {
		return student_email;
	}

	public void setStudent_email(String student_email) {
		this.student_email = student_email;
	}

	public String getStudent_gender() {
		return student_gender;
	}

	public void setStudent_gender(String student_gender) {
		this.student_gender = student_gender;
	}

	public StudentDto(){}
	
	public String getStudent_name() {
		return student_name;
	}
	public void setStudent_name(String student_name) {
		this.student_name = student_name;
	}
	public String getStudent_phoneno() {
		return student_phoneno;
	}
	public void setStudent_phoneno(String student_phoneno) {
		this.student_phoneno = student_phoneno;
	}
	public String getCol_id() {
		return col_id;
	}
	public void setCol_id(String col_id) {
		this.col_id = col_id;
	}
	
	public String getStudent_sem() {
		return student_sem;
	}
	public void setStudent_sem(String student_sem) {
		this.student_sem = student_sem;
	}
	public String getStudent_yop() {
		return student_yop;
	}
	public void setStudent_yop(String student_yop) {
		this.student_yop = student_yop;
	}
	public String getStudent_id() {
		return student_id;
	}
	public void setStudent_id(String student_id) {
		this.student_id = student_id;
	}
			
}
