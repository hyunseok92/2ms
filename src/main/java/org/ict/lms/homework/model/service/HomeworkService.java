package org.ict.lms.homework.model.service;

import java.util.ArrayList;

import org.ict.lms.homework.model.vo.Homework;

public interface HomeworkService {

	public ArrayList<Homework> selectHomeworkList(String hwcode);

	public ArrayList<Homework> selectHomework(String studentCode);

	public int insertHWChek(Homework hw);

	public int insertSsHomework(Homework hw);

	public int updateSsHomework(Homework hw);

	public int updateTtHomework(Homework hw);

	public int deleteSsHomework(String student);

	public int insertHomework(Homework hw);

	public Homework selectSHWMethod(Homework hw);

	public int updateSHomework(Homework hw);

	public int deleteSHW(Homework hw);

	public int updatehwresultMethod(Homework hw);

}
