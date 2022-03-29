package com.project.pms.project.vo;

public class Task {
	private Integer id;
	private String projectId;
	private Integer approver;
	private Integer manager;
	private Integer statusId;
	private String text;
	private String description;
	private Float progress;
	private Integer sortorder;
	private String parent;
	private String start_date;
	private String end_date;
	
	public Task() {
		super();
	}

	public Task(Integer id, String projectId, Integer approver, Integer manager, Integer statusId, String text,
			String description, Float progress, Integer sortorder, String parent, String start_date, String end_date) {
		super();
		this.id = id;
		this.projectId = projectId;
		this.approver = approver;
		this.manager = manager;
		this.statusId = statusId;
		this.text = text;
		this.description = description;
		this.progress = progress;
		this.sortorder = sortorder;
		this.parent = parent;
		this.start_date = start_date;
		this.end_date = end_date;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getProjectId() {
		return projectId;
	}

	public void setProjectId(String projectId) {
		this.projectId = projectId;
	}

	public Integer getApprover() {
		return approver;
	}

	public void setApprover(Integer approver) {
		this.approver = approver;
	}

	public Integer getManager() {
		return manager;
	}

	public void setManager(Integer manager) {
		this.manager = manager;
	}

	public Integer getStatusId() {
		return statusId;
	}

	public void setStatusId(Integer statusId) {
		this.statusId = statusId;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Float getProgress() {
		return progress;
	}

	public void setProgress(Float progress) {
		this.progress = progress;
	}

	public Integer getSortorder() {
		return sortorder;
	}

	public void setSortorder(Integer sortorder) {
		this.sortorder = sortorder;
	}

	public String getParent() {
		return parent;
	}

	public void setParent(String parent) {
		this.parent = parent;
	}

	public String getStart_date() {
		return start_date;
	}

	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}

	public String getEnd_date() {
		return end_date;
	}

	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}

	@Override
	public String toString() {
		return "Task [id=" + id + ", projectId=" + projectId + ", approver=" + approver + ", manager=" + manager
				+ ", statusId=" + statusId + ", text=" + text + ", description=" + description + ", progress="
				+ progress + ", sortorder=" + sortorder + ", parent=" + parent + ", start_date=" + start_date
				+ ", end_date=" + end_date + "]";
	}

}
