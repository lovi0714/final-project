package com.project.pms.project.vo;

public class Pm {
	private Integer pmId;
	private String pmName;
	
	public Pm() {
	}

	public Pm(Integer pmId, String pmName) {
		super();
		this.pmId = pmId;
		this.pmName = pmName;
	}

	public Integer getPmId() {
		return pmId;
	}

	public void setPmId(Integer pmId) {
		this.pmId = pmId;
	}

	public String getPmName() {
		return pmName;
	}

	public void setPmName(String pmName) {
		this.pmName = pmName;
	}

	@Override
	public String toString() {
		return "Pm [pmId=" + pmId + ", pmName=" + pmName + "]";
	}
	
}
