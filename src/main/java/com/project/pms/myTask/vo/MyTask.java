package com.project.pms.myTask.vo;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class MyTask {
	private int taskId;
	private String taskName;
	private String pTitle;
	private int pmId;
	private String pmName;
	private int statusId;
	private String status;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd", timezone = "Asia/Seoul")
	private Date startAt;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd", timezone = "Asia/Seoul")
	private Date endAt;
	private int progress;
	private String content;
	private String reqContent;
	
	public MyTask() {
		super();
		// TODO Auto-generated constructor stub
	}

	public MyTask(int taskId, String taskName, String pTitle, int pmId, String pmName, int statusId, String status,
			Date startAt, Date endAt, int progress, String content, String reqContent) {
		super();
		this.taskId = taskId;
		this.taskName = taskName;
		this.pTitle = pTitle;
		this.pmId = pmId;
		this.pmName = pmName;
		this.statusId = statusId;
		this.status = status;
		this.startAt = startAt;
		this.endAt = endAt;
		this.progress = progress;
		this.content = content;
		this.reqContent = reqContent;
	}

	public int getTaskId() {
		return taskId;
	}

	public void setTaskId(int taskId) {
		this.taskId = taskId;
	}

	public String getTaskName() {
		return taskName;
	}

	public void setTaskName(String taskName) {
		this.taskName = taskName;
	}

	public String getpTitle() {
		return pTitle;
	}

	public void setpTitle(String pTitle) {
		this.pTitle = pTitle;
	}

	public int getPmId() {
		return pmId;
	}

	public void setPmId(int pmId) {
		this.pmId = pmId;
	}

	public String getPmName() {
		return pmName;
	}

	public void setPmName(String pmName) {
		this.pmName = pmName;
	}

	public int getStatusId() {
		return statusId;
	}

	public void setStatusId(int statusId) {
		this.statusId = statusId;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Date getStartAt() {
		return startAt;
	}

	public void setStartAt(Date startAt) {
		this.startAt = startAt;
	}

	public Date getEndAt() {
		return endAt;
	}

	public void setEndAt(Date endAt) {
		this.endAt = endAt;
	}

	public int getProgress() {
		return progress;
	}

	public void setProgress(int progress) {
		this.progress = progress;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getReqContent() {
		return reqContent;
	}

	public void setReqContent(String reqContent) {
		this.reqContent = reqContent;
	}
	
}
