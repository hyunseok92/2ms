package org.ict.lms.subject.model.service;

import java.util.ArrayList;

import org.ict.lms.subject.model.vo.Subject;

public interface SubjectService {
	public ArrayList<Subject> selectSubjectList();
	public ArrayList<Subject> selectFirstCateList();
	public ArrayList<Subject> selectSecondCateList(String keyword);
	public ArrayList<Subject> selectThirdCateList(String keyword);
	public ArrayList<Subject> selectFourthCateList(String keyword);
	public ArrayList<Subject> selectSubjCateList(String keyword);
}
