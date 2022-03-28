package com.project.pms.emp.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.pms.emp.repository.EmpDAO;
import com.project.pms.emp.vo.Emp;

@Service
public class EmpService {
	
	@Autowired
	private EmpDAO empDAO;
	
	// @Autowired
	// PasswordManagement passwordManagement;
	
	// 사원추가
	public boolean joinEmp(Emp emp) { // , String rawPassword
		// String encryptPassword = passwordManagement.encryptPassword(emp);
		// emp.setPassword(encryptPassword);
		empDAO.saveEmp(emp);
		
		return true;
	}	
	
	// 사원정보조회	
	public Emp empInfo(Emp emp) {
		return empDAO.empInfo(emp);
	}
	
	// 로그아웃
	public void logout(HttpSession session) {
		session.invalidate();
	}
	
}
