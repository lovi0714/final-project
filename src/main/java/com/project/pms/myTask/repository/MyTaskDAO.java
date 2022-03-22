package com.project.pms.myTask.repository;

import java.util.List;
import org.springframework.stereotype.Repository;
import com.project.pms.myTask.vo.MyTask;

@Repository
public interface MyTaskDAO {

	// 내 작업 조회
	public List<MyTask> getMyTaskList(int empId);
	
}
