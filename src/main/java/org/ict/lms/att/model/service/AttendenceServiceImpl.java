package org.ict.lms.att.model.service;

import java.util.ArrayList;

import org.ict.lms.att.model.dao.AttendenceDao;
import org.ict.lms.att.model.vo.Attendence;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("attendenceService")
public class AttendenceServiceImpl implements AttendenceService {

	@Autowired private AttendenceDao attendenceDao;

	@Override
	public ArrayList<Attendence> selectAttendenceList(String classcode) {
		return attendenceDao.selectAttendenceList(classcode);
	}
	
	@Override
	public Attendence selectAttendence() {
		return attendenceDao.selectAttendence();
	}
	
	@Override
	public ArrayList<Attendence> searchDateAttList(Attendence att) {
		return attendenceDao.searchDateAttList(att);
	}
	
	@Override
	public ArrayList<Attendence> searchMonthAttList(Attendence  att) {
		return attendenceDao.searchMonthAttList(att);
	}
	
	@Override
	public ArrayList<Attendence> searchMonthStartEnd(Attendence att) {
		return attendenceDao.searchMonthStartEnd(att);
	}

	@Override
	public int updateAllstatus(Attendence att) {
		return attendenceDao.updateAttendence(att);
	}

	@Override
	public int updateAttRow(Attendence att) {
		return attendenceDao.updateAttRow(att);
	}
}
