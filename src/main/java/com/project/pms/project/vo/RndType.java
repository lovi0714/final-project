package com.project.pms.project.vo;

public class RndType {
	private Integer rndId;
	private String rndType;
	
	public RndType() {
	}
	
	public RndType(Integer rndId, String rndType) {
		super();
		this.rndId = rndId;
		this.rndType = rndType;
	}
	
	public Integer getRndId() {
		return rndId;
	}
	
	public void setRndId(Integer rndId) {
		this.rndId = rndId;
	}
	
	public String getRndType() {
		return rndType;
	}
	
	public void setRndType(String rndType) {
		this.rndType = rndType;
	}
	
	@Override
	public String toString() {
		return "RndType [rndId=" + rndId + ", rndType=" + rndType + "]";
	}
	
}
