package com.project.pms.emp.repository;


import org.springframework.stereotype.Repository;
import com.project.pms.emp.vo.Emp;

@Repository
public interface EmpDAO {

	// 사원정보조회
	public Emp empInfo(Emp emp);
	
	// 사원추가
	public void saveEmp(Emp emp);
	
}
