package org.ict.lms.subject.model.service;

import java.util.ArrayList;

import org.ict.lms.subject.model.dao.SubjectDao;
import org.ict.lms.subject.model.vo.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("subjectService")
public class SubjectServiceImpl implements SubjectService {
	@Autowired
	private SubjectDao subjectDao;
	
	public SubjectServiceImpl() {}
	
	@Override
	public ArrayList<Subject> selectSubjectList() {
		return subjectDao.selectSubjectList();
	}
	
	@Override
	public ArrayList<Subject> selectFirstCateList() {
		return subjectDao.selectFirstCateList();
	}
	
	@Override
	public ArrayList<Subject> selectSecondCateList(String keyword) {
		return subjectDao.selectSecondCateList(keyword);
	}
	
	@Override
	public ArrayList<Subject> selectThirdCateList(String keyword) {
		return subjectDao.selectThirdCateList(keyword);
	}
	
	@Override
	public ArrayList<Subject> selectFourthCateList(String keyword) {
		return subjectDao.selectFourthCateList(keyword);
	}
	
	@Override
	public ArrayList<Subject> selectSubjCateList(String keyword) {
		return subjectDao.selectSubjCateList(keyword);
	}
	
}
