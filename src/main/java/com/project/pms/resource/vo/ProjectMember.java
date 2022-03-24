package com.project.pms.resource.vo;

public class ProjectMember {
	private Integer empId;
	private String empName;
	private String deptName;
	private String position;
	
	public ProjectMember() {
	}
	
	public ProjectMember(Integer empId, String empName, String deptName, String position) {
		super();
		this.empId = empId;
		this.empName = empName;
		this.deptName = deptName;
		this.position = position;
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
	
	public String getDeptName() {
		return deptName;
	}
	
	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}
	
	public String getPosition() {
		return position;
	}
	
	public void setPosition(String position) {
		this.position = position;
	}
	
	@Override
	public String toString() {
		return "ProjectMember [empId=" + empId + ", empName=" + empName + ", deptName=" + deptName + ", position="
				+ position + "]";
	}
	
}
