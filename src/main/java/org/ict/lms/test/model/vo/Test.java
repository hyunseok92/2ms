package org.ict.lms.test.model.vo;

import java.io.Serializable;

public class Test implements Serializable {
	private static final long serialVersionUID = -7012052493977215924L;
	
	private String testCode;
	private int testNo;
	private String testQ;
	private String testQ1;
	private String testQ2;
	private String testQ3;
	private String testQ4;
	private String testRA;
	private int testScore;
	private String ability;
	public Test() {
		super();
	}
	public Test(String testCode, int testNo, String testQ, String testQ1, String testQ2, String testQ3, String testQ4,
			String testRA, int testScore, String ability) {
		super();
		this.testCode = testCode;
		this.testNo = testNo;
		this.testQ = testQ;
		this.testQ1 = testQ1;
		this.testQ2 = testQ2;
		this.testQ3 = testQ3;
		this.testQ4 = testQ4;
		this.testRA = testRA;
		this.testScore = testScore;
		this.ability = ability;
	}
	public String getTestCode() {
		return testCode;
	}
	public void setTestCode(String testCode) {
		this.testCode = testCode;
	}
	public int getTestNo() {
		return testNo;
	}
	public void setTestNo(int testNo) {
		this.testNo = testNo;
	}
	public String getTestQ() {
		return testQ;
	}
	public void setTestQ(String testQ) {
		this.testQ = testQ;
	}
	public String getTestQ1() {
		return testQ1;
	}
	public void setTestQ1(String testQ1) {
		this.testQ1 = testQ1;
	}
	public String getTestQ2() {
		return testQ2;
	}
	public void setTestQ2(String testQ2) {
		this.testQ2 = testQ2;
	}
	public String getTestQ3() {
		return testQ3;
	}
	public void setTestQ3(String testQ3) {
		this.testQ3 = testQ3;
	}
	public String getTestQ4() {
		return testQ4;
	}
	public void setTestQ4(String testQ4) {
		this.testQ4 = testQ4;
	}
	public String getTestRA() {
		return testRA;
	}
	public void setTestRA(String testRA) {
		this.testRA = testRA;
	}
	public int getTestScore() {
		return testScore;
	}
	public void setTestScore(int testScore) {
		this.testScore = testScore;
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
		return "Test [testCode=" + testCode + ", testNo=" + testNo + ", testQ=" + testQ + ", testQ1=" + testQ1
				+ ", testQ2=" + testQ2 + ", testQ3=" + testQ3 + ", testQ4=" + testQ4 + ", testRA=" + testRA
				+ ", testScore=" + testScore + ", ability=" + ability + "]";
	}
	
	
	

}
