package com.project.pms.myTask.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.pms.myTask.repository.MyOutputDAO;
import com.project.pms.myTask.vo.MyOutputInfo;
import com.project.pms.myTask.vo.MyTask;
import com.project.pms.output.vo.OutputListForm;
import com.project.pms.project.vo.Project;

@Service
public class MyOutputService {

	@Autowired
	private MyOutputDAO dao;
	
	// 산출물 목록
	public List<Project> getProjectList(int empId) {
		return dao.getProjectList(empId); 
	}
	
	public List<OutputListForm> getMyOutputList(int empId) {
		return dao.getMyOutputList(empId);
	}
	
	// 산출물 정보
	public List<MyOutputInfo> getMyOutputInfo(MyTask myTask) {
		return dao.getMyOutputInfo(myTask);
	}

	public List<Project> getOutputProject(int empId) {
		return dao.getOutputProject(empId);	
	}
	
}
