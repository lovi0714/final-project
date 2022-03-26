package com.project.pms.resource.vo;

/*
 * WBS에서 사용할 VO
 */
public class ResourceWbs {
	private Integer key;
	private String label;
	
	public ResourceWbs() {
	}

	public ResourceWbs(Integer key, String label) {
		super();
		this.key = key;
		this.label = label;
	}

	public Integer getKey() {
		return key;
	}

	public void setKey(Integer key) {
		this.key = key;
	}

	public String getLabel() {
		return label;
	}

	public void setLabel(String label) {
		this.label = label;
	}

	@Override
	public String toString() {
		return "ResourceWbs [key=" + key + ", label=" + label + "]";
	}

}
