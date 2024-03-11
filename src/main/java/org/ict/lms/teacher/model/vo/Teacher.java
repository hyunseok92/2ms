package org.ict.lms.teacher.model.vo;

import java.io.Serializable;
import java.util.Date;

public class Teacher implements Serializable{

	private static final long serialVersionUID = 5994359505012209424L;
	
	private String prof_Code;
	private String name;
	private String resident_Number;
	private String email;
	private String id;
	private String pwd;
	private String photo;
	private String cv;
	private String certificate;
	private String signAture_Img;
	private Date modified_Date;
	private String inactive_OR_Not;
	private String grade;
	private String phone;
	private String class_code;
	
	public Teacher() {
		super();
	}

	public Teacher(String prof_Code, String name, String resident_Number, String email, String id, String pwd,
			String photo, String cv, String certificate, String signAture_Img, Date modified_Date,
			String inactive_OR_Not, String grade, String phone, String class_code) {
		super();
		this.prof_Code = prof_Code;
		this.name = name;
		this.resident_Number = resident_Number;
		this.email = email;
		this.id = id;
		this.pwd = pwd;
		this.photo = photo;
		this.cv = cv;
		this.certificate = certificate;
		this.signAture_Img = signAture_Img;
		this.modified_Date = modified_Date;
		this.inactive_OR_Not = inactive_OR_Not;
		this.grade = grade;
		this.phone = phone;
		this.class_code = class_code;
	}

	public String getProf_Code() {
		return prof_Code;
	}

	public void setProf_Code(String prof_Code) {
		this.prof_Code = prof_Code;
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

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public String getCv() {
		return cv;
	}

	public void setCv(String cv) {
		this.cv = cv;
	}

	public String getCertificate() {
		return certificate;
	}

	public void setCertificate(String certificate) {
		this.certificate = certificate;
	}

	public String getSignAture_Img() {
		return signAture_Img;
	}

	public void setSignAture_Img(String signAture_Img) {
		this.signAture_Img = signAture_Img;
	}

	public Date getModified_Date() {
		return modified_Date;
	}

	public void setModified_Date(Date modified_Date) {
		this.modified_Date = modified_Date;
	}

	public String getInactive_OR_Not() {
		return inactive_OR_Not;
	}

	public void setInactive_OR_Not(String inactive_OR_Not) {
		this.inactive_OR_Not = inactive_OR_Not;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
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
	
	public String getClass_code() {
		return class_code;
	}

	public void setClass_code(String class_code) {
		this.class_code = class_code;
	}

	@Override
	public String toString() {
		return "Teacher [prof_Code=" + prof_Code + ", name=" + name + ", resident_Number=" + resident_Number
				+ ", email=" + email + ", id=" + id + ", pwd=" + pwd + ", photo=" + photo + ", cv=" + cv
				+ ", certificate=" + certificate + ", signAture_Img=" + signAture_Img + ", modified_Date="
				+ modified_Date + ", inactive_OR_Not=" + inactive_OR_Not + ", grade=" + grade + ", phone=" + phone
				+ ", class_code=" + class_code + "]";
	}
}
