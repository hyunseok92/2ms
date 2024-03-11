package org.ict.lms.teacher.model.service;

import java.util.ArrayList;
import java.util.Map;

import org.ict.lms.common.Paging;
import org.ict.lms.common.Search;
import org.ict.lms.teacher.model.dao.TeacherDao;
import org.ict.lms.teacher.model.vo.Teacher;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("teacherService")
public class TeacherServiceImpl implements TeacherService{

	@Autowired
	private TeacherDao teacherDao;
	
	@Override
	public Teacher selectLogin(Teacher teacher) {
		return teacherDao.selectLogin(teacher);
	}
	
	@Override
	public Teacher selectTeacher(Teacher teacher) {
		return teacherDao.selectTeacher(teacher);
	}
	
	@Override
	public Teacher selectTeacher2(String Id) {
		return teacherDao.selectTeacher2(Id);
	}
	
	@Override
	public int selectCountTeacher(String Id) {
		return teacherDao.selectCountTeacher(Id);
	}
	
	@Override
	public ArrayList<Teacher> selectTeacherList() {
		return teacherDao.selectTeacherList();
	}
	
	@Override
	public int insertTeacher(Teacher teacher) {
		return teacherDao.insertTeacher(teacher);
	}
	
	@Override
	public int updateTeacher(Teacher teacher) {
		return teacherDao.updateTeacher(teacher);
	}
	
	@Override
	public int updateTeacher2(Teacher teacher) {
		return teacherDao.updateTeacher2(teacher);
	}
	
	@Override
	public int updateTeacherClassCode(Map<String, String> params) {
		return teacherDao.updateTeacherClassCode(params);
	}
	
	
	@Override
	public int deleteTeacher(String Id) {
		return teacherDao.deleteTeacher(Id);
	}

	@Override
	public String searchTeacher(String key) {
		return teacherDao.searchTeacher(key);
	}

	@Override
	public Teacher searchTeacher(Teacher teacher) {
		
		return teacherDao.searchTeacher(teacher);
	}

	@Override
	public ArrayList<Teacher> selectTeacherList(Paging paging) {
		return teacherDao.selectTeacherList(paging);
	}

	@Override
	public int selectCountAllTeacher() {
		return teacherDao.selectCountAllteacher();
	}

	@Override
	public int searchTeacherListCount(Search search) {
		return teacherDao.searchTeacherListCount(search);
	}

	@Override
	public ArrayList<Teacher> searchTeacherList(Search search) {
		return teacherDao.searchTeacherList(search);
	}

	@Override
	public int updateTeacherStatus(Teacher teacher) {
		return teacherDao.updateTeacherStatus(teacher);
	}
	
	
}
