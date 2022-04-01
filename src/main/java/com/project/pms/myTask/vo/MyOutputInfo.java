package com.project.pms.myTask.vo;

public class MyOutputInfo {
	private String originalName;
	private String saveName;
	private String category;
	private String outType;
	private String content;
	private int count;
	
	public MyOutputInfo() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public MyOutputInfo(String originalName, String saveName, String category, String outType, String content,
			int count) {
		super();
		this.originalName = originalName;
		this.saveName = saveName;
		this.category = category;
		this.outType = outType;
		this.content = content;
		this.count = count;
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
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getOutType() {
		return outType;
	}
	public void setOutType(String outType) {
		this.outType = outType;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	
}
