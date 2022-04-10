package com.project.pms.project.api;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

import com.project.pms.project.service.ProjectService;
import com.project.pms.project.vo.DeptType;
import com.project.pms.project.vo.Link;
import com.project.pms.project.vo.PageMaker;
import com.project.pms.project.vo.Pm;
import com.project.pms.project.vo.Project;
import com.project.pms.project.vo.ProjectStatus;
import com.project.pms.project.vo.ProjectType;
import com.project.pms.project.vo.RndType;
import com.project.pms.project.vo.ProjectSearchCriteria;
import com.project.pms.project.vo.Task;


@EnableWebMvc
@RequestMapping("/project/api/*")
@RestController
public class ProjectAPI {
	
	@Autowired
	private ProjectService service;
	
	@ResponseBody
	@GetMapping(value = "/list.do")
	public Map<String, Object> getList(ProjectSearchCriteria sc, HttpServletRequest request) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		int start = sc.getStart() + 1;
		int length = sc.getStart() + 10;
		
		sc.setStart(start);
		sc.setLength(length);
		
		List<Project> list = service.getList(sc);
		int size = service.getProjectCount(sc);
		
		map.put("data", list);
		map.put("iTotalRecords", size);
		map.put("iTotalDisplayRecords", size);
		map.put("start", sc.getStart());
		map.put("length", sc.getLength());
		
		System.out.println(sc);
		
		return map;
	}
	
	@ResponseBody
	@PostMapping(value = "/delete")
	public ResponseEntity<String> deleteProject(String projectId) {
		
		int result = service.deleteProject(projectId);
		
		return result == 1 ? ResponseEntity.ok("success") : ResponseEntity.badRequest().body("fail");
	}
	
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
	@GetMapping("/status.do")
	public List<ProjectStatus> getProjectStatus() {
		
		return service.getProjectStatus(); 
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
		
		service.modifyProject(project);
	}
	
	@GetMapping(value = "/wbs/{projectId}/link", consumes="application/json")
	@ResponseBody
	public List<Link> getLinks(@PathVariable String projectId) {
	
		return service.getLinks(projectId);
	}
	
	@PostMapping(value = "/wbs/{projectId}/link", consumes="application/json")
	@ResponseBody
	public void addLink(@RequestBody Link link, @PathVariable String projectId) {
		
		link.setProjectId(projectId);
		service.saveLink(link);
	}
	
	@DeleteMapping(value = "/wbs/{projectId}/link/{linkId}", consumes="application/json")
	@ResponseBody
	public void deleteLink(@PathVariable Integer linkId) {
		
		service.deleteLink(linkId);
	}
	
	@GetMapping(value = "/wbs/{projectId}", consumes="application/json")
	@ResponseBody
	public List<Task> getTasks(@PathVariable String projectId) {
	
		return service.getTasks(projectId);
	}
	
	@PostMapping(value = "/wbs/{projectId}/task", consumes="application/json")
	@ResponseBody
	public void addTask(@RequestBody Task task, @PathVariable String projectId) {
	
		task.setStart_date(task.getStart_date().toString().split(" ")[0]);
		task.setEnd_date(task.getEnd_date().toString().split(" ")[0]);
		if(task.getApprover() == null) {	//approver 공백입력시 null 처리
			task.setApprover(null);
		}
		if(task.getManager() == null) {	//manager 공백입력시 null 처리
			task.setManager(null);
		}
		
		task.setProjectId(projectId);

		System.out.println(task);
		service.saveTask(task);
	}
	
	@PutMapping(value = "/wbs/{projectId}/task/{taskId}", consumes="application/json")
	@ResponseBody
	public void updateTask(@RequestBody Task task, @PathVariable Integer taskId) {
	
		task.setStart_date(task.getStart_date().toString().split(" ")[0]);
		task.setEnd_date(task.getEnd_date().toString().split(" ")[0]);
		if(task.getApprover() == null) {	//approver 공백입력시 null 처리
			task.setApprover(null);
		}
		if(task.getManager() == null) {	//manager 공백입력시 null 처리
			task.setManager(null);
		}
		
		task.setId(taskId);
		
		service.updateTask(task);
	}
	
	@DeleteMapping(value = "/wbs/{projectId}/task/{taskId}", consumes="application/json")
	@ResponseBody
	public void deleteTask(@PathVariable Integer taskId) {
		
		service.deleteTask(taskId);
	}
	
	@GetMapping(value = "/wbs/link/maxId")
	@ResponseBody
	public Integer getLinkMaxId() {

		return service.getLinkMaxId();
	}
	
	@GetMapping(value = "/wbs/task/maxId")
	@ResponseBody
	public Integer getTaskMaxId() {

		return service.getTaskMaxId();
	}
}
