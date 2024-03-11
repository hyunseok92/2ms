package org.ict.lms.quiz.model.service;

import java.util.ArrayList;

import org.ict.lms.quiz.model.dao.QuizDao;
import org.ict.lms.quiz.model.vo.Quiz_a;
import org.ict.lms.quiz.model.vo.Quiz_q;
import org.ict.lms.student.model.vo.Student;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("quizService")
public class QuizServiceImpl implements QuizService{
	
	@Autowired private QuizDao quizDao;

	@Override
	public Quiz_q selectReceiveQuiz(String student_code) {
		return quizDao.selectReceiveQuiz(student_code);
	}
	
	@Override
	public Quiz_a selectQuizAnswered(Quiz_a quiz_a) {
		return quizDao.selectQuizAnswered(quiz_a);
	}
	
	@Override
	public ArrayList<Student> selectQuizAnswerList(Quiz_q quiz_q) {
		return quizDao.selectQuizAnswerList(quiz_q);
	}
	
	@Override
	public int insertQuiz(Quiz_q quiz_q) {
		return quizDao.insertQuiz(quiz_q);
	}

	@Override
	public int insertQuizAnswer(Quiz_a quiz_a) {
		return quizDao.insertQuizAnswer(quiz_a);
	}

}
