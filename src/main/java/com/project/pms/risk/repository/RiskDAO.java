package com.project.pms.risk.repository;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.project.pms.emp.vo.Emp;
import com.project.pms.myTask.vo.MyTask;
import com.project.pms.project.vo.Project;
import com.project.pms.risk.vo.Risk;


@Repository
public interface RiskDAO {

	// 전체 목록 가져오기
	public List<Risk> getRiskList();
	
	// 상세 페이지
	public Risk getRiskDetail(int riskId);
	
	// 리스크 삭제
	void deleteRisk(int riskId);
	
	// 사원 리스트 
	public List<Emp> getEmpList();

	// 프로젝트 리스트
	public List<Project> getProjectList();
	
	// 작업 리스트
	public List<MyTask> getMyTaskList();
}