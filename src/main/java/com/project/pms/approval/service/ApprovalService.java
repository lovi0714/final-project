package com.project.pms.approval.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.pms.approval.repository.ApprovalDAO;
import com.project.pms.approval.vo.ApprovalForm;
import com.project.pms.approval.vo.ApprovalSearchCriteria;

@Service
public class ApprovalService {
	
	@Autowired
	private ApprovalDAO dao;
	
	public List<ApprovalForm> getApprovalList(ApprovalSearchCriteria sc) {
		
		return dao.getApprovalList(sc);
	}
	
	public int setApproval(Integer approvalId) {
		
		return dao.setApproval(approvalId);
	}
	
	public int setReject(Integer approvalId) {
		
		return dao.setReject(approvalId);
	}

	public void deleteApprovalByTaskId(Integer id) {
		
		dao.deleteApprovalByTaskId(id);
	}
}
