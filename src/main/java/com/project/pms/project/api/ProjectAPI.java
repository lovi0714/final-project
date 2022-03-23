package com.project.pms.project.api;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

import com.project.pms.project.service.ProjectService;
import com.project.pms.project.vo.DeptType;
import com.project.pms.project.vo.Pm;
import com.project.pms.project.vo.Project;
import com.project.pms.project.vo.ProjectType;
import com.project.pms.project.vo.RndType;


@EnableWebMvc
@RequestMapping("/project/api/*")
@RestController
public class ProjectAPI {
	
	@Autowired
	private ProjectService service;
	
	@ResponseBody
	@GetMapping("/rndType.do")
	public List<RndType> getRndType() {
		
		return service.getRndType(); 
	}
	
	@ResponseBody
	@GetMapping("/projectType.do")
	public List<ProjectType> getProjectType() {
		
		return service.getProjectType(); 
	}
	
	@ResponseBody
	@GetMapping("/deptType.do")
	public List<DeptType> getDeptType() {
		
		return service.getDeptType(); 
	}
	
	@ResponseBody
	@GetMapping("/pm/{id}.do")
	public List<Pm> getPmByDeptId(@PathVariable("id") Integer deptId) {
		System.out.println("deptId : " + deptId);
		
		return service.getPmByDeptId(deptId); 
	}
	
	@ResponseBody
	@GetMapping("/pmo/{id}.do")
	public List<Pm> getPmoByDeptId(@PathVariable("id") Integer deptId) {
		
		return service.getPmoByDeptId(deptId); 
	}
	
	@ResponseBody
	@PostMapping(value = "/modify.do", consumes="application/json")
	public void modifyProject(@RequestBody Project project) {
		System.out.println(project);
		service.modifyProject(project);
	}
}
