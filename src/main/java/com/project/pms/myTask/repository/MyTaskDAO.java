package com.project.pms.myTask.repository;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.project.pms.myTask.vo.MyTask;
import com.project.pms.project.vo.Project;

@Repository
public interface MyTaskDAO {

	// 작업 목록
	public List<Project> getProjectList(int empId);
	public List<MyTask> getStatusList();
	public List<MyTask> getMyTaskList(int empId);
	
	// 작업정보 조회
	public MyTask getMyTaskDetail(int taskId);
	
	// 작업정보 수정
	public void uptMyTaskDetail(MyTask myTask);

	// 승인요청
	public void uptApprovalRequest(int taskId);
	public void insertApproval(MyTask myTask);

}
