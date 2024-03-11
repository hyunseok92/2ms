package org.ict.lms.tHomework.model.vo;

import java.sql.Date;

public class THomework {
	private String HWCode;
	private String teacherCode;
	private String teacherName;
	private Date HWStartDate;
	private Date HWEndDate;
	private String subjectCode;
	private String THWFile;
	private String THWRFile;
	private String THWTitle;
	private String THWContent;
	private String classCode;
	public THomework() {
		super();
	}
	public THomework(String hWCode, String teacherCode, String teacherName, Date hWStartDate, Date hWEndDate,
			String subjectCode, String tHWFile, String tHWRFile, String tHWTitle, String tHWContent, String classCode) {
		super();
		HWCode = hWCode;
		this.teacherCode = teacherCode;
		this.teacherName = teacherName;
		HWStartDate = hWStartDate;
		HWEndDate = hWEndDate;
		this.subjectCode = subjectCode;
		THWFile = tHWFile;
		THWRFile = tHWRFile;
		THWTitle = tHWTitle;
		THWContent = tHWContent;
		this.classCode = classCode;
	}
	public String getHWCode() {
		return HWCode;
	}
	public void setHWCode(String hWCode) {
		HWCode = hWCode;
	}
	public String getTeacherCode() {
		return teacherCode;
	}
	public void setTeacherCode(String teacherCode) {
		this.teacherCode = teacherCode;
	}
	public String getTeacherName() {
		return teacherName;
	}
	public void setTeacherName(String teacherName) {
		this.teacherName = teacherName;
	}
	public Date getHWStartDate() {
		return HWStartDate;
	}
	public void setHWStartDate(Date hWStartDate) {
		HWStartDate = hWStartDate;
	}
	public Date getHWEndDate() {
		return HWEndDate;
	}
	public void setHWEndDate(Date hWEndDate) {
		HWEndDate = hWEndDate;
	}
	public String getSubjectCode() {
		return subjectCode;
	}
	public void setSubjectCode(String subjectCode) {
		this.subjectCode = subjectCode;
	}
	public String getTHWFile() {
		return THWFile;
	}
	public void setTHWFile(String tHWFile) {
		THWFile = tHWFile;
	}
	public String getTHWRFile() {
		return THWRFile;
	}
	public void setTHWRFile(String tHWRFile) {
		THWRFile = tHWRFile;
	}
	public String getTHWTitle() {
		return THWTitle;
	}
	public void setTHWTitle(String tHWTitle) {
		THWTitle = tHWTitle;
	}
	public String getTHWContent() {
		return THWContent;
	}
	public void setTHWContent(String tHWContent) {
		THWContent = tHWContent;
	}
	public String getClassCode() {
		return classCode;
	}
	public void setClassCode(String classCode) {
		this.classCode = classCode;
	}
	@Override
	public String toString() {
		return "THomework [HWCode=" + HWCode + ", teacherCode=" + teacherCode + ", teacherName=" + teacherName
				+ ", HWStartDate=" + HWStartDate + ", HWEndDate=" + HWEndDate + ", subjectCode=" + subjectCode
				+ ", THWFile=" + THWFile + ", THWRFile=" + THWRFile + ", THWTitle=" + THWTitle + ", THWContent="
				+ THWContent + ", classCode=" + classCode + "]";
	}
	
	
}
