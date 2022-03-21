package com.project.pms.project.vo;

import java.time.LocalDateTime;

public class Project {
	
	private String projectId;
	private Integer statusId;
	private Integer typeId;
	private Integer rndTypeId;
	private String title;
	private String content;
	private Integer pmId;
	private LocalDateTime startAt;
	private LocalDateTime endAt;
	private LocalDateTime createdAt;
	private LocalDateTime updatedAt;
	
	public Project() {	}
	
	public Project(String projectId, Integer statusId, Integer typeId, Integer rndTypeId, String title, String content,
			Integer pmId, LocalDateTime startAt, LocalDateTime endAt, LocalDateTime createdAt,
			LocalDateTime updatedAt) {
		super();
		this.projectId = projectId;
		this.statusId = statusId;
		this.typeId = typeId;
		this.rndTypeId = rndTypeId;
		this.title = title;
		this.content = content;
		this.pmId = pmId;
		this.startAt = startAt;
		this.endAt = endAt;
		this.createdAt = createdAt;
		this.updatedAt = updatedAt;
	}
	
	public String getProjectId() {
		return projectId;
	}
	
	public void setProjectId(String projectId) {
		this.projectId = projectId;
	}
	
	public Integer getStatusId() {
		return statusId;
	}
	
	public void setStatusId(Integer statusId) {
		this.statusId = statusId;
	}
	
	public Integer getTypeId() {
		return typeId;
	}
	
	public void setTypeId(Integer typeId) {
		this.typeId = typeId;
	}
	
	public Integer getRndTypeId() {
		return rndTypeId;
	}
	
	public void setRndTypeId(Integer rndTypeId) {
		this.rndTypeId = rndTypeId;
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
	
	public Integer getPmId() {
		return pmId;
	}
	
	public void setPmId(Integer pmId) {
		this.pmId = pmId;
	}
	
	public LocalDateTime getStartAt() {
		return startAt;
	}
	
	public void setStartAt(LocalDateTime startAt) {
		this.startAt = startAt;
	}
	
	public LocalDateTime getEndAt() {
		return endAt;
	}
	
	public void setEndAt(LocalDateTime endAt) {
		this.endAt = endAt;
	}
	
	public LocalDateTime getCreatedAt() {
		return createdAt;
	}
	
	public void setCreatedAt(LocalDateTime createdAt) {
		this.createdAt = createdAt;
	}
	
	public LocalDateTime getUpdatedAt() {
		return updatedAt;
	}
	
	public void setUpdatedAt(LocalDateTime updatedAt) {
		this.updatedAt = updatedAt;
	}
	
	@Override
	public String toString() {
		return "Project [projectId=" + projectId + ", statusId=" + statusId + ", typeId=" + typeId + ", rndTypeId="
				+ rndTypeId + ", title=" + title + ", content=" + content + ", pmId=" + pmId + ", startAt=" + startAt
				+ ", endAt=" + endAt + ", createdAt=" + createdAt + ", updatedAt=" + updatedAt + "]";
	}

}
