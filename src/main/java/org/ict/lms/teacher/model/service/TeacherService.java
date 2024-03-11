package org.ict.lms.teacher.model.service;

import java.util.ArrayList;
import java.util.Map;

import org.ict.lms.common.Paging;
import org.ict.lms.common.Search;
import org.ict.lms.teacher.model.vo.Teacher;

public interface TeacherService {
	
	public Teacher selectLogin(Teacher teacher);
	
	public Teacher selectTeacher(Teacher teacher);
	
	public Teacher selectTeacher2(String Id);
	
	public String searchTeacher(String key);
	
	public int selectCountTeacher(String Id);
	
	public int selectCountAllTeacher();
	
	public ArrayList<Teacher> selectTeacherList();
	
	public ArrayList<Teacher> selectTeacherList(Paging paging);
	
	public int searchTeacherListCount(Search search);
	
	public ArrayList<Teacher> searchTeacherList(Search search);
 
	public int insertTeacher(Teacher teacher);
	
	public int updateTeacher(Teacher teacher);
	
	public int updateTeacher2(Teacher teacher);
	
	public int updateTeacherStatus(Teacher teacher);

	public Teacher searchTeacher(Teacher teacher);
	
	public int deleteTeacher(String Id);
	
	public int updateTeacherClassCode(Map<String, String> params);
}
