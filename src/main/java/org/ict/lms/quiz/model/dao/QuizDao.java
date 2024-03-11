package org.ict.lms.quiz.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.ict.lms.quiz.model.vo.Quiz_a;
import org.ict.lms.quiz.model.vo.Quiz_q;
import org.ict.lms.student.model.vo.Student;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("quizDao")
public class QuizDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	//sel
	public Quiz_q selectReceiveQuiz(String student_code) {
		return sqlSessionTemplate.selectOne("quizMapper.selectReceiveQuiz", student_code);
	}
	
	public Quiz_a selectQuizAnswered(Quiz_a quiz_a) {
		return sqlSessionTemplate.selectOne("quizMapper.selectQuizAnswered", quiz_a);
	}
	
	public ArrayList<Student> selectQuizAnswerList(Quiz_q quiz_q) {
		List<Student> list = sqlSessionTemplate.selectList("quizMapper.selectQuizAnswerList", quiz_q);
		return (ArrayList<Student>)list;
	}
	//ins
	public int insertQuiz(Quiz_q quiz_q) {
		return sqlSessionTemplate.insert("quizMapper.insertQuiz", quiz_q);
	}

	public int insertQuizAnswer(Quiz_a quiz_a) {
		return sqlSessionTemplate.insert("quizMapper.insertQuizAnswer", quiz_a);
	}
}
