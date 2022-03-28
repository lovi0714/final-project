package com.project.pms.risk.vo;

import java.util.Date;

public class RiskFileInfo {
	private int rFileId;
	private int boardId;
	private String originalName;
	private String saveName;
	private String extension;
	private long volume;
	private Date createAt;
	private Date updateAt;
	public RiskFileInfo() {

	}
	public RiskFileInfo(int rFileId, int boardId, String originalName, String saveName, String extension, long volume,
			Date createAt, Date updateAt) {
		super();
		this.rFileId = rFileId;
		this.boardId = boardId;
		this.originalName = originalName;
		this.saveName = saveName;
		this.extension = extension;
		this.volume = volume;
		this.createAt = createAt;
		this.updateAt = updateAt;
	}
	public int getrFileId() {
		return rFileId;
	}
	public void setrFileId(int rFileId) {
		this.rFileId = rFileId;
	}
	public int getBoardId() {
		return boardId;
	}
	public void setBoardId(int boardId) {
		this.boardId = boardId;
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
	public String getExtension() {
		return extension;
	}
	public void setExtension(String extension) {
		this.extension = extension;
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
