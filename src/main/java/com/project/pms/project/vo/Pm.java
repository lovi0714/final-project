package com.project.pms.project.vo;

public class Pm {
	private Integer pmId;
	private Integer deptId;
	private String pmName;
	private Integer authId;
	
	public Pm() {
	}

	public Pm(Integer pmId, Integer deptId, String pmName, Integer authId) {
		super();
		this.pmId = pmId;
		this.deptId = deptId;
		this.pmName = pmName;
		this.authId = authId;
	}

	public Integer getPmId() {
		return pmId;
	}

	public void setPmId(Integer pmId) {
		this.pmId = pmId;
	}

	public Integer getDeptId() {
		return deptId;
	}

	public void setDeptId(Integer deptId) {
		this.deptId = deptId;
	}

	public String getPmName() {
		return pmName;
	}

	public void setPmName(String pmName) {
		this.pmName = pmName;
	}

	public Integer getAuthId() {
		return authId;
	}

	public void setAuthId(Integer authId) {
		this.authId = authId;
	}

	@Override
	public String toString() {
		return "Pm [pmId=" + pmId + ", deptId=" + deptId + ", pmName=" + pmName + ", authId=" + authId + "]";
	}

}
