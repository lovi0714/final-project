package com.project.pms.dashboard.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.pms.dashboard.repository.DashboardDAO;
import com.project.pms.dashboard.vo.DashboardNotice;
import com.project.pms.dashboard.vo.DashboardProject;
import com.project.pms.dashboard.vo.DashboardChart;

@Service
public class DashboardService {

	@Autowired
	private DashboardDAO dao;
	
	// *** 종합 대시보드 ***
	// 공지사항
	public List<DashboardNotice> getNoticeList() {
		
		return dao.getNoticeList();
	}
	
	// 프로젝트 현황
	public List<DashboardProject> getProjectList() {
		
		return dao.getProjectList();
	}
	
	// 리스크 현황
	public List<DashboardChart> getRiskStatusChart() {
		
		return dao.getRiskStatusChart();
	}
	
	// *** 개인 대시보드 ***
	// 참여 프로젝트 
	public List<DashboardProject> getMyProjectList(int empId) {
		
		return dao.getMyProjectList(empId);
	}	
	
	// 작업 진행상태
	public List<DashboardChart> getMyTaskStatusChart(int empId) {
		
		return dao.getMyTaskStatusChart(empId);
	}
	
	// 리스크 현황: 상태별
	public List<DashboardChart> getMyRiskStatusChart1(int empId) {
			
		return dao.getMyRiskStatusChart1(empId);
	}
	
	// 리스크 현황: 유형별
	public List<DashboardChart> getMyRiskStatusChart2(int empId) {
			
		return dao.getMyRiskStatusChart2(empId);
	}
}
