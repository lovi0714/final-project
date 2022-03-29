package com.project.pms.community.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.pms.community.repository.NoticeDAO;
import com.project.pms.community.vo.Notice;
import com.project.pms.community.vo.NoticeFile;

@Service
public class NoticeService {

	@Autowired
	private NoticeDAO dao;
	
	// 공지사항 목록
	public List<Notice> getNoticeBoardList() {
		
		return dao.getNoticeBoardList();
	}
	
	// 공지사항 등록
	public void insertNotice(Notice notice) {
		
		dao.insertNotice(notice);
	}
	
	public void insertNoticeFileInfo(NoticeFile noticeFile) {
		
		dao.insertNoticeFileInfo(noticeFile);
	}
	
	// 공지사항 조회
	public Notice getNoticeDetail(int noticeId) {
		
		return dao.getNoticeDetail(noticeId);
	}
	
	public Notice getNoticeFileInfo(int noticeId) {
		
		return dao.getNoticeFileInfo(noticeId);
	}
	
	// 공지사항 수정
	public void updateNotice(int noticeId) {
		
		dao.updateNotice(noticeId);
	}
	
	// 공지사항 삭제
	public void deleteNoitce(int noticeId) {
		
		dao.deleteNoitce(noticeId);
	}

	public void deleteNoitceFileInfo(int noticeId) {
		
		dao.deleteNoitceFileInfo(noticeId);
	}
	
	// 조회수 증가
	public void updateViewCount(int noticeId) {
		
		dao.updateViewCount(noticeId);
	}
	
}
