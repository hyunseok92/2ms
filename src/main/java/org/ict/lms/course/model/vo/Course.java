package org.ict.lms.course.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Course implements Serializable {

	private static final long serialVersionUID = -3209804608046545712L;
	private String classCode;
	private String className;
	private String classGoal;
	private String uploadDate;
	private String executeDate;
	private String confirmed;
	private String profCode;
	private String profConfirm;
	private String name;
	
	public Course() {
		super();
	}

	public Course(String classCode, String className, String classGoal, String uploadDate, String executeDate,
			String confirmed, String profCode, String profConfirm) {
		super();
		this.classCode = classCode;
		this.className = className;
		this.classGoal = classGoal;
		this.uploadDate = uploadDate;
		this.executeDate = executeDate;
		this.confirmed = confirmed;
		this.profCode = profCode;
		this.profConfirm = profConfirm;
	}


	@Override
	public String toString() {
		return "Course [classCode=" + classCode + ", className=" + className + ", classGoal=" + classGoal
				+ ", uploadDate=" + uploadDate + ", executeDate=" + executeDate + ", confirmed=" + confirmed
				+ ", profCode=" + profCode + ", profConfirm=" + profConfirm + "]";
	}

	public String getClassCode() {
		return classCode;
	}

	public void setClassCode(String classCode) {
		this.classCode = classCode;
	}

	public String getClassName() {
		return className;
	}

	public void setClassName(String className) {
		this.className = className;
	}

	public String getClassGoal() {
		return classGoal;
	}

	public void setClassGoal(String classGoal) {
		this.classGoal = classGoal;
	}

	public String getUploadDate() {
		return uploadDate;
	}

	public void setUploadDate(String uploadDate) {
		this.uploadDate = uploadDate;
	}

	public String getExecuteDate() {
		return executeDate;
	}

	public void setExecuteDate(String executeDate) {
		this.executeDate = executeDate;
	}

	public String getConfirmed() {
		return confirmed;
	}

	public void setConfirmed(String confirmed) {
		this.confirmed = confirmed;
	}

	public String getProfCode() {
		return profCode;
	}

	public void setProfCode(String profCode) {
		this.profCode = profCode;
	}


	public String getProfConfirm() {
		return profConfirm;
	}

	public void setProfConfirm(String profConfirm) {
		this.profConfirm = profConfirm;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

}
