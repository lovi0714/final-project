package com.project.pms.resource.vo;

public class Resource {
	private Integer resourceId;
	private String projectId;
	private Integer empId;
	private String empName;
	private Integer positionId;
	private String position;
	private Integer pmoId;
	
	public Resource() {
	}

	public Resource(String projectId, Integer empId) {
		super();
		this.projectId = projectId;
		this.empId = empId;
	}

	public Resource(Integer resourceId, String projectId, Integer empId, String empName, Integer positionId,
			String position, Integer pmoId) {
		super();
		this.resourceId = resourceId;
		this.projectId = projectId;
		this.empId = empId;
		this.empName = empName;
		this.positionId = positionId;
		this.position = position;
		this.pmoId = pmoId;
	}

	public Integer getResourceId() {
		return resourceId;
	}

	public void setResourceId(Integer resourceId) {
		this.resourceId = resourceId;
	}

	public String getProjectId() {
		return projectId;
	}

	public void setProjectId(String projectId) {
		this.projectId = projectId;
	}

	public Integer getEmpId() {
		return empId;
	}

	public void setEmpId(Integer empId) {
		this.empId = empId;
	}

	public String getEmpName() {
		return empName;
	}

	public void setEmpName(String empName) {
		this.empName = empName;
	}

	public Integer getPositionId() {
		return positionId;
	}

	public void setPositionId(Integer positionId) {
		this.positionId = positionId;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public Integer getPmoId() {
		return pmoId;
	}

	public void setPmoId(Integer pmoId) {
		this.pmoId = pmoId;
	}

	@Override
	public String toString() {
		return "Resource [resourceId=" + resourceId + ", projectId=" + projectId + ", empId=" + empId + ", empName="
				+ empName + ", positionId=" + positionId + ", position=" + position + ", pmoId=" + pmoId + "]";
	}

}
