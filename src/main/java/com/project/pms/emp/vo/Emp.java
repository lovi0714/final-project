package com.project.pms.emp.vo;

import java.time.LocalDateTime;

public class Emp {
	private int empId;
	private int deptId;
	private int authId;
	private int posId;
	private String deptName;
	private String authName;
	private String posName;
	private String password;
	private String name;
	private String empEmail;
	private String phone;
	private LocalDateTime joinAt;
	private LocalDateTime leaveAt;
	private int isLeave;
	private LocalDateTime createAt;
	private LocalDateTime updateAt;
	
	public Emp() {}

	public Emp(int empId, int deptId, int authId, int posId, String deptName, String authName, String posName,
			String password, String name, String empEmail, String phone, LocalDateTime joinAt, LocalDateTime leaveAt,
			int isLeave, LocalDateTime createAt, LocalDateTime updateAt) {
		super();
		this.empId = empId;
		this.deptId = deptId;
		this.authId = authId;
		this.posId = posId;
		this.deptName = deptName;
		this.authName = authName;
		this.posName = posName;
		this.password = password;
		this.name = name;
		this.empEmail = empEmail;
		this.phone = phone;
		this.joinAt = joinAt;
		this.leaveAt = leaveAt;
		this.isLeave = isLeave;
		this.createAt = createAt;
		this.updateAt = updateAt;
	}

	public int getEmpId() {
		return empId;
	}

	public void setEmpId(int empId) {
		this.empId = empId;
	}

	public int getDeptId() {
		return deptId;
	}

	public void setDeptId(int deptId) {
		this.deptId = deptId;
	}

	public int getAuthId() {
		return authId;
	}

	public void setAuthId(int authId) {
		this.authId = authId;
	}

	public int getPosId() {
		return posId;
	}

	public void setPosId(int posId) {
		this.posId = posId;
	}

	public String getDeptName() {
		return deptName;
	}

	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}

	public String getAuthName() {
		return authName;
	}

	public void setAuthName(String authName) {
		this.authName = authName;
	}

	public String getPosName() {
		return posName;
	}

	public void setPosName(String posName) {
		this.posName = posName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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

	public LocalDateTime getJoinAt() {
		return joinAt;
	}

	public void setJoinAt(LocalDateTime joinAt) {
		this.joinAt = joinAt;
	}

	public LocalDateTime getLeaveAt() {
		return leaveAt;
	}

	public void setLeaveAt(LocalDateTime leaveAt) {
		this.leaveAt = leaveAt;
	}

	public int getIsLeave() {
		return isLeave;
	}

	public void setIsLeave(int isLeave) {
		this.isLeave = isLeave;
	}

	public LocalDateTime getCreateAt() {
		return createAt;
	}

	public void setCreateAt(LocalDateTime createAt) {
		this.createAt = createAt;
	}

	public LocalDateTime getUpdateAt() {
		return updateAt;
	}

	public void setUpdateAt(LocalDateTime updateAt) {
		this.updateAt = updateAt;
	}

	@Override
	public String toString() {
		return "Emp [empId=" + empId + ", deptId=" + deptId + ", authId=" + authId + ", posId=" + posId + ", deptName="
				+ deptName + ", authName=" + authName + ", posName=" + posName + ", password=" + password + ", name="
				+ name + ", empEmail=" + empEmail + ", phone=" + phone + ", joinAt=" + joinAt + ", leaveAt=" + leaveAt
				+ ", isLeave=" + isLeave + ", createAt=" + createAt + ", updateAt=" + updateAt + "]";
	}

	

	
	
}
