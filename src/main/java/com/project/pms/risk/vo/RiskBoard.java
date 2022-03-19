package com.project.pms.risk.vo;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

public class RiskBoard {
	private int risk_id;
	private String title;
	private String p_name;
	private String t_name;
	private String presenter;
	private String activator;
	private LocalDateTime due_at;
	private LocalDateTime com_at;
	
	public RiskBoard() {

	}
	
	public RiskBoard(int risk_id, String title, String p_name, String t_name, String presenter, String activator,
			LocalDateTime due_at, LocalDateTime com_at) {

		this.risk_id = risk_id;
		this.title = title;
		this.p_name = p_name;
		this.t_name = t_name;
		this.presenter = presenter;
		this.activator = activator;
		this.due_at = due_at;
		this.com_at = com_at;
	}
	
	public int getRisk_id() {
		return risk_id;
	}
	public void setRisk_id(int risk_id) {
		this.risk_id = risk_id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public String getT_name() {
		return t_name;
	}
	public void setT_name(String t_name) {
		this.t_name = t_name;
	}
	public String getPresenter() {
		return presenter;
	}
	public void setPresenter(String presenter) {
		this.presenter = presenter;
	}
	public String getActivator() {
		return activator;
	}
	public void setActivator(String activator) {
		this.activator = activator;
	}
	public LocalDateTime getDue_at() {
		return due_at;
	}
	public void setDue_at(LocalDateTime due_at) {
		this.due_at = due_at;
	}
	public LocalDateTime getCom_at() {
		return com_at;
	}
	public void setCom_at(LocalDateTime com_at) {
		this.com_at = com_at;
	}
}
