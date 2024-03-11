package org.ict.lms.course.model.service;

import java.util.ArrayList;
import java.util.Map;

import org.ict.lms.common.Paging;
import org.ict.lms.course.model.dao.CourseDao;
import org.ict.lms.course.model.vo.Course;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("courseService")
public class CourseServiceImpl implements CourseService {

	@Autowired
	private CourseDao courseDao;
	
	public CourseServiceImpl() {}
	
	@Override
	public ArrayList<Course> selectCourseList(Paging paging) {
		return courseDao.selectCourseList(paging);
	}
	
	@Override
	public int selectCourseListCount() {
		return courseDao.selectCourseListCount();
	}
	
	@Override
	public ArrayList<Course> selectOwnCourseList(Paging paging) {
		return courseDao.selectOwnCourseList(paging);
	}
	
	@Override
	public int selectOwnCourseListCount() {
		return courseDao.selectOwnCourseListCount();
	}
	
	@Override
	public Course selectCourseDetail(Map<String, String> params) {
		return courseDao.selectCourseDetail(params);
	}
	
	@Override
	public Course selectSCourseDetail(String classCode) {
		return courseDao.selectSCourseDetail(classCode);
	}
	
	@Override
	public int insertCourse(Course course) {
		return courseDao.insertCourse(course);
	}
	
	@Override
	public int updateCourseMethod(Map<String, String> params) {
		return courseDao.updateCourseMethod(params);
	}
	
	@Override
	public int updateExecuteDateMethod(Course course) {
		return courseDao.updateExecuteDateMethod(course);
	}
	
	@Override
	public String selectCourseCode(String className) {
		return courseDao.selectCourseCode(className);
	}

	@Override
	public String searchCourseName(String classCode) {
		return courseDao.searchCourseName(classCode);
	}

	@Override
	public ArrayList<Course> selectCouresName() {
		return courseDao.selectCouresName();
	}
}
