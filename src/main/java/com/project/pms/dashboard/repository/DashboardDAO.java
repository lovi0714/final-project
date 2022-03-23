package com.project.pms.dashboard.repository;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.project.pms.dashboard.vo.DashboardChart;
import com.project.pms.dashboard.vo.DashboardNotice;
import com.project.pms.dashboard.vo.DashboardProject;

@Repository
public interface DashboardDAO {

	// ** 종합 대시보드 ** 
	// 공지사항
	public List<DashboardNotice> getNoticeList();
	
	// 프로젝트 현황
	public List<DashboardProject> getProjectList();
	
	// 리스크 현황
	public List<DashboardChart> getRiskStatusChart();
	
	// ** 개인 대시보드 **
	// 참여 프로젝트
	public List<DashboardProject> getMyProjectList(int empId);
	
	// 작업 진행상태
	public List<DashboardChart> getMyTaskStatusChart(int empId);
	
	// 리스크 현황
	public List<DashboardChart> getMyRiskStatusChart(int empId);
}
