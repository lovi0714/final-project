package com.project.pms.task.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.pms.task.service.CalendarService;
import com.project.pms.task.vo.Calendar;

@Controller
@RequestMapping("/task/*")
public class CalendarController {

	@Autowired
	private CalendarService service;

	// 캘린더 조회
	@GetMapping("/calendar.do")
	public String getCalendar() {
		System.out.println("getCalendar controller called...");

		return "task/calendar";
	}

	@PostMapping("calendarList.do")
	public String getCalendarList(Model d) {
		System.out.println("calendarList controller called...");
		int empId = 1;
		d.addAttribute("calendarList", service.getCalendarList(empId));

		return "pageJsonReport";
	}

	// 캘린더 등록
	@PostMapping("insertCalendar.do")
	public String insertCalendar(Calendar calendar) {
		System.out.println("insertCalendar controller called...");
		calendar.setEmpId(1);
		service.insertCalendar(calendar);

		return "redirect:/calendar.do";
	}

	// 캘린더 수정
	@PostMapping("updateCalendar")
	public String updateCalendar(Calendar calendar){
		System.out.println("updateCalendar controller called...");
		calendar.setEmpId(1);
		service.updateCalendar(calendar);
		
		return "redirect:/calendar.do";
	}
	
	// 캘린더 삭제
	@GetMapping("deleteCalendar")
	public String deleteCalendar(int empId){
		System.out.println("deleteCalendar controller called...");
		empId = 1;
		service.deleteCalendar(empId);
		
		return "redirect:/calendar.do";		
	}	
}