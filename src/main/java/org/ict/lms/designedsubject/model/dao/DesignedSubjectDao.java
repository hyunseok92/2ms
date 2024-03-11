package org.ict.lms.designedsubject.model.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.ict.lms.designedsubject.model.vo.DesignedSubject;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("designedSubjectDao")
public class DesignedSubjectDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public int insertDesignedSubject(DesignedSubject ds) {
		return sqlSessionTemplate.insert(
				"designedSubjectMapper.insertDesignedSubject", ds);
	}
	
	public ArrayList<DesignedSubject> selectDesignedSubject(String classCode) {
		List<DesignedSubject> ds = sqlSessionTemplate.selectList("designedSubjectMapper.selectDesignedSubject", classCode);
		return (ArrayList<DesignedSubject>)ds;
	}

	public DesignedSubject selectOneDS(Map<String, String> params) {
		return sqlSessionTemplate.selectOne("designedSubjectMapper.selectOneDS", params);
	}
	
	public int updateDSIndex(DesignedSubject ds) {
		return sqlSessionTemplate.update("designedSubjectMapper.updateDSIndex", ds);
	}
}
