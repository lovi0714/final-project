package com.project.pms.myTask.repository;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.project.pms.myTask.vo.MyOutputInfo;
import com.project.pms.myTask.vo.MyTask;
import com.project.pms.output.vo.OutputListForm;
import com.project.pms.project.vo.Project;

@Repository
public interface MyOutputDAO {

	// 산출물 목록
	public List<Project> getProjectList(int empId);
	public List<OutputListForm> getMyOutputList(int empId);
	
	// 산출물 정보
	public List<MyOutputInfo> getMyOutputInfo(MyTask myTask);
	
	
	
}
