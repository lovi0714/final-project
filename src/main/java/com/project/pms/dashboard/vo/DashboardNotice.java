package com.project.pms.dashboard.vo;

import java.util.Date;

public class DashboardNotice {
	private String title;
	private String writer;
	private Date createAt;
	
	public DashboardNotice() {
		super();
		// TODO Auto-generated constructor stub
	}

	public DashboardNotice(String title, String writer, Date createAt) {
		super();
		this.title = title;
		this.writer = writer;
		this.createAt = createAt;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public Date getCreateAt() {
		return createAt;
	}

	public void setCreateAt(Date createAt) {
		this.createAt = createAt;
	}
	
	
}
