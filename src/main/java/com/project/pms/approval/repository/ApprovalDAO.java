package com.project.pms.approval.repository;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.project.pms.approval.vo.ApprovalForm;
import com.project.pms.approval.vo.ApprovalSearchCriteria;

@Repository
public interface ApprovalDAO {
	public List<ApprovalForm> getApprovalList(ApprovalSearchCriteria sc);
	public int setApproval(Integer approvalId);
	public int setReject(Integer approvalId);
	public void deleteApprovalByTaskId(Integer id);
}
