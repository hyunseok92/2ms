package org.ict.lms.course.model.service;

import java.util.ArrayList;
import java.util.Map;

import org.ict.lms.common.Paging;
import org.ict.lms.course.model.vo.Course;

public interface CourseService {
	
	public ArrayList<Course> selectCourseList(Paging paging);

	public ArrayList<Course> selectOwnCourseList(Paging paging);
	
	public ArrayList<Course> selectCouresName();

	public int selectCourseListCount();

	public int selectOwnCourseListCount();
	
	public Course selectCourseDetail(Map<String, String> params);
	
	public Course selectSCourseDetail(String classCode);
	
	public int insertCourse(Course course);

	public int updateCourseMethod(Map<String, String> params);

	public int updateExecuteDateMethod(Course course);

	public String selectCourseCode(String className);
	
	public String searchCourseName(String classCode);
}
