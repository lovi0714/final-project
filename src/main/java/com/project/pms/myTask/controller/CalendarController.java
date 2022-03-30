package com.project.pms.myTask.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.pms.emp.vo.Emp;
import com.project.pms.myTask.service.CalendarService;
import com.project.pms.myTask.vo.Calendar;

@Controller
@RequestMapping("/myTask/*")
public class CalendarController {

	@Autowired
	private CalendarService service;

	// 캘린더 조회
	@GetMapping("/calendar.do")
	public String getCalendar() {
		System.out.println("getCalendar controller called...");

		return "myTask/calendar";
	}

	@PostMapping("calendarList.do")
	public String getCalendarList(HttpSession session, Model d) {
		System.out.println("calendarList controller called...");
		int empId = ((Emp)session.getAttribute("emp")).getEmpId();
		d.addAttribute("calendarList", service.getCalendarList(empId));

		return "pageJsonReport";
	}

	// 캘린더 등록
	@PostMapping("insertCalendar.do")
	public String insertCalendar(HttpSession session, Calendar calendar) {
		System.out.println("insertCalendar controller called...");		
		int empId = ((Emp)session.getAttribute("emp")).getEmpId();
		calendar.setEmpId(empId);
		service.insertCalendar(calendar);

		return "redirect:/myTask/calendar.do";
	}

	// 캘린더 수정
	@PostMapping("updateCalendar.do")
	public String updateCalendar(Calendar calendar){
		System.out.println("updateCalendar controller called...");
		service.updateCalendar(calendar);
		
		return "redirect:/myTask/calendar.do";
	}
	
	// 캘린더 삭제
	@GetMapping("deleteCalendar.do")
	public String deleteCalendar(@RequestParam("id") int id){
		System.out.println("deleteCalendar controller called...");
		service.deleteCalendar(id);
		
		return "redirect:/myTask/calendar.do";		
	}	
}