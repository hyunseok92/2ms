package org.ict.lms.att.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Attendence implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 5204328930424354741L;
	
	private String student_code;
	private String class_code;
	private String name;
	private String resident_Number;
	private String phone;
	private String eduation;
	private String school;
	private String attdate;
	private String status;
	private String note;
	private String prof_code;
	
	public String getStudent_code() {
		return student_code;
	}
	public void setStudent_code(String student_code) {
		this.student_code = student_code;
	}
	public String getClass_code() {
		return class_code;
	}
	public void setClass_code(String class_code) {
		this.class_code = class_code;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getResident_Number() {
		return resident_Number;
	}
	public void setResident_Number(String resident_Number) {
		this.resident_Number = resident_Number;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEduation() {
		return eduation;
	}
	public void setEduation(String eduation) {
		this.eduation = eduation;
	}
	public String getSchool() {
		return school;
	}
	public void setSchool(String school) {
		this.school = school;
	}
	public String getAttdate() {
		return attdate;
	}
	public void setAttdate(String attdate) {
		this.attdate = attdate;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public String getProf_code() {
		return prof_code;
	}
	public void setProf_code(String prof_code) {
		this.prof_code = prof_code;
	}
	@Override
	public String toString() {
		return "Attendence [student_code=" + student_code + ", class_code=" + class_code + ", name=" + name
				+ ", resident_Number=" + resident_Number + ", phone=" + phone + ", eduation=" + eduation + ", school="
				+ school + ", attdate=" + attdate + ", status=" + status + ", note=" + note + ", prof_code=" + prof_code
				+ "]";
	}
	

	
}
