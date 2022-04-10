package com.project.pms.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.pms.approval.service.ApprovalService;
import com.project.pms.output.service.OutputService;
import com.project.pms.project.repository.ProjectDAO;
import com.project.pms.project.vo.DeptType;
import com.project.pms.project.vo.Link;
import com.project.pms.project.vo.Pm;
import com.project.pms.project.vo.Project;
import com.project.pms.project.vo.ProjectSearchCriteria;
import com.project.pms.project.vo.ProjectStatus;
import com.project.pms.project.vo.ProjectType;
import com.project.pms.project.vo.RndType;
import com.project.pms.project.vo.Task;
import com.project.pms.resource.service.ResourceService;
import com.project.pms.resource.vo.Resource;
import com.project.pms.risk.service.RiskService;

@Service
public class ProjectService {

	@Autowired
	private ProjectDAO dao;
	
	@Autowired
	private ResourceService service;
	
	@Autowired
	private RiskService riskService;
	
	@Autowired
	private OutputService outputService;
	
	@Autowired
	private ApprovalService approvalService;
	
	public List<Project> getList(ProjectSearchCriteria sc) {
		return dao.getList(sc);
	}
	
	@Transactional
	public void create(Project project) {
		dao.insertProject(project);
		
		String projectId = dao.getProjectMaxId();
		Resource resource = new Resource();
		resource.setEmpId(project.getPmoId());
		resource.setProjectId(projectId);
		
		service.insertResource(resource);
	}

	public List<RndType> getRndType() {
		return dao.getRndType();
	}

	public List<ProjectType> getProjectType() {
		return dao.getProjectType();
	}

	public List<Pm> getPmByDeptId(Integer deptId) {
		return dao.getPmByDeptId(deptId);
	}

	public List<DeptType> getDeptType() {
		return dao.getDeptType();
	}

	public List<Pm> getPmoByDeptId(Integer deptId) {
		return dao.getPmoByDeptId(deptId);
	}

	public Project getProjectByProjectId(String projectId) {
		
		return dao.getProjectByProjectId(projectId);
	}

	public Pm getPmByProjectId(String projectId) {
		
		return dao.getPmByProjectId(projectId);
	}

	public Pm getPmoByProjectId(String projectId) {
		
		return dao.getPmoByProjectId(projectId);
	}
	
	@Transactional
	public void modifyProject(Project project) {
		
		dao.modifyProject(project);
		service.insertResource(new Resource(project.getProjectId(), project.getPmoId()));
	}

	public void saveTask(Task task) {
		
		dao.saveTask(task);
	}

	public List<Task> getTasks(String projectId) {
		
		return dao.getTasks(projectId);
	}

	public void saveLink(Link link) {
		
		dao.saveLink(link);
	}
	
	public List<Link> getLinks(String projectId) {
		
		return dao.getLinks(projectId);
	}

	public Integer getLinkMaxId() {
		
		return dao.getLinkMaxId();
	}

	public void deleteLink(Integer linkId) {
		dao.deleteLink(linkId);
	}

	public Integer getTaskMaxId() {
		
		return dao.getTaskMaxId();
	}

	public void updateTask(Task task) {
		
		dao.updateTask(task);
	}

	public void deleteTask(Integer taskId) {
		
		dao.deleteTask(taskId);
	}

	public List<ProjectStatus> getProjectStatus() {
		
		return dao.getProjectStatus();
	}
	
	@Transactional
	public void deleteTaskByProjectId(String projectId) {
		
		List<Task> list = dao.getTasks(projectId);
		
		// 산출물과 작업승인 목록 삭제
		if (list.size() > 0) {
			for (Task t : list) {
				outputService.deleteOutputWithFileByTaskId(t.getId());
				approvalService.deleteApprovalByTaskId(t.getId());
			}
		}
	}
	
	@Transactional
	public int deleteProject(String projectId) {
		// * 연관관계 모두 삭제
		// 1. 리스크 삭제 (파일포함)
		riskService.deleteRiskByProjectId(projectId);
		// 2. 산출물 및 작업승인 목록 삭제
		deleteTaskByProjectId(projectId);
		// 3. 태스크 삭제
		dao.deleteTaskByProjectId(projectId);
		// 4. 리소스 삭제
		service.removeResourceByProjectId(projectId);
		// 5. 프로젝트 삭제
		int result = dao.deleteProject(projectId);
		
		return result;
	}

	public int getProjectCount(ProjectSearchCriteria sc) {
		
		return dao.getProjectCount(sc);
	}

}
