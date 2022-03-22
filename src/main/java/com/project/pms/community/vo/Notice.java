package com.project.pms.community.vo;

import java.time.LocalDateTime;

public class Notice {
	private int noticeId;
	private String writer;
	private String title;
	private String content;
	private int view_count;
	private LocalDateTime createAt;
	private LocalDateTime updateAt;
	
	public Notice() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Notice(int noticeId, String writer, String title, String content, int view_count, LocalDateTime createAt,
			LocalDateTime updateAt) {
		super();
		this.noticeId = noticeId;
		this.writer = writer;
		this.title = title;
		this.content = content;
		this.view_count = view_count;
		this.createAt = createAt;
		this.updateAt = updateAt;
	}

	public int getNoticeId() {
		return noticeId;
	}

	public void setNoticeId(int noticeId) {
		this.noticeId = noticeId;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getView_count() {
		return view_count;
	}

	public void setView_count(int view_count) {
		this.view_count = view_count;
	}

	public LocalDateTime getCreateAt() {
		return createAt;
	}

	public void setCreateAt(LocalDateTime createAt) {
		this.createAt = createAt;
	}

	public LocalDateTime getUpdateAt() {
		return updateAt;
	}

	public void setUpdateAt(LocalDateTime updateAt) {
		this.updateAt = updateAt;
	}
	
	
}
