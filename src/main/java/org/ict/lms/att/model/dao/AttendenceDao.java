package org.ict.lms.att.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.ict.lms.att.model.vo.Attendence;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("attendenceDao")
public class AttendenceDao {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public ArrayList<Attendence> selectAttendenceList(String classcode) {
		List<Attendence> list = sqlSessionTemplate.selectList("attMapper.selectAttendenceList", classcode);
		return (ArrayList<Attendence>)list;
	}
		
	public Attendence selectAttendence() {
		return sqlSessionTemplate.selectOne("attMapper.selectAttendence");
	}

	public ArrayList<Attendence> searchDateAttList(Attendence att) {
		// TODO Auto-generated method stub
		List<Attendence> list = sqlSessionTemplate.selectList("attMapper.searchDateAttendenceList", att);
		return (ArrayList<Attendence>)list;
	}
	
	public ArrayList<Attendence> searchMonthAttList(Attendence att) {
		List<Attendence> list = sqlSessionTemplate.selectList("attMapper.searchMonthAttList", att);
		return (ArrayList<Attendence>)list;
	}
	
	public int updateAttendence(Attendence att) {
		return sqlSessionTemplate.update("attMapper.updateAttAllStatus", att);
	}

	public int updateAttRow(Attendence att) {
		return sqlSessionTemplate.update("attMapper.updateAttRow", att);
	}

	public ArrayList<Attendence> searchMonthStartEnd(Attendence att) {
		List<Attendence> list = sqlSessionTemplate.selectList("attMapper.serachMonthStartEnd", att);
		return (ArrayList<Attendence>)list;
	}	
}
