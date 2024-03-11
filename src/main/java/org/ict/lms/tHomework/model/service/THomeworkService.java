package org.ict.lms.tHomework.model.service;

import java.util.ArrayList;

import org.ict.lms.common.Search;
import org.ict.lms.homework.model.vo.Homework;
import org.ict.lms.tHomework.model.vo.THomework;

public interface THomeworkService {

	public int insertTHomework(THomework tH);

	public int selectTHomeworkViewCount(String classCode);

	public ArrayList<THomework> selectTHomeworkPagingView(Search search);

	public THomework selectTHWMethod(String HWCode);

	public int updateTHomework(THomework tH);

	public int deleteTHW(String HWCode);


	

	

}
