package com.project.pms.myTask.vo;

public class Calendar {
	private int id;
	private int empId;
	private String title;
	private String start;
	private String end;
	private boolean allDay;
	private String backgroundColor;
	private String textColor;
	private String content;
	
	public Calendar() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Calendar(int id, int empId, String title, String start, String end, boolean allDay, String backgroundColor,
			String textColor, String content) {
		super();
		this.id = id;
		this.empId = empId;
		this.title = title;
		this.start = start;
		this.end = end;
		this.allDay = allDay;
		this.backgroundColor = backgroundColor;
		this.textColor = textColor;
		this.content = content;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getEmpId() {
		return empId;
	}

	public void setEmpId(int empId) {
		this.empId = empId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getStart() {
		return start;
	}

	public void setStart(String start) {
		this.start = start;
	}

	public String getEnd() {
		return end;
	}

	public void setEnd(String end) {
		this.end = end;
	}

	public boolean isAllDay() {
		return allDay;
	}

	public void setAllDay(boolean allDay) {
		this.allDay = allDay;
	}

	public String getBackgroundColor() {
		return backgroundColor;
	}

	public void setBackgroundColor(String backgroundColor) {
		this.backgroundColor = backgroundColor;
	}

	public String getTextColor() {
		return textColor;
	}

	public void setTextColor(String textColor) {
		this.textColor = textColor;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	
	
	
}
