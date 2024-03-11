package org.ict.lms.finalclass.model.service;

import java.util.ArrayList;

import org.ict.lms.course.model.vo.Course;
import org.ict.lms.finalclass.model.dao.FinalClassDao;
import org.ict.lms.finalclass.model.vo.FinalClass;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("finalClassService")
public class FinalClassServiceImpl implements FinalClassService {

	@Autowired
	private FinalClassDao finalClassDao;
	
	public FinalClassServiceImpl() {}
	
	@Override
	public ArrayList<FinalClass> selectFinalClassList(){
		return finalClassDao.selectFinalClassList();
	}
	
	@Override
	public FinalClass selectFinalClassDetail(String classCode) {
		return finalClassDao.selectFinalClassDetail(classCode);
	}
	
	@Override
	public int insertFinalClass(Course course) {
		return finalClassDao.insertFinalClass(course);
	}
}
