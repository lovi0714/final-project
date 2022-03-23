package com.project.pms.emp.repository;

import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Repository;

import com.project.pms.emp.vo.Emp;
// com.project.pms.emp.repository.EmpDAO
@Repository
public interface EmpDAO {

	
	
	// 직원정보조회
	public Emp empInfo(Emp emp);
	
	// 로그아웃
	public void logout(HttpSession session);
	
}
