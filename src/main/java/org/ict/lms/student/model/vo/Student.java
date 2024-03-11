package org.ict.lms.student.model.vo;

import java.io.Serializable;
import java.util.Date;

public class Student implements Serializable{

	private static final long serialVersionUID = 1251262566079891765L;
	private String studentCode;
	private String name;
	private String resident_Number;
	private String email;
	private String id;
	private String pwd;
	private Date modified_Date;
	private String eduation;
	private String school;
	private String inactive_OR_Not;
	private String class_code;
	private String phone;
	
	public Student() {
		super();
	}

	public Student(String studentCode, String name, String resident_Number, String email, String id, String pwd,
			Date modified_Date, String eduation, String school, String inactive_OR_Not, String class_code,
			String phone) {
		super();

		this.studentCode = studentCode;
		this.name = name;
		this.resident_Number = resident_Number;
		this.email = email;
		this.id = id;
		this.pwd = pwd;
		this.modified_Date = modified_Date;
		this.eduation = eduation;
		this.school = school;
		this.inactive_OR_Not = inactive_OR_Not;
		this.class_code = class_code;
		this.phone = phone;
	}

	public String getStudentCode() {
		return studentCode;
	}

	public void setStudentCode(String studentCode) {
		this.studentCode = studentCode;
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

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public Date getModified_Date() {
		return modified_Date;
	}

	public void setModified_Date(Date modified_Date) {
		this.modified_Date = modified_Date;
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

	public String getInactive_OR_Not() {
		return inactive_OR_Not;
	}

	public void setInactive_OR_Not(String inactive_OR_Not) {
		this.inactive_OR_Not = inactive_OR_Not;
	}

	public String getClass_Code() {
		return class_code;
	}

	public void setClass_Code(String class_Code) {
		this.class_code = class_Code;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Student [studentCode=" + studentCode + ", name=" + name + ", resident_Number=" + resident_Number
				+ ", email=" + email + ", id=" + id + ", pwd=" + pwd + ", modified_Date=" + modified_Date
				+ ", eduation=" + eduation + ", school=" + school + ", inactive_OR_Not=" + inactive_OR_Not
				+ ", class_Code=" + class_code + ", phone=" + phone + "]";
	}	
	
}
