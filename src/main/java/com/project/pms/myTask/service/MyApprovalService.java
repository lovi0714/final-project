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

	// 내 결재 조회
	public List<MyApproval> getMyApprovalList(int empId) {
		
		return dao.getMyApprovalList(empId);
	}
}
