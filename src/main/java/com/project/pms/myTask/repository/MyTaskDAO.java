package com.project.pms.myTask.repository;

import java.util.List;

import com.project.pms.myTask.vo.Calendar;
import com.project.pms.myTask.vo.MyTask;

public interface MyTaskDAO {

	// 내 작업 조회
	public List<MyTask> getTaskList(int empId);

	// 내 작업 수정
	public void updateCalendar(Calendar calendar);
	
}
