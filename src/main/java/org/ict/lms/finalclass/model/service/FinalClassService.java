package org.ict.lms.finalclass.model.service;

import java.util.ArrayList;

import org.ict.lms.course.model.vo.Course;
import org.ict.lms.finalclass.model.vo.FinalClass;

public interface FinalClassService {
	public ArrayList<FinalClass> selectFinalClassList();
	
	public FinalClass selectFinalClassDetail(String classCode);
	
	public int insertFinalClass(Course course);
}
