package com.project.pms.myTask.repository;

import java.util.List;
import org.springframework.stereotype.Repository;
import com.project.pms.myTask.vo.MyApproval;

@Repository
public interface MyApprovalDAO {

	// 내 결재 조회
	public List<MyApproval> getMyApprovalList(int empId);
	
}
