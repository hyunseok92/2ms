package org.ict.lms.sTest.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class STest implements Serializable{
 static final long serialVersionUID = -9060347865554008584L;
 
	private String testCode;
	private String testA;
	private String testYN;
	private int testScore;
	private String studentCode;
	private String studentName;
	private int scoreSum;
	private Date testDate;
	private int testNo;
	private String classCode;
	private String testOK;
	private String testQ;
	private String testRA;
	private String ability;
	public STest() {
		super();
	}
	public STest(String testCode, String testA, String testYN, int testScore, String studentCode, String studentName,
			int scoreSum, Date testDate, int testNo, String classCode, String testOK, String testQ, String testRA,
			String ability) {
		super();
		this.testCode = testCode;
		this.testA = testA;
		this.testYN = testYN;
		this.testScore = testScore;
		this.studentCode = studentCode;
		this.studentName = studentName;
		this.scoreSum = scoreSum;
		this.testDate = testDate;
		this.testNo = testNo;
		this.classCode = classCode;
		this.testOK = testOK;
		this.testQ = testQ;
		this.testRA = testRA;
		this.ability = ability;
	}
	public String getTestCode() {
		return testCode;
	}
	public void setTestCode(String testCode) {
		this.testCode = testCode;
	}
	public String getTestA() {
		return testA;
	}
	public void setTestA(String testA) {
		this.testA = testA;
	}
	public String getTestYN() {
		return testYN;
	}
	public void setTestYN(String testYN) {
		this.testYN = testYN;
	}
	public int getTestScore() {
		return testScore;
	}
	public void setTestScore(int testScore) {
		this.testScore = testScore;
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
	public int getScoreSum() {
		return scoreSum;
	}
	public void setScoreSum(int scoreSum) {
		this.scoreSum = scoreSum;
	}
	public Date getTestDate() {
		return testDate;
	}
	public void setTestDate(Date testDate) {
		this.testDate = testDate;
	}
	public int getTestNo() {
		return testNo;
	}
	public void setTestNo(int testNo) {
		this.testNo = testNo;
	}
	public String getClassCode() {
		return classCode;
	}
	public void setClassCode(String classCode) {
		this.classCode = classCode;
	}
	public String getTestOK() {
		return testOK;
	}
	public void setTestOK(String testOK) {
		this.testOK = testOK;
	}
	public String getTestQ() {
		return testQ;
	}
	public void setTestQ(String testQ) {
		this.testQ = testQ;
	}
	public String getTestRA() {
		return testRA;
	}
	public void setTestRA(String testRA) {
		this.testRA = testRA;
	}
	public String getAbility() {
		return ability;
	}
	public void setAbility(String ability) {
		this.ability = ability;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "STest [testCode=" + testCode + ", testA=" + testA + ", testYN=" + testYN + ", testScore=" + testScore
				+ ", studentCode=" + studentCode + ", studentName=" + studentName + ", scoreSum=" + scoreSum
				+ ", testDate=" + testDate + ", testNo=" + testNo + ", classCode=" + classCode + ", testOK=" + testOK
				+ ", testQ=" + testQ + ", testRA=" + testRA + ", ability=" + ability + "]";
	}

	

	
	
	
}
