package org.ict.lms.quiz.model.service;

import java.util.ArrayList;

import org.ict.lms.quiz.model.vo.Quiz_a;
import org.ict.lms.quiz.model.vo.Quiz_q;
import org.ict.lms.student.model.vo.Student;

public interface QuizService {

	//sel
	public Quiz_q selectReceiveQuiz(String student_code);
	public Quiz_a selectQuizAnswered(Quiz_a quiz_a);
	public ArrayList<Student> selectQuizAnswerList(Quiz_q quiz_q);
	//ins
	public int insertQuiz(Quiz_q quiz_q);
	public int insertQuizAnswer(Quiz_a quiz_a);
	//upd

	//del
}
