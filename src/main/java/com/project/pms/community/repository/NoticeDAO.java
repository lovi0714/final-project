package com.project.pms.community.repository;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.project.pms.community.vo.Notice;
import com.project.pms.community.vo.NoticeFile;

@Repository
public interface NoticeDAO {
	
	// 공지사항 목록
	public List<Notice> getNoticeBoardList();
	
	// 공지사항 등록
	public void insertNotice(Notice notice);
	
	public void insertNoticeFileInfo(NoticeFile noticeFile);
	
	// 공지사항 조회
	public Notice getNoticeDetail(int noticeId);
	
	public NoticeFile getNoticeFileInfo(int noticeId);
	
	public NoticeFile getFileInfoByFileId(int noticeFileId);
	
	// 공지사항 수정
	public void updateNotice(Notice notice);
	
	// 공지사항 삭제
	public void deleteNotice(int noticeId);

	public void deleteNoticeFileInfo(int noticeId);
	
	// 조회수 증가
	public void updateViewCount(int noticeId);
}
