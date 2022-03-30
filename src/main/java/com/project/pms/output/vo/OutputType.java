package com.project.pms.output.vo;

public class OutputType {
	private Integer typeId;
	private String typeName;
	
	public OutputType() {
		super();
	}
	
	public OutputType(Integer typeId, String typeName) {
		super();
		this.typeId = typeId;
		this.typeName = typeName;
	}
	
	public Integer getTypeId() {
		return typeId;
	}
	
	public void setTypeId(Integer typeId) {
		this.typeId = typeId;
	}
	
	public String getTypeName() {
		return typeName;
	}
	
	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}
	
	@Override
	public String toString() {
		return "OutputType [typeId=" + typeId + ", typeName=" + typeName + "]";
	}
	
}
