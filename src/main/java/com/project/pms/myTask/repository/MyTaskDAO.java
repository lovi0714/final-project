package com.project.pms.myTask.repository;

import java.util.List;
import org.springframework.stereotype.Repository;
import com.project.pms.myTask.vo.MyTask;

@Repository
public interface MyTaskDAO {

	// 작업 목록
	public List<MyTask> getMyTaskList(int empId);
	
	// 작업정보 조회
	public MyTask getMyTaskDetail(int taskId);
	
}
