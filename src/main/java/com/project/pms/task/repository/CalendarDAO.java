package com.project.pms.task.repository;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.project.pms.task.vo.Calendar;

@Repository
public interface CalendarDAO {

	// 캘린더 조회
	public List<Calendar> getCalendarList(int empId);

	// 캘린더 등록
	public void insertCalendar(Calendar calendar);

	// 캘린더 수정
	public void updateCalendar(Calendar calendar);
	
	// 캘린더 삭제
	public void deleteCalendar(int empId);	
}