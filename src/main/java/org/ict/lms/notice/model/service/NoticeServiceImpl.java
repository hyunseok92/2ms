package org.ict.lms.notice.model.service;

import java.util.ArrayList;

import org.ict.lms.common.Paging;
import org.ict.lms.notice.model.dao.NoticeDao;
import org.ict.lms.notice.model.vo.Notice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("noticeService")
public class NoticeServiceImpl implements NoticeService {

	@Autowired // 자동 DI 처리됨 : 자동 객체 생성됨
	private NoticeDao noticeDao;

	@Override
	public ArrayList<Notice> selectList(Paging paging) {
		return noticeDao.selecNoticeList(paging);
	}

	@Override
	public int insertNotice(Notice notice) {
		return noticeDao.insertNotice(notice);
	}
	
	@Override
	public Notice selectNoticeDetail(int notice_no) {
		return noticeDao.selectNoticeDetail(notice_no);
	}

	@Override
	public int updateNotice(Notice notice) {
		return noticeDao.updateNotice(notice);
	}

	@Override
	public int deleteNotice(Notice notice) {
		return noticeDao.deleteNotice(notice);
	}
	
	@Override
	public int selectListCount() {
		return noticeDao.selectListCount();
	}
	
	@Override
	public void updateReadCount(int notice_no) {
		noticeDao.updateReadCount(notice_no);
	}
	
	@Override
	public ArrayList<Notice> selectNew5Notice(){
		return noticeDao.selectNew5Notice();
	}
}
