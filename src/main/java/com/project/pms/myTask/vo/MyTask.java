package com.project.pms.myTask.vo;

import java.util.Date;

public class MyTask {
	private int taskName;
	private String ptitle;
	private String pmName;
	private String status;
	private Date startAt;
	private Date endAt;
	private int progress;
	private String content;
	
	public MyTask() {
		super();
		// TODO Auto-generated constructor stub
	}

	public MyTask(int taskName, String ptitle, String pmName, String status, Date startAt, Date endAt, int progress,
			String content) {
		super();
		this.taskName = taskName;
		this.ptitle = ptitle;
		this.pmName = pmName;
		this.status = status;
		this.startAt = startAt;
		this.endAt = endAt;
		this.progress = progress;
		this.content = content;
	}

	public int getTaskName() {
		return taskName;
	}

	public void setTaskName(int taskName) {
		this.taskName = taskName;
	}

	public String getPtitle() {
		return ptitle;
	}

	public void setPtitle(String ptitle) {
		this.ptitle = ptitle;
	}

	public String getPmName() {
		return pmName;
	}

	public void setPmName(String pmName) {
		this.pmName = pmName;
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
	

	
	
	
}
