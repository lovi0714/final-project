package com.project.pms.risk.vo;

import java.sql.Date;
import java.time.LocalDateTime;

public class RiskSaveRequest {
	private int riskId;
	private int rStatusId;
	private int rTypeId;
	private int prjId;
	private String title;
	private String pName;
	private String tName;
	private String content;
	private String presenter;
	private String activator;
	private String aContent;
	private Date dueAt;
	private Date comAt;
	private LocalDateTime currentTime = LocalDateTime.now();
}
