package org.ict.lms.notice.model.service;

import java.util.ArrayList;

import org.ict.lms.common.Paging;
import org.ict.lms.notice.model.vo.Notice;

public interface NoticeService {

	public ArrayList<Notice> selectList(Paging paging);
	
	public int insertNotice(Notice notice);

	public Notice selectNoticeDetail(int notice_no);
	
	public int updateNotice(Notice notice);
	
	public int deleteNotice(Notice notice);
	
	public int selectListCount();

	public void updateReadCount(int notice_no);

	public ArrayList<Notice> selectNew5Notice();

}
