package com.project.pms.risk.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.pms.emp.vo.Emp;
import com.project.pms.myTask.vo.MyTask;
import com.project.pms.project.vo.Project;
import com.project.pms.risk.repository.RiskDAO;
import com.project.pms.risk.vo.Risk;


@Service
public class RiskService {

	@Autowired
	private RiskDAO dao;
	
	// 전체 목록 가져오기
	public List<Risk> getRiskList() {	
		return dao.getRiskList(); 
	}
	
	// 상세 페이지
	public Risk getRiskDetail(int riskId) {
		return dao.getRiskDetail(riskId);
	}
	
	//리스크 삭제
	public void deleteRisk(int riskId) {
		dao.deleteRisk(riskId);
	}
	
	
	// 사원 리스트
	public List<Emp> getEmpList() {
		return dao.getEmpList();
	}
	
	// 프로젝트 리스트
	public List<Project> getProjectList() {
		return dao.getProjectList();
	}
	
	// 작업 리스트
	public List<MyTask> getMyTaskList(){
		return dao.getMyTaskList();
	}
	
	
	
}
