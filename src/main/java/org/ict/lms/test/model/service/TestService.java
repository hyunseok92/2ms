package org.ict.lms.test.model.service;

import java.util.ArrayList;


import org.ict.lms.test.model.vo.Test;

public interface TestService {

	public int insertProbMehod(Test test);

	public Test selectLastProb(String testCode);

	public ArrayList<Test> selectMprodbMethod(String testCode);

	public int deleteMprop(Test test);

	public int updateMprop(Test test);

	public int updateDTestNo(Test test2);

	public int deleteProps(String testCode);


}
