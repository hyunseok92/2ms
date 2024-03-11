package org.ict.lms.tHomework.model.service;

import java.util.ArrayList;

import org.ict.lms.common.Search;
import org.ict.lms.tHomework.model.dao.THomeworkDao;
import org.ict.lms.tHomework.model.vo.THomework;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("ths")
public class THomeworkServiceImpl implements THomeworkService{
	
	@Autowired
	private THomeworkDao thd;

	@Override
	public int insertTHomework(THomework tH) {
		return thd.insertTHomework(tH);
	}

	@Override
	public int selectTHomeworkViewCount(String classCode) {
		return thd.selectTHomeworkViewCount(classCode);
	}

	@Override
	public ArrayList<THomework> selectTHomeworkPagingView(Search search) {
		return thd.selectTHomeworkPagingView(search);
	}

	@Override
	public THomework selectTHWMethod(String HWCode) {
		return thd.selectTHWMethod(HWCode);
	}

	@Override
	public int updateTHomework(THomework tH) {
		return thd.updateTHomework(tH);
	}

	@Override
	public int deleteTHW(String HWCode) {
		return thd.deleteTHW(HWCode);
	}
	
	
	
}
