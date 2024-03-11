package org.ict.lms.course.model.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.ict.lms.common.Paging;
import org.ict.lms.course.model.vo.Course;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("courseDao")
public class CourseDao {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public ArrayList<Course> selectCourseList(Paging paging){
		List<Course> list = sqlSessionTemplate.selectList("courseMapper.selectCourseList", paging);
		return (ArrayList<Course>)list;
	}
	
	public int selectCourseListCount() {
		return sqlSessionTemplate.selectOne("courseMapper.selectCourseListCount");
	}
	
	public ArrayList<Course> selectOwnCourseList(Paging paging){
		List<Course> list = sqlSessionTemplate.selectList("courseMapper.selectOwnCourseList", paging);
		return (ArrayList<Course>)list;
	}
	
	public int selectOwnCourseListCount() {
		return sqlSessionTemplate.selectOne("courseMapper.selectOwnCourseListCount");
	}
	
	public Course selectCourseDetail(Map<String, String> params) {
		return sqlSessionTemplate.selectOne("courseMapper.selectCourseDetail", params);
	}
	
	public Course selectSCourseDetail(String classCode) {
		return sqlSessionTemplate.selectOne("courseMapper.selectSCourseDetail", classCode);
	}
	
	public int updateCourseMethod(Map<String, String> params) {
		return sqlSessionTemplate.update("courseMapper.updateCourseMethod", params);
	}
	
	public int updateExecuteDateMethod(Course course) {
		return sqlSessionTemplate.update("courseMapper.updateExecuteDateMethod", course);
	}
	
	public int insertCourse(Course course) {
		return sqlSessionTemplate.insert("courseMapper.insertCourse", course);
	}
	
	public String selectCourseCode(String className) {
		return sqlSessionTemplate.selectOne("courseMapper.selectCourseCode", className);
	}

	public String searchCourseName(String classCode) {
		return sqlSessionTemplate.selectOne("courseMapper.searchCoursename", classCode);
	}

	public ArrayList<Course> selectCouresName() {
		List<Course> list = sqlSessionTemplate.selectList("courseMapper.selectSurvCouresName");
		return (ArrayList<Course>)list;
	}
}
