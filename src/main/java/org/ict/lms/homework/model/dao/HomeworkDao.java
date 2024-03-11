package org.ict.lms.homework.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.ict.lms.homework.model.vo.Homework;
import org.ict.lms.sTest.model.vo.STest;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("homeworkDao")
public class HomeworkDao {
	@Autowired //root-context.xml 에서 생성한 객체를 자동 연결함
	private SqlSessionTemplate sqlSessionTemplate;

	public ArrayList<Homework> selectHomeworkList(String hwcode) {
		List<Homework> list = sqlSessionTemplate.selectList("homeworkMapper.selectHomeworkList", hwcode);
		return (ArrayList<Homework>)list;
	}

	public ArrayList<Homework> selectHomework(String studentCode) {
		List<Homework> list = sqlSessionTemplate.selectList("homeworkMapper.selectHomework", studentCode);
		return (ArrayList<Homework>)list;
	}

	public int insertHWCheck(Homework hw) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int insertSsHomework(Homework hw) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int updateSsHomework(Homework hw) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int udpateTtHomework(Homework hw) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int delteSsHomework(String student) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int insertHomework(Homework hw) {
		return sqlSessionTemplate.insert("homeworkMapper.insertHomework", hw);
	}

	public Homework selectSHWMethod(Homework hw) {
		return sqlSessionTemplate.selectOne("homeworkMapper.selectSHWMethod", hw);
	}

	public int updateSHomework(Homework hw) {
		return sqlSessionTemplate.update("homeworkMapper.updateSHomework", hw);
	}

	public int deleteSHW(Homework hw) {
		return sqlSessionTemplate.update("homeworkMapper.deleteSHW", hw);
	}

	public int updatehwresultMethod(Homework hw) {
		return sqlSessionTemplate.update("homeworkMapper.updatehwresultMethod", hw);
	}
}
