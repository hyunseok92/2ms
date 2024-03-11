package org.ict.lms.teacher.model.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.ict.lms.common.Paging;
import org.ict.lms.common.Search;
import org.ict.lms.survey.model.vo.Survey;
import org.ict.lms.teacher.model.vo.Teacher;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("teacherDao")
public class TeacherDao {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public ArrayList<Teacher> selectTeacherList() {
		List<Teacher> list = sqlSessionTemplate.selectList("teacherMapper.selectTeacherList");
		return (ArrayList<Teacher>)list;
	}
	
	public Teacher selectLogin(Teacher teacher) {
		return sqlSessionTemplate.selectOne("teacherMapper.selectLogin", teacher);
	}
	
	
	public Teacher selectTeacher(Teacher teacher) {
		return sqlSessionTemplate.selectOne("teacherMapper.selectTeacher", teacher);
	}
	
	public Teacher searchTeacher(Teacher teacher) {
		return sqlSessionTemplate.selectOne("teacherMapper.searchTeacher", teacher);
	}
	
	public Teacher selectTeacher2(String Id) {
		return sqlSessionTemplate.selectOne("teacherMapper.selectTeacher2", Id);
	}
	
	public int selectCountTeacher(String Id) {
		return sqlSessionTemplate.selectOne("teacherMapper.selectCountTeacher", Id);
	}
	
	public String searchTeacher(String key) {
		return sqlSessionTemplate.selectOne("teacherMapper.searchTeacherCode", key);
	}
	
	public int insertTeacher(Teacher teacher) {
		return sqlSessionTemplate.insert("teacherMapper.insertTeacher", teacher);
	}
	
	public int updateTeacher(Teacher teacher) {
		return sqlSessionTemplate.update("teacherMapper.updateTeacher", teacher);
	}
	

	public int updateTeacher2(Teacher teacher) {
		return sqlSessionTemplate.update("teacherMapper.updateTeacher2", teacher);
	}
	
	public int updateTeacherClassCode(Map<String, String> params) {
		return sqlSessionTemplate.update("teacherMapper.updateTeacherClassCode", params);
	}


	
	public int deleteTeacher(String Id) {
		return sqlSessionTemplate.delete("teacherMapper.deleteTeacher", Id);
	}

	public ArrayList<Teacher> selectTeacherList(Paging paging) {
		List<Teacher> list = sqlSessionTemplate.selectList("teacherMapper.selectPageTeacherList", paging);
		return (ArrayList<Teacher>)list;
	}

	public int selectCountAllteacher() {
		return sqlSessionTemplate.selectOne("teacherMapper.selectCountAllteacher");
	}

	public int searchTeacherListCount(Search search) {
		return sqlSessionTemplate.selectOne("teacherMapper.searchTeacherListCount", search);
	}

	public ArrayList<Teacher> searchTeacherList(Search search) {
		List<Teacher> list = sqlSessionTemplate.selectList("teacherMapper.searchTeacherList", search);
		return (ArrayList<Teacher>)list;
	}

	public int updateTeacherStatus(Teacher teacher) {
		return sqlSessionTemplate.update("teacherMapper.updateTeacherStatus", teacher);
	}

}
