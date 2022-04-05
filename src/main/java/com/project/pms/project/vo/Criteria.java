package com.project.pms.project.vo;

public class Criteria {
	private Integer page;
	private Integer perPageNum;
	private Integer rowStart;
	private Integer rowEnd;
	
	public Criteria() {
		this.page = 1;
		this.perPageNum = 10;
	}
	
	public Integer getPage() {
		return page;
	}
	
	public void setPage(Integer page) {
		if (page <= 0) {
			this.page = 1;
			return;
		}
		this.page = page;
	}
	
	public Integer getPerPageNum() {
		return perPageNum;
	}
	
	public void setPerPageNum(Integer perPageNum) {
		if (perPageNum <= 0 || perPageNum > 100) {
			this.perPageNum = 10;
			return;
		}
		this.perPageNum = perPageNum;
	}
	
	public Integer getRowStart() {
		rowStart = ((page - 1) * perPageNum) + 1;
		
		return rowStart;
	}
	
	public Integer getPageStart() {
		
		return (this.page - 1) * perPageNum;
	}
	
	public void setRowStart(Integer rowStart) {
		this.rowStart = rowStart;
	}
	
	public Integer getRowEnd() {
		rowEnd = rowStart + perPageNum - 1;
		
		return rowEnd;
	}
	
	public void setRowEnd(Integer rowEnd) {
		
		this.rowEnd = rowEnd;
	}
	
	@Override
	public String toString() {
		return "Criteria [page=" + page + ", perPageNum=" + perPageNum + ", rowStart=" + rowStart + ", rowEnd=" + rowEnd
				+ "]";
	}
	
	
}
