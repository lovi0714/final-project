package com.project.pms.myTask.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.pms.myTask.repository.MyTaskDAO;
import com.project.pms.myTask.vo.MyTask;
import com.project.pms.project.vo.Project;

@Service
public class MyTaskService {
	
	@Autowired
	private MyTaskDAO dao;

	// 작업 목록
	public List<MyTask> getMyTaskList(int empId) {
		
		return dao.getMyTaskList(empId);
	}
	
	// 작업정보 조회
	public MyTask getMyTaskDetail(int taskId) {
		
		return dao.getMyTaskDetail(taskId); 
	}
	
	// 작업정보 수정
	public boolean uptMyTaskDetail(MyTask myTask) {
		dao.uptMyTaskDetail(myTask);
		
		return true;
	}
	
	// 승인요청
	public boolean uptApprovalRequest(int taskId) {		
		dao.uptApprovalRequest(taskId);
		
		return true;
	}
	
	public boolean insertApproval(MyTask myTask) {
		dao.insertApproval(myTask);
		
		return true;
	}
	
	// 프로젝트 선택 옵션 리스트
	public List<Project> getProjectList(int empId) {
		
		return dao.getProjectList(empId);
	}
}
