package com.project.pms.approval.repository;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.project.pms.approval.vo.ApprovalForm;

@Repository
public interface ApprovalDAO {
	public List<ApprovalForm> getApprovalList(Integer approverId);
	public int setApproval(Integer approvalId);
	public int setReject(Integer approvalId);
}
