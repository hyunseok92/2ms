package org.ict.lms.quiz.model.vo;

import java.io.Serializable;
import java.util.Date;

public class Quiz_q implements Serializable {
	private static final long serialVersionUID = -7815777833188561846L;

	private int quiz_seq;
	private String prof_code;
	private String quiz_content;
	private Date quiz_date;
	
	public Quiz_q() {
		super();
	}
	public Quiz_q(int quiz_seq, String prof_code, String quiz_content, Date quiz_date) {
		super();
		this.quiz_seq = quiz_seq;
		this.prof_code = prof_code;
		this.quiz_content = quiz_content;
		this.quiz_date = quiz_date;
	}
	public int getQuiz_seq() {
		return quiz_seq;
	}
	public void setQuiz_seq(int quiz_seq) {
		this.quiz_seq = quiz_seq;
	}
	public String getProf_code() {
		return prof_code;
	}
	public void setProf_code(String prof_code) {
		this.prof_code = prof_code;
	}
	public String getQuiz_content() {
		return quiz_content;
	}
	public void setQuiz_content(String quiz_content) {
		this.quiz_content = quiz_content;
	}
	public Date getQuiz_date() {
		return quiz_date;
	}
	public void setQuiz_date(Date quiz_date) {
		this.quiz_date = quiz_date;
	}
	@Override
	public String toString() {
		return "Quiz_a [quiz_seq=" + quiz_seq + ", prof_code=" + prof_code + ", quiz_content=" + quiz_content + ", quiz_date=" + quiz_date + "]";
	}
}
