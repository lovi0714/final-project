package com.project.pms.admin.repository;

import org.springframework.stereotype.Repository;

import com.project.pms.emp.vo.Emp;

@Repository
public interface AdminDAO {
	
	// 사원 상세정보 조회
	public Emp empInfo(int empId);

}
