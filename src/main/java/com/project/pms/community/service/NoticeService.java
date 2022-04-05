package com.project.pms.community.service;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

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
	@Value("${upload}")
	private String uploadPath;
	
	public int insertNotice(Notice notice) {
		dao.insertNotice(notice);
		
		if (notice.getReport() != null && notice.getReport().length > 0) {
			
			try {		
				for (MultipartFile mf : notice.getReport()) {
					
					String fname = mf.getOriginalFilename();
					String ext = FilenameUtils.getExtension(fname).toLowerCase();
					String saveName = UUID.randomUUID() + "." + ext;
					long volume = mf.getSize();
					
					if(fname != null && !fname.equals("")) {
						System.out.println("경로명: " + uploadPath);
						System.out.println("첨부파일명: " + fname);
						
						File file = new File(uploadPath + fname);
						mf.transferTo(file);
						
						NoticeFile noticeFile = new NoticeFile(fname, saveName, ext, volume);
						dao.insertNoticeFileInfo(noticeFile);			
					}
				}	
			} catch (IllegalStateException e) { 
				System.out.println(e.getMessage());
				
			} catch (IOException e) {
				System.out.println("파일 전송 오류: " + e.getMessage());
				
			} catch(Exception e) {
				System.out.println("기타 예외: " + e.getMessage());
			}
		}
		
		return notice.getNoticeId();	
		
	}
	
	// 공지사항 조회
	public Notice getNoticeDetail(int noticeId) {
		dao.updateViewCount(noticeId);
		
		return dao.getNoticeDetail(noticeId);
	}
	
	public NoticeFile getNoticeFileInfo(int noticeId) {	
		return dao.getNoticeFileInfo(noticeId);
	}
	
	public NoticeFile getFileInfoByFileId(int noticeFileId) {	
		return dao.getFileInfoByFileId(noticeFileId);
	}
	
	// 공지사항 수정
	public int updateNotice(Notice notice) {
		dao.updateNotice(notice);
		
		return notice.getNoticeId();
	}
	
	// 공지사항 삭제
	public boolean deleteNotice(int noticeId) {
		dao.deleteNoticeFileInfo(noticeId);
		dao.deleteNotice(noticeId);
		
		return true;
	}
		
}
