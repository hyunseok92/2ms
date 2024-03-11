package org.ict.lms.designedsubject.model.vo;

import java.io.Serializable;

public class DesignedSubject implements Serializable {

	private static final long serialVersionUID = -2477102963050174094L;
	
	private String subjectCode;
	private String subjectName;
	private String classCode;
	private int setTime;
	private int subjIndex;
	
	public DesignedSubject() {
		super();
	}

	public DesignedSubject(String subjectCode, String subjectName, String classCode, int setTime, int subjIndex) {
		super();
		this.subjectCode = subjectCode;
		this.subjectName = subjectName;
		this.classCode = classCode;
		this.setTime = setTime;
		this.subjIndex = subjIndex;
	}

	@Override
	public String toString() {
		return "DesignedSubject [subjectCode=" + subjectCode + ", subjectName=" + subjectName + ", classCode="
				+ classCode + ", setTime=" + setTime + ", subjIndex=" + subjIndex + "]";
	}

	public String getSubjectCode() {
		return subjectCode;
	}

	public void setSubjectCode(String subjectCode) {
		this.subjectCode = subjectCode;
	}

	public String getSubjectName() {
		return subjectName;
	}

	public void setSubjectName(String subjectName) {
		this.subjectName = subjectName;
	}

	public String getClassCode() {
		return classCode;
	}

	public void setClassCode(String classCode) {
		this.classCode = classCode;
	}

	public int getSetTime() {
		return setTime;
	}

	public void setSetTime(int setTime) {
		this.setTime = setTime;
	}

	public int getSubjIndex() {
		return subjIndex;
	}

	public void setSubjIndex(int subjIndex) {
		this.subjIndex = subjIndex;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

}
