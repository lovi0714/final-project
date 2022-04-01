package com.project.pms.myTask.repository;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.project.pms.myTask.vo.MyOutputInfo;

@Repository
public interface MyOutputDAO {

	public List<MyOutputInfo> getMyOutputInfo(int taskId);
	
}
