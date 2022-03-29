package com.project.pms.project.vo;

public class Link {
	private Integer id;
	private Integer source;
	private Integer target;
	private String type;
	private String projectId;
	
	public Link() {
	}

	public Link(Integer id, Integer source, Integer target, String type, String projectId) {
		super();
		this.id = id;
		this.source = source;
		this.target = target;
		this.type = type;
		this.projectId = projectId;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getSource() {
		return source;
	}

	public void setSource(Integer source) {
		this.source = source;
	}

	public Integer getTarget() {
		return target;
	}

	public void setTarget(Integer target) {
		this.target = target;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getProjectId() {
		return projectId;
	}

	public void setProjectId(String projectId) {
		this.projectId = projectId;
	}

	@Override
	public String toString() {
		return "Link [id=" + id + ", source=" + source + ", target=" + target + ", type=" + type + ", projectId="
				+ projectId + "]";
	}
	
}
