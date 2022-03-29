package com.project.pms.risk.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.pms.emp.vo.Emp;
import com.project.pms.myTask.vo.MyTask;
import com.project.pms.project.vo.Project;
import com.project.pms.risk.repository.RiskDAO;
import com.project.pms.risk.vo.Risk;
import com.project.pms.risk.vo.RiskBoard;
import com.project.pms.risk.vo.RiskDetail;
import com.project.pms.risk.vo.RiskFileInfo;
import com.project.pms.risk.vo.RiskSaveRequest;


@Service
public class RiskService {

	@Autowired
	private RiskDAO dao;
	
	// 전체 목록 가져오기
	public List<RiskBoard> getRiskList() {	
		return dao.getRiskList(); 
	}
	
	// 상세 페이지
	public RiskDetail getRiskDetail(int riskId) {
		return dao.getRiskDetail(riskId);
	}
	
	public RiskFileInfo getFileInfo(int riskId) {
		return dao.getFileInfo(riskId);
	}
	
	// 리스크 등록
	public void saveRisk(RiskSaveRequest riskSaveRequest) throws Exception {
		dao.saveRisk(riskSaveRequest);
		dao.setComAt(riskSaveRequest);
	}
	
	public void insertFile(RiskFileInfo file) throws Exception {
		dao.insertFile(file);
	}
	
	// 수정 정보
	public RiskSaveRequest getModifyInfo(int riskId) {
		return dao.getModifyInfo(riskId);
	} 
	
	//리스크 삭제
	public void deleteRisk(int riskId) {
		dao.deleteRisk(riskId);
	}
	
	/* SELECT BOX 목록 가져오기 */
	
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
