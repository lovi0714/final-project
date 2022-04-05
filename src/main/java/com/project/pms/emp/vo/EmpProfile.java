package com.project.pms.emp.vo;

public class EmpProfile {
	private int empId;
	private String name;
	private int deptId;
	private String deptName;
	private int authId;
	private String authName;
	private int posId;
	private String posName;
	private String empEmail;
	private String phone;
	
	public EmpProfile() {
		
	}

	public EmpProfile(int empId, String name, int deptId, String deptName, int authId, String authName, int posId,
			String posName, String empEmail, String phone) {
		super();
		this.empId = empId;
		this.name = name;
		this.deptId = deptId;
		this.deptName = deptName;
		this.authId = authId;
		this.authName = authName;
		this.posId = posId;
		this.posName = posName;
		this.empEmail = empEmail;
		this.phone = phone;
	}

	public int getEmpId() {
		return empId;
	}

	public void setEmpId(int empId) {
		this.empId = empId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getDeptId() {
		return deptId;
	}

	public void setDeptId(int deptId) {
		this.deptId = deptId;
	}

	public String getDeptName() {
		return deptName;
	}

	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}

	public int getAuthId() {
		return authId;
	}

	public void setAuthId(int authId) {
		this.authId = authId;
	}

	public String getAuthName() {
		return authName;
	}

	public void setAuthName(String authName) {
		this.authName = authName;
	}

	public int getPosId() {
		return posId;
	}

	public void setPosId(int posId) {
		this.posId = posId;
	}

	public String getPosName() {
		return posName;
	}

	public void setPosName(String posName) {
		this.posName = posName;
	}

	public String getEmpEmail() {
		return empEmail;
	}

	public void setEmpEmail(String empEmail) {
		this.empEmail = empEmail;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	@Override
	public String toString() {
		return "EmpProfile [empId=" + empId + ", name=" + name + ", deptId=" + deptId + ", deptName=" + deptName
				+ ", authId=" + authId + ", authName=" + authName + ", posId=" + posId + ", posName=" + posName
				+ ", empEmail=" + empEmail + ", phone=" + phone + "]";
	}
	
	
}
