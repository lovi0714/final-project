package com.project.pms.myTask.repository;

import java.util.List;
import org.springframework.stereotype.Repository;
import com.project.pms.myTask.vo.MyApproval;

@Repository
public interface MyApprovalDAO {

	// 승인대기
	public List<MyApproval> getMyApprovalWaitingList(int empId);
	
	// 승인대기 프로젝트 선택 옵션 리스트
	public List<MyApproval> getWaitingProjectList(int empId);
	
	// 승인완료
	public List<MyApproval> getMyApprovalCompletedList(int empId);
	
	// 승인완료 프로젝트 선택 옵션 리스트
	public List<MyApproval> getCompletedProjectList(int empId);
	
	// 반려
	public List<MyApproval> getMyApprovalRejectedList(int empId);

	// 반려 프로젝트 선택 옵션 리스트
	public List<MyApproval> getRejectedProjectList(int empId);
	
	// 회수 요청
	public void uptApprovalCancel(int taskId);
	
	public void uptApprovalStatus(int taskId);
}
