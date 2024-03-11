package org.ict.lms.att.model.service;

import java.util.ArrayList;

import org.ict.lms.att.model.vo.Attendence;
import org.springframework.stereotype.Service;

public interface AttendenceService {

	public ArrayList<Attendence> selectAttendenceList(String classcode);
		
	public ArrayList<Attendence> searchDateAttList(Attendence att);
	
	public ArrayList<Attendence> searchMonthAttList(Attendence att);
	
	public ArrayList<Attendence> searchMonthStartEnd(Attendence att);
	
	public Attendence selectAttendence();

	public int updateAllstatus(Attendence att);
	
	public int updateAttRow(Attendence att);
}
