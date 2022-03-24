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
	
	// 로그인 체크
	public boolean loginCheck(Emp emp, HttpSession session) {
		
		Emp emp2 = empInfo(emp);
		// 세션 변수 등록
			
		session.setAttribute("account", emp2.getAccount());
		session.setAttribute("name", emp2.getName());
		session.setAttribute("authId", emp2.getAuthId());
		session.setAttribute("empId", emp2.getEmpId());
		return true;
	}			
	
	// 직원정보조회	
	public Emp empInfo(Emp emp) {
		return empDAO.empInfo(emp);
	}
	
	// 로그아웃
	public void logout(HttpSession session) {
		session.invalidate();
	}
	

}
