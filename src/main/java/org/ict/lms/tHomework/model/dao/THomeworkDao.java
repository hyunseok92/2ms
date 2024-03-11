package org.ict.lms.tHomework.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.ict.lms.common.Search;
import org.ict.lms.tHomework.model.vo.THomework;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("thd")
public class THomeworkDao {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public ArrayList<THomework> selectHomeworkList(THomework thomework) {
		// TODO Auto-generated method stub
		return null;
	}

	public int insertTHomework(THomework thomework) {
		return sqlSessionTemplate.insert("thomeworkMapper.insertTHomework", thomework);
	}

	public int updateTHomework(THomework thomework) {
		return sqlSessionTemplate.update("thomeworkMapper.updateTHomework", thomework);
	}

	public int deleteTHomework(THomework thomework) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int selectTHomeworkViewCount(String classCode) {
		return sqlSessionTemplate.selectOne("thomeworkMapper.selectTHomeworkViewCount", classCode);
	}

	public ArrayList<THomework> selectTHomeworkPagingView(Search search) {
		List<THomework> list = sqlSessionTemplate.selectList("thomeworkMapper.selectTHomeworkPagingView", search);
		return (ArrayList<THomework>)list;
	}

	public THomework selectTHWMethod(String hWCode) {
		return sqlSessionTemplate.selectOne("thomeworkMapper.selectTHWMethod", hWCode);
	}

	public int deleteTHW(String hWCode) {
		return sqlSessionTemplate.delete("thomeworkMapper.deleteTHW", hWCode);
	}
}
