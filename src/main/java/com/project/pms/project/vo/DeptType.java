package com.project.pms.project.vo;

public class DeptType {
	private Integer deptId;
	private String deptName;
	
	public DeptType() {
		super();
	}
	
	public DeptType(Integer deptId, String deptName) {
		super();
		this.deptId = deptId;
		this.deptName = deptName;
	}
	
	public Integer getDeptId() {
		return deptId;
	}
	
	public void setDeptId(Integer deptId) {
		this.deptId = deptId;
	}
	
	public String getDeptName() {
		return deptName;
	}
	
	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}
	
	@Override
	public String toString() {
		return "DeptType [deptId=" + deptId + ", deptName=" + deptName + "]";
	}
	
}
