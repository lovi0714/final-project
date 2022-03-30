package com.project.pms.output.vo;

public class OutputFileInfo {
	private String originalName;
	private String saveName;
	
	public OutputFileInfo() {
		super();
	}
	
	public OutputFileInfo(String originalName, String saveName) {
		super();
		this.originalName = originalName;
		this.saveName = saveName;
	}
	
	public String getOriginalName() {
		return originalName;
	}
	
	public void setOriginalName(String originalName) {
		this.originalName = originalName;
	}
	
	public String getSaveName() {
		return saveName;
	}
	
	public void setSaveName(String saveName) {
		this.saveName = saveName;
	}
	
	@Override
	public String toString() {
		return "OutputFileInfo [originalName=" + originalName + ", saveName=" + saveName + "]";
	}
}
