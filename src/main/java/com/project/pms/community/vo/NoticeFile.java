package com.project.pms.community.vo;

import java.util.Date;

public class NoticeFile {
	private int noticeFileId;
	private int noticeId;
	private String originalName;
	private String saveName;
	private String ext;
	private long volume;
	private Date createAt;
	private Date updateAt;
	
	public NoticeFile() {
		super();
		// TODO Auto-generated constructor stub
	}

	public NoticeFile(String originalName, String saveName, String ext, long volume) {
		super();
		this.originalName = originalName;
		this.saveName = saveName;
		this.ext = ext;
		this.volume = volume;
	}
	
	public NoticeFile(int noticeFileId, int noticeId, String originalName, String saveName, String ext, long volume,
			Date createAt, Date updateAt) {
		super();
		this.noticeFileId = noticeFileId;
		this.noticeId = noticeId;
		this.originalName = originalName;
		this.saveName = saveName;
		this.ext = ext;
		this.volume = volume;
		this.createAt = createAt;
		this.updateAt = updateAt;
	}

	public int getNoticeFileId() {
		return noticeFileId;
	}

	public void setNoticeFileId(int noticeFileId) {
		this.noticeFileId = noticeFileId;
	}

	public int getNoticeId() {
		return noticeId;
	}

	public void setNoticeId(int noticeId) {
		this.noticeId = noticeId;
	}

	public String getOriginalName() {
		return originalName;
	}

	public void setOriginalName(String originalName) {
		this.originalName = originalName;
	}

	public String getSaveName() {
		return saveName;
	}

	public void setSaveName(String saveName) {
		this.saveName = saveName;
	}

	public String getExt() {
		return ext;
	}

	public void setExt(String ext) {
		this.ext = ext;
	}

	public long getVolume() {
		return volume;
	}

	public void setVolume(long volume) {
		this.volume = volume;
	}

	public Date getCreateAt() {
		return createAt;
	}

	public void setCreateAt(Date createAt) {
		this.createAt = createAt;
	}

	public Date getUpdateAt() {
		return updateAt;
	}

	public void setUpdateAt(Date updateAt) {
		this.updateAt = updateAt;
	}
	
	
}
