package com.project.pms.task.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.pms.task.repository.CalendarDAO;
import com.project.pms.task.vo.Calendar;

@Service
public class CalendarService {

	@Autowired
	private CalendarDAO dao;

	// 캘린더 조회
	public List<Calendar> getCalendarList(int empId) {
		return dao.getCalendarList(empId);
	}
	
	// 캘린더 등록
	public void insertCalendar(Calendar calendar) {
		dao.insertCalendar(calendar);
	}

	// 캘린더 수정
	public void updateCalendar(Calendar upt) {
		dao.updateCalendar(upt);
	}
	
	// 캘린더 삭제
	public void deleteCalendar(int id) {
		dao.deleteCalendar(id);
	}
}