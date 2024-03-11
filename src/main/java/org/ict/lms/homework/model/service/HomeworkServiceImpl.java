package org.ict.lms.homework.model.service;

import java.util.ArrayList;

import org.ict.lms.homework.model.dao.HomeworkDao;
import org.ict.lms.homework.model.vo.Homework;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("homeworkService")
public class HomeworkServiceImpl implements HomeworkService{
	
	@Autowired
	private HomeworkDao homeworkDao;
	
	public HomeworkServiceImpl() {}
	@Override
	public ArrayList<Homework> selectHomeworkList(String hwcode) {
		return homeworkDao.selectHomeworkList(hwcode);
	}
	@Override
	public ArrayList<Homework> selectHomework(String studentCode) {
		// TODO Auto-generated method stub
		return homeworkDao.selectHomework(studentCode);
	}
	@Override
	public int insertHWChek(Homework hw) {
		// TODO Auto-generated method stub
		return homeworkDao.insertHWCheck(hw);
	}

	@Override
	public int insertSsHomework(Homework hw) {
		// TODO Auto-generated method stub
		return homeworkDao.insertSsHomework(hw);
	}

	@Override
	public int updateSsHomework(Homework hw) {
		// TODO Auto-generated method stub
		return homeworkDao.updateSsHomework(hw);
	}

	@Override
	public int updateTtHomework(Homework hw) {
		// TODO Auto-generated method stub
		return homeworkDao.udpateTtHomework(hw);
	}

	@Override
	public int deleteSsHomework(String student) {
		// TODO Auto-generated method stub
		return homeworkDao.delteSsHomework(student);
	}
	@Override
	public int insertHomework(Homework hw) {
		return homeworkDao.insertHomework(hw);
	}
	@Override
	public Homework selectSHWMethod(Homework hw) {
		return homeworkDao.selectSHWMethod(hw);
	}
	@Override
	public int updateSHomework(Homework hw) {
		return homeworkDao.updateSHomework(hw);
	}
	@Override
	public int deleteSHW(Homework hw) {
		return homeworkDao.deleteSHW(hw);
	}
	@Override
	public int updatehwresultMethod(Homework hw) {
		return homeworkDao.updatehwresultMethod(hw);
	}

}
