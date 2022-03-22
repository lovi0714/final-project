package com.project.pms.myTask.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.pms.myTask.repository.MyTaskDAO;
import com.project.pms.myTask.vo.MyTask;

@Service
public class MyTaskService {
	
	@Autowired
	private MyTaskDAO dao;

	// 내 작업 조회
	public List<MyTask> getMyTaskList(int empId) {
		
		return dao.getMyTaskList(empId);
	}
}
