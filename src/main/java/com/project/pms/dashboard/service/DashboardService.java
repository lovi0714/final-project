package com.project.pms.dashboard.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.pms.dashboard.repository.DashboardDAO;
import com.project.pms.dashboard.vo.DashboardNotice;
import com.project.pms.dashboard.vo.DashboardProject;

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
	
	// *** 개인 대시보드 ***
	// 참여 프로젝트 
	public List<DashboardProject> getMyProjectList(int empId) {
		
		return dao.getMyProjectList(empId);
	}	
}
