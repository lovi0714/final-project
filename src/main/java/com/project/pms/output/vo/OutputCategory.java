package com.project.pms.output.vo;

public class OutputCategory {
	private Integer categoryId;
	private String categoryName;
	
	public OutputCategory() {
		super();
	}
	
	public OutputCategory(Integer categoryId, String categoryName) {
		super();
		this.categoryId = categoryId;
		this.categoryName = categoryName;
	}
	
	public Integer getCategoryId() {
		return categoryId;
	}
	
	public void setCategoryId(Integer categoryId) {
		this.categoryId = categoryId;
	}
	
	public String getCategoryName() {
		return categoryName;
	}
	
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	
	@Override
	public String toString() {
		return "OutputCategory [categoryId=" + categoryId + ", categoryName=" + categoryName + "]";
	}
	
}
