package com.project.pms.myTask.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.pms.myTask.repository.MyOutputDAO;
import com.project.pms.myTask.vo.MyOutputInfo;

@Service
public class MyOutputService {

	@Autowired
	private MyOutputDAO dao;
	
	public List<MyOutputInfo> getMyOutputInfo(int taskId) {
		
		return dao.getMyOutputInfo(taskId);
	}
	
}
