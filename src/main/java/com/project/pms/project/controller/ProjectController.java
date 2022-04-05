package com.project.pms.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.pms.project.service.ProjectService;
import com.project.pms.project.vo.Project;
import com.project.pms.project.vo.ProjectSearchCriteria;
import com.project.pms.resource.service.ResourceService;

@Controller
@RequestMapping("/project/*")
public class ProjectController {
	
	@Autowired
	private ProjectService service;
	
	@Autowired
	private ResourceService resourceService;
	
	@GetMapping("/list.do")
	public String getList(Model model) {
		
		return "project/list";
	}
	
	@GetMapping("/detail.do")
	public String getProjectById(@RequestParam("projectId") String projectId, Model m) {
		
		m.addAttribute("project", service.getProjectByProjectId(projectId));
		m.addAttribute("pm", service.getPmByProjectId(projectId));
		m.addAttribute("pmo", service.getPmoByProjectId(projectId));
		
		return "project/detail";
	}
	
	@GetMapping("/create.do")
	public String getCreate() {
		
		return "project/create";
	}
	
	@PostMapping(value="/create.do", consumes = "application/json")
	public void createProject(@RequestBody Project project) {
		service.create(project);
	}
	
	@GetMapping("/resource.do")
	public String getResource(@RequestParam("projectId") String projectId, Model m) {
		
		m.addAttribute("projectMember", resourceService.getResourceList(projectId));
		m.addAttribute("allMember", resourceService.getAllResourceList(projectId));
		
		return "project/resource";
	}
	
	@GetMapping("/wbs.do")
	public String getWBS(@RequestParam("projectId") String projectId, Model m) {
		
		return "project/wbs";
	}
	
}
