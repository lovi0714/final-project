package com.project.pms.resource.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.ObjectUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

import com.project.pms.resource.service.ResourceService;
import com.project.pms.resource.vo.Resource;

@EnableWebMvc
@RequestMapping("/resource/api/*")
@RestController
public class ResourceAPI {
	
	@Autowired
	private ResourceService service;
	
	@ResponseBody
	@GetMapping(value = "/projectMember.do")
	public List<Resource> getResourceList(@RequestParam("projectId") String projectId) {
		
		return service.getResourceList(projectId);
	}
	
	@ResponseBody
	@GetMapping(value = "/getAllMember.do")
	public List<Resource> getAllResourceList(@RequestParam("projectId") String projectId) {
		
		return service.getAllResourceList(projectId);
	}
	
	@ResponseBody
	@PostMapping(value = "/addMember.do", consumes = "application/json")
	public void insertReource(@RequestBody Resource resource) {
		
		service.insertResource(resource);
	}
	
	@ResponseBody
	@PostMapping(value = "/removeMember.do", consumes = "application/json")
	public void removeResource(@RequestBody Resource resource) {
		System.out.println("removeResource has been called.......... " + resource);
		service.removeResource(resource);
	}
	
	
}
