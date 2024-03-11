package org.ict.lms.course.model.vo;

import java.io.Serializable;
import java.sql.Date;
import java.util.Arrays;

public class CourseAndSubjects implements Serializable {

	private static final long serialVersionUID = 4561641810658575771L;
	
	private String classCode;
	private String className;
	private String classGoal;
	private Date uploadDate;
	private Date executeDate;
	private String confirmed;
	private String profCode;
	private String profConfirm;
	
	private String[] subjectCode;
	private String[] subjectName;
	private int[] basicTime;
	
	public CourseAndSubjects() {
		super();
	}

	public CourseAndSubjects(String classCode, String className, String classGoal, Date uploadDate, Date executeDate,
			String confirmed, String profCode, String profConfirm, String[] subjectCode, String[] subjectName,
			int[] basicTime) {
		super();
		this.classCode = classCode;
		this.className = className;
		this.classGoal = classGoal;
		this.uploadDate = uploadDate;
		this.executeDate = executeDate;
		this.confirmed = confirmed;
		this.profCode = profCode;
		this.profConfirm = profConfirm;
		this.subjectCode = subjectCode;
		this.subjectName = subjectName;
		this.basicTime = basicTime;
	}

	@Override
	public String toString() {
		return "CourseAndSubjects [classCode=" + classCode + ", className=" + className + ", classGoal=" + classGoal
				+ ", uploadDate=" + uploadDate + ", executeDate=" + executeDate + ", confirmed=" + confirmed
				+ ", profCode=" + profCode + ", profConfirm=" + profConfirm + ", subjectCode="
				+ Arrays.toString(subjectCode) + ", subjectName=" + Arrays.toString(subjectName) + ", basicTime="
				+ Arrays.toString(basicTime) + "]";
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

	public Date getUploadDate() {
		return uploadDate;
	}

	public void setUploadDate(Date uploadDate) {
		this.uploadDate = uploadDate;
	}

	public Date getExecuteDate() {
		return executeDate;
	}

	public void setExecuteDate(Date executeDate) {
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

	public String[] getSubjectCode() {
		return subjectCode;
	}

	public void setSubjectCode(String[] subjectCode) {
		this.subjectCode = subjectCode;
	}

	public String[] getSubjectName() {
		return subjectName;
	}

	public void setSubjectName(String[] subjectName) {
		this.subjectName = subjectName;
	}

	public int[] getBasicTime() {
		return basicTime;
	}

	public void setBasicTime(int[] basicTime) {
		this.basicTime = basicTime;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
}
