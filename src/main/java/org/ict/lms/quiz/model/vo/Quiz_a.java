package org.ict.lms.quiz.model.vo;

import java.io.Serializable;

public class Quiz_a implements Serializable {
	private static final long serialVersionUID = 8625802000364917281L;
	
	private int quiz_seq;
	private String student_code;
	private String quiz_answer;
	public Quiz_a() {
		super();
	}
	public Quiz_a(int quiz_seq, String student_code, String quiz_answer) {
		super();
		this.quiz_seq = quiz_seq;
		this.student_code = student_code;
		this.quiz_answer = quiz_answer;
	}
	public int getQuiz_seq() {
		return quiz_seq;
	}
	public void setQuiz_seq(int quiz_seq) {
		this.quiz_seq = quiz_seq;
	}
	public String getStudent_code() {
		return student_code;
	}
	public void setStudent_code(String student_code) {
		this.student_code = student_code;
	}
	public String getQuiz_answer() {
		return quiz_answer;
	}
	public void setQuiz_answer(String quiz_answer) {
		this.quiz_answer = quiz_answer;
	}
	@Override
	public String toString() {
		return "Quiz_a [quiz_seq=" + quiz_seq + ", student_code=" + student_code + ", quiz_answer=" + quiz_answer + "]";
	}
	
	
	
}
