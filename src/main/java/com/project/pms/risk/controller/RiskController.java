package com.project.pms.risk.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/risk")
public class RiskController {
	
	@GetMapping("/riskBoard.do")
	public String risk() {
		return "risk/riskBoard";
	}
}
