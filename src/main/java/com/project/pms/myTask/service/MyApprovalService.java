package com.project.pms.myTask.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.pms.myTask.repository.MyApprovalDAO;
import com.project.pms.myTask.vo.MyApproval;

@Service
public class MyApprovalService {

	@Autowired
	private MyApprovalDAO dao;
	
	// 승인 대기
	public List<MyApproval> getMyApprovalWaitingList(int empId) {
		
		return dao.getMyApprovalWaitingList(empId);
	}
	
	// 승인대기 프로젝트 선택 옵션 리스트
	public List<MyApproval> getWaitingProjectList(int empId) {
		
		return dao.getWaitingProjectList(empId);
	}
		
	// 승인 완료
	public List<MyApproval> getMyApprovalCompletedList(int empId) {
		
		return dao.getMyApprovalCompletedList(empId);
	}
	
	// 승인완료 프로젝트 선택 옵션 리스트
	public List<MyApproval> getCompletedProjectList(int empId) {
		
		return dao.getCompletedProjectList(empId);
	}
	
	// 반려
	public List<MyApproval> getMyApprovalRejectedList(int empId) {
		
		return dao.getMyApprovalRejectedList(empId);
	}
	
	// 반려 프로젝트 선택 옵션 리스트
	public List<MyApproval> getRejectedProjectList(int empId) {
		
		return dao.getRejectedProjectList(empId);
	}
	
	// 회수 요청
	public boolean uptApprovalCancel(int taskId) {		
		dao.uptApprovalCancel(taskId);
		
		return true;
	}
	
	public boolean uptApprovalStatus(int taskId) {
		dao.uptApprovalStatus(taskId);
		
		return true;
	}
}
