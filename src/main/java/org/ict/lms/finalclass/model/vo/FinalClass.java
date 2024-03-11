package org.ict.lms.finalclass.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class FinalClass implements Serializable {

	private static final long serialVersionUID = 6622136091122627265L;
	private String classCode;
	private String className;
	private String classGoal;
	private Date uploadDate;
	private Date executeDate;
	private String profCode;
	private String profName;
	
	public FinalClass() {
		super();
	}

	public FinalClass(String classCode, String className, String classGoal, Date uploadDate, Date executeDate,
			String profCode, String profName) {
		super();
		this.classCode = classCode;
		this.className = className;
		this.classGoal = classGoal;
		this.uploadDate = uploadDate;
		this.executeDate = executeDate;
		this.profCode = profCode;
		this.profName = profName;
	}

}
