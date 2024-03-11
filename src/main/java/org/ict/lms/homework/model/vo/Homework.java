package org.ict.lms.homework.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Homework implements Serializable{
	private static final long serialVersionUID = 8577775033070655204L;
	
	private String HWCode;
	private Date SHWDate;
	private String SHWFile;
	private String SHWRFile;
	private String HWComent;
	private String HWRST;
	private String studentCode;
	private String studentName;
	private String HWcontent;
	private String className;
	private String classCode;
	private String teacherCode;
	public Homework() {
		super();
	}
	public Homework(String hWCode, Date sHWDate, String sHWFile, String sHWRFile, String hWComent, String hWRST,
			String studentCode, String studentName, String hWcontent, String className, String classCode,
			String teacherCode) {
		super();
		HWCode = hWCode;
		SHWDate = sHWDate;
		SHWFile = sHWFile;
		SHWRFile = sHWRFile;
		HWComent = hWComent;
		HWRST = hWRST;
		this.studentCode = studentCode;
		this.studentName = studentName;
		HWcontent = hWcontent;
		this.className = className;
		this.classCode = classCode;
		this.teacherCode = teacherCode;
	}
	public String getHWCode() {
		return HWCode;
	}
	public void setHWCode(String hWCode) {
		HWCode = hWCode;
	}
	public Date getSHWDate() {
		return SHWDate;
	}
	public void setSHWDate(Date sHWDate) {
		SHWDate = sHWDate;
	}
	public String getSHWFile() {
		return SHWFile;
	}
	public void setSHWFile(String sHWFile) {
		SHWFile = sHWFile;
	}
	public String getSHWRFile() {
		return SHWRFile;
	}
	public void setSHWRFile(String sHWRFile) {
		SHWRFile = sHWRFile;
	}
	public String getHWComent() {
		return HWComent;
	}
	public void setHWComent(String hWComent) {
		HWComent = hWComent;
	}
	public String getHWRST() {
		return HWRST;
	}
	public void setHWRST(String hWRST) {
		HWRST = hWRST;
	}
	public String getStudentCode() {
		return studentCode;
	}
	public void setStudentCode(String studentCode) {
		this.studentCode = studentCode;
	}
	public String getStudentName() {
		return studentName;
	}
	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}
	public String getHWcontent() {
		return HWcontent;
	}
	public void setHWcontent(String hWcontent) {
		HWcontent = hWcontent;
	}
	public String getClassName() {
		return className;
	}
	public void setClassName(String className) {
		this.className = className;
	}
	public String getClassCode() {
		return classCode;
	}
	public void setClassCode(String classCode) {
		this.classCode = classCode;
	}
	public String getTeacherCode() {
		return teacherCode;
	}
	public void setTeacherCode(String teacherCode) {
		this.teacherCode = teacherCode;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "Homework [HWCode=" + HWCode + ", SHWDate=" + SHWDate + ", SHWFile=" + SHWFile + ", SHWRFile=" + SHWRFile
				+ ", HWComent=" + HWComent + ", HWRST=" + HWRST + ", studentCode=" + studentCode + ", studentName="
				+ studentName + ", HWcontent=" + HWcontent + ", className=" + className + ", classCode=" + classCode
				+ ", teacherCode=" + teacherCode + "]";
	}
	
}
