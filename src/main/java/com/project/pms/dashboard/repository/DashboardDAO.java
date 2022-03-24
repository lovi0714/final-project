package com.project.pms.dashboard.repository;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.project.pms.dashboard.vo.DashboardNotice;
import com.project.pms.dashboard.vo.DashboardProject;
import com.project.pms.dashboard.vo.StatusChart;

@Repository
public interface DashboardDAO {

	// ** 종합 대시보드 ** 
	// 공지사항
	public List<DashboardNotice> getNoticeList();
	
	// 프로젝트 현황
	public List<DashboardProject> getProjectList();
	
	// 부서별 프로젝트 현황
	public List<StatusChart> getProjectChart1();
	public List<StatusChart> getProjectChart2();
	public List<StatusChart> getProjectChart3();
	public List<StatusChart> getProjectChart4();
	public List<StatusChart> getProjectChart5();
	
	// 리스크 현황: 상태별
	public List<StatusChart> getRiskStatusChart1();

	// 리스크 현황: 유형별
	public List<StatusChart> getRiskStatusChart2();
	
	// ** 개인 대시보드 **
	// 참여 프로젝트
	public List<DashboardProject> getMyProjectList(int empId);
	
	// 작업 진행상태
	public List<StatusChart> getMyTaskStatusChart(int empId);
	
	// 리스크 현황: 상태별
	public List<StatusChart> getMyRiskStatusChart1(int empId);
	
	// 리스크 현황: 유형별
	public List<StatusChart> getMyRiskStatusChart2(int empId);
}
