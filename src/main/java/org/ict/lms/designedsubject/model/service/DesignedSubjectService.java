package org.ict.lms.designedsubject.model.service;

import java.util.ArrayList;
import java.util.Map;

import org.ict.lms.designedsubject.model.vo.DesignedSubject;

public interface DesignedSubjectService {
	
	public int insertDesignedSubject(DesignedSubject ds);
	
	public ArrayList<DesignedSubject> selectDesignedSubject(String classCode);

	public DesignedSubject selectOneDS(Map<String, String> params);

	public int updateDSIndex(DesignedSubject ds);
}
