package org.ict.lms.designedsubject.model.service;

import java.util.ArrayList;
import java.util.Map;

import org.ict.lms.designedsubject.model.dao.DesignedSubjectDao;
import org.ict.lms.designedsubject.model.vo.DesignedSubject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("designedSubjectService")
public class DesignedSubjectServiceImpl implements DesignedSubjectService {

	@Autowired
	private DesignedSubjectDao designedSubjectDao;
	
	public DesignedSubjectServiceImpl() {}
	
	@Override
	public int insertDesignedSubject(DesignedSubject ds) {
		return designedSubjectDao.insertDesignedSubject(ds);
	}
	
	@Override
	public ArrayList<DesignedSubject> selectDesignedSubject(String classCode) {
		return designedSubjectDao.selectDesignedSubject(classCode);
	}
	
	@Override
	public DesignedSubject selectOneDS(Map<String, String> params) {
		return designedSubjectDao.selectOneDS(params);
	}
	
	@Override
	public int updateDSIndex(DesignedSubject ds) {
		return designedSubjectDao.updateDSIndex(ds);
	}
}
