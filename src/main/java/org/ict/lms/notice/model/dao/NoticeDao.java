package org.ict.lms.notice.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.ict.lms.common.Paging;
import org.ict.lms.notice.model.vo.Notice;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("noticeDao")
public class NoticeDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public ArrayList<Notice> selecNoticeList(Paging paging){
		List<Notice> list = sqlSessionTemplate.selectList("noticeMapper.selectNoticeList", paging);
		return (ArrayList<Notice>)list;
	}
	
	public Notice selectNoticeDetail(int notice_no) {
		return sqlSessionTemplate.selectOne("noticeMapper.selectNoticeDetail", notice_no);
	}
	
	public int insertNotice(Notice notice) {
		return sqlSessionTemplate.insert("noticeMapper.insertNotice", notice);
	}
	
	public int updateNotice(Notice notice) {
		return sqlSessionTemplate.update("noticeMapper.updateNotice", notice);
	}
	
	public int deleteNotice(Notice notice) {
		return sqlSessionTemplate.delete("noticeMapper.deleteNotice", notice);
	}

	public int selectListCount() {
		return sqlSessionTemplate.selectOne("noticeMapper.selectListCount");
	}
	
	public int updateReadCount(int notice_no) {
		return sqlSessionTemplate.update("noticeMapper.updateReadCount", notice_no);
	}
	
	public ArrayList<Notice> selectNew5Notice(){
		List<Notice> list = sqlSessionTemplate.selectList("noticeMapper.selectNew5Notice");
		return (ArrayList<Notice>)list;
	}
}
