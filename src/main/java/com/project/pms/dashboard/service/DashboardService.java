package com.project.pms.dashboard.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.pms.dashboard.repository.DashboardDAO;
import com.project.pms.dashboard.vo.DashboardNotice;
import com.project.pms.dashboard.vo.DashboardProject;
import com.project.pms.dashboard.vo.StatusChart;

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
	public List<DashboardProject> getDeptList() {
		return dao.getDeptList(); // 부서 선택 옵션
	}
	
	public List<DashboardProject> getStatusList() {
		return dao.getStatusList(); // 상태 선택 옵션
	}
	
	public List<DashboardProject> getProjectList() {
		return dao.getProjectList();
	}
	
	// 부서별 프로젝트 현황
	public List<StatusChart> getProjectChart1() {
		return dao.getProjectChart1();
	}
	
	public List<StatusChart> getProjectChart2() {
		return dao.getProjectChart2();
	}
	
	public List<StatusChart> getProjectChart3() {	
		return dao.getProjectChart3();
	}
	
	public List<StatusChart> getProjectChart4() {		
		return dao.getProjectChart4();
	}
	
	public List<StatusChart> getProjectChart5() {		
		return dao.getProjectChart5();
	}
	
	// 리스크 현황
	public List<StatusChart> getRiskStatusChart1() { 
		return dao.getRiskStatusChart1(); // 상태별
	}
	
	public List<StatusChart> getRiskStatusChart2() { 
		return dao.getRiskStatusChart2(); // 유형별	
	}
	
	// *** 개인 대시보드 ***
	// 참여 프로젝트 
	public List<DashboardProject> getMyProjectList(int empId) {		
		return dao.getMyProjectList(empId);
	}	
	
	// 작업 진행상태
	public List<StatusChart> getMyTaskStatusChart(int empId) {		
		return dao.getMyTaskStatusChart(empId);
	}
	
	// 리스크 현황
	public List<StatusChart> getMyRiskStatusChart1(int empId) {	
		return dao.getMyRiskStatusChart1(empId); // 상태별
	}
	
	public List<StatusChart> getMyRiskStatusChart2(int empId) {	
		return dao.getMyRiskStatusChart2(empId); // 유형별
	}
	
}
